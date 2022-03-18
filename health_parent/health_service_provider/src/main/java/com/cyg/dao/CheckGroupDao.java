package com.cyg.dao;

import com.cyg.pojo.CheckGroup;
import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author CuiYuangeng
 * @create 2022-02-18 17:18
 */
public interface CheckGroupDao {
    void add(CheckGroup checkGroup);

    void setCheckGroupAndCheckItem(Map map);

    Page<CheckGroup> findByCondition(@Param("value") String value);

    CheckGroup findById(Integer id);

    List<Integer> findCheckItemByCheckGroupId(Integer id);

    void edit(CheckGroup checkGroup);

    void delByCheckGroupId(Integer id);

    void deleteCheckGroupById(Integer id);

    List<CheckGroup> findAll();

    List<CheckGroup> findCheckGroupById(Integer id);
}
