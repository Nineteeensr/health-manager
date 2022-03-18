package com.cyg.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.cyg.dao.CheckItemDao;
import com.cyg.entity.PageResult;
import com.cyg.entity.QueryPageBean;
import com.cyg.pojo.CheckItem;
import com.cyg.service.CheckItemService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author CuiYuangeng
 * @create 2022-02-17 20:56
 */
@Service(interfaceClass = CheckItemService.class)
@Transactional
public class CheckItemServiceImpl implements CheckItemService {

    @Resource
    private CheckItemDao checkItemDao;

    /**
     * 添加检查项
     * @param checkItem
     */
    @Override
    public void add(CheckItem checkItem) {
        checkItemDao.add(checkItem);
    }

    /**
     * 分页模糊查询
     * @param queryPageBean
     * @return
     */
    @Override
    public PageResult pageQuery(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();
        PageHelper.startPage(currentPage, pageSize);
        Page<CheckItem> page = checkItemDao.selectAllCheckItem(queryString);
        long total = page.getTotal();
        List<CheckItem> rows = page.getResult();
        return new PageResult(total, rows);
    }

    /**
     * 根据id删除检查组,删除前去中间表检查是否被关联
     * @param id
     */
    @Override
    public void deleteById(Integer id) {
        long count = checkItemDao.findCountByCheckItemId(id);
        if (count > 0) { // 检查项被关联到检查组不能删除
            new RuntimeException();
        } else {
            checkItemDao.deleteById(id);
        }
    }

    /**
     * 根据id查询检查项
     * @param id
     * @return
     */
    @Override
    public CheckItem queryCheckItemById(Integer id) {
        CheckItem checkItem = checkItemDao.queryCheckItem(id);
        return checkItem;
    }

    /**
     * 修改检查项信息
     * @param checkItem
     */
    @Override
    public void updateInfo(CheckItem checkItem) {
        checkItemDao.updateCheckItem(checkItem);
    }

    /**
     * 查询所有检查项
     * @return
     */
    @Override
    public List<CheckItem> findAll() {
        return checkItemDao.findAll();
    }
}
