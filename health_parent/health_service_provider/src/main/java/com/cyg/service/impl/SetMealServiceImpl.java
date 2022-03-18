package com.cyg.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.cyg.constant.RedisConstant;
import com.cyg.dao.SetMealDao;
import com.cyg.entity.PageResult;
import com.cyg.entity.QueryPageBean;
import com.cyg.pojo.Setmeal;
import com.cyg.service.SetMealService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import redis.clients.jedis.JedisPool;

import java.io.File;
import java.io.FileWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author CuiYuangeng
 * @create 2022-02-20 14:18
 */
@Service(interfaceClass = SetMealService.class)
@Transactional
public class SetMealServiceImpl implements SetMealService {
    @Autowired
    private SetMealDao setMealDao;
    @Autowired
    private JedisPool jedisPool;
    @Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;
    /**
     *     读取properties文件属性
     */
    @Value("${out_put_path}")
    private String outPutPath;

    /**
     * 添加套餐
     * 关联检查组
     *
     * @param setMeal
     * @param checkgroupIds
     */
    @Override
    public void add(Setmeal setMeal, Integer[] checkgroupIds) {
        setMealDao.add(setMeal);
        Integer setmealId = setMeal.getId();
        // 操作中间表
        setSetmealAndCheckGroup(setmealId, checkgroupIds);
        // 将图片名称添加到redis
        String img = setMeal.getImg();
        jedisPool.getResource().sadd(RedisConstant.SETMEAL_PIC_DB_RESOURCES, img);
        // 当添加套餐后生成静态页面（套餐列表页面，套餐详情页面）
        generateMobileStaticHtml();
    }

    /**
     * 生成移动端静态页面
     */
    private void generateMobileStaticHtml() {
        // 查询模板文件中所需的数据
        List<Setmeal> setmealList = this.findAll();
        // 生成套餐列表静态页面
        generateMobileSetmealListHtml(setmealList);
        // 生成套餐详情静态页面（多个）
        generateMobileSetmealDetailHtml(setmealList);
    }

    /**
     * 生成套餐列表静态页面
     *
     * @param setmealList
     */
    private void generateMobileSetmealListHtml(List<Setmeal> setmealList) {
        Map<String, Object> map = new HashMap<>();
        map.put("setmealList", setmealList);
        generateHtml("mobile_setmeal.ftl", "m_setmeal.html", map);
    }

    /**
     * 生成套餐详情静态页面（可能有多个）
     *
     * @param setmealList
     */
    private void generateMobileSetmealDetailHtml(List<Setmeal> setmealList) {
        for (Setmeal setmeal : setmealList) {
            Map<String, Object> dataMap = new HashMap<String, Object>();
            dataMap.put("setmeal", this.findById(setmeal.getId()));
            generateHtml("mobile_setmeal_detail.ftl", "setmeal_detail_" + setmeal.getId() + ".html", dataMap);
        }
    }

    /**
     * 通用生成静态页面
     *
     * @param templateName 模板名
     * @param htmlPageName 生成的页面名
     * @param map          数据模型
     */
    public void generateHtml(String templateName, String htmlPageName, Map map) {
        // 获得配置对象
        Configuration configuration = freeMarkerConfigurer.getConfiguration();
        Writer out = null;
        try {
            Template template = configuration.getTemplate(templateName);
            out = new FileWriter(new File(outPutPath + "/" + htmlPageName));
            // 输出文件
            template.process(map, out);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                if (null != out){
                    out.flush();
                }
            }catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

    /**
     * 分页查询
     *
     * @param queryPageBean
     * @return
     */
    @Override
    public PageResult pageQuery(QueryPageBean queryPageBean) {
        PageHelper.startPage(queryPageBean.getCurrentPage(), queryPageBean.getPageSize());
        Page<Setmeal> page = setMealDao.findAll(queryPageBean.getQueryString());
        return new PageResult(page.getTotal(), page.getResult());
    }

    @Override
    public List<Setmeal> findAll() {
        return setMealDao.selectAll();
    }

    /**
     * 根据套餐id查询套餐详情（套餐基本信息，套餐对应的检查组信息，检查组对应的检查项信息）
     *
     * @param id
     * @return
     */
    @Override
    public Setmeal findById(Integer id) {
        return setMealDao.findById(id);
    }

    /**
     * 中间表
     *
     * @param setmealId
     * @param checkgroupIds
     */
    public void setSetmealAndCheckGroup(Integer setmealId, Integer[] checkgroupIds) {
        Map<String, Integer> map = new HashMap<>();
        if (checkgroupIds != null && checkgroupIds.length > 0) {
            for (Integer checkgroupId : checkgroupIds) {
                map.put("setmealId", setmealId);
                map.put("checkgroupId", checkgroupId);
                setMealDao.setSetMealAndCheckGroup(map);
            }
        }
    }
}
