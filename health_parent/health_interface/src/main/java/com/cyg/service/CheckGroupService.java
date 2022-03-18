package com.cyg.service;

import com.cyg.entity.PageResult;
import com.cyg.entity.QueryPageBean;
import com.cyg.pojo.CheckGroup;

import java.util.List;

/**
 * @author CuiYuangeng
 * @create 2022-02-18 17:16
 */
public interface CheckGroupService {
    void add(CheckGroup checkGroup, Integer[] checkitemIds);

    void setCheckGroupAndCheckItem(Integer checkGroupId, Integer[] checkitemIds);

    PageResult findPage(QueryPageBean queryPageBean);

    CheckGroup findById(Integer id);

    List<Integer> findCheckItemIdsByCheckGroupId(Integer id);

    void edit(CheckGroup checkGroup, Integer[] checkitemIds);

    void delById(Integer id);

    List<CheckGroup> findAll();
}
