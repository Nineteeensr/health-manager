package com.cyg.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.cyg.dao.CheckGroupDao;
import com.cyg.entity.PageResult;
import com.cyg.entity.QueryPageBean;
import com.cyg.pojo.CheckGroup;
import com.cyg.service.CheckGroupService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author CuiYuangeng
 * @create 2022-02-18 17:18
 */
@Service(interfaceClass = CheckGroupService.class)
@Transactional
public class CheckGroupServiceImpl implements CheckGroupService {
    @Resource
    CheckGroupDao checkGroupDao;

    /**
     * 添加检查组
     *
     * @param checkGroup
     * @param checkitemIds
     */
    @Override
    public void add(CheckGroup checkGroup, Integer[] checkitemIds) {
        // 新增检查组，操作t_checkgroup表
        checkGroupDao.add(checkGroup);
        //设置检查组和检查项的多对多关联关系，操作t_checkgroup_checkitem表
        Integer checkGroupId = checkGroup.getId();
        System.out.println("checkGroupId = " + checkGroupId);
        setCheckGroupAndCheckItem(checkGroupId, checkitemIds);
    }

    /**
     * 在中间表中添加数据
     *
     * @param checkGroupId
     * @param checkitemIds
     */
    @Override
    public void setCheckGroupAndCheckItem(Integer checkGroupId, Integer[] checkitemIds) {
        Map<String, Integer> map = new HashMap<>();
        if (checkitemIds != null && checkitemIds.length > 0) {
            for (Integer checkitemId : checkitemIds) {
                map.put("checkgroupId", checkGroupId);
                map.put("checkitemId", checkitemId);
                checkGroupDao.setCheckGroupAndCheckItem(map);
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
    public PageResult findPage(QueryPageBean queryPageBean) {
        PageHelper.startPage(queryPageBean.getCurrentPage(), queryPageBean.getPageSize());
        Page<CheckGroup> page = checkGroupDao.findByCondition(queryPageBean.getQueryString());

        return new PageResult(page.getTotal(), page.getResult());
    }

    /**
     * 根据id查询检查组数据
     *
     * @param id
     * @return
     */
    @Override
    public CheckGroup findById(Integer id) {
        CheckGroup checkGroup = checkGroupDao.findById(id);
        return checkGroup;
    }

    /**
     * 根据检查组id 查询多对多对应关系
     *
     * @param id
     * @return
     */
    @Override
    public List<Integer> findCheckItemIdsByCheckGroupId(Integer id) {
        List<Integer> list = checkGroupDao.findCheckItemByCheckGroupId(id);
        return list;
    }

    /**
     * 修改检查组
     *
     * @param checkGroup
     * @param checkitemIds
     */
    @Override
    public void edit(CheckGroup checkGroup, Integer[] checkitemIds) {
        // 修改检查组基本信息,对应t_checkgroup
        checkGroupDao.edit(checkGroup);
        // 删除checkgroupId对应的中间表信息 对应 t_checkgroup_checkitem
        checkGroupDao.delByCheckGroupId(checkGroup.getId());
        // 重新添加进中间表
        setCheckGroupAndCheckItem(checkGroup.getId(), checkitemIds);
    }

    /**
     * 删除
     * @param id
     */
    @Override
    public void delById(Integer id) {
        checkGroupDao.delByCheckGroupId(id);
        checkGroupDao.deleteCheckGroupById(id);
    }

    @Override
    public List<CheckGroup> findAll() {
        return checkGroupDao.findAll();
    }

}
