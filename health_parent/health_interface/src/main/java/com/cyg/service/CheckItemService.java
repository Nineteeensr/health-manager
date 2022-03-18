package com.cyg.service;

import com.cyg.entity.PageResult;
import com.cyg.entity.QueryPageBean;
import com.cyg.pojo.CheckItem;

import java.util.List;

/**
 * 服务接口
 * @author CuiYuangeng
 * @create 2022-02-17 20:50
 */
public interface CheckItemService {
    /**
     * 添加检查项
     * @param checkItem
     */
    void add(CheckItem checkItem);

    /**
     * 检查项分页查询
     * @return
     */
    PageResult pageQuery(QueryPageBean queryPageBean);

    void deleteById(Integer id);

    CheckItem queryCheckItemById(Integer id);

    void updateInfo(CheckItem checkItem);

    List<CheckItem> findAll();

}
