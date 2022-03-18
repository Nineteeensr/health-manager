package com.cyg.dao;

import com.cyg.pojo.Setmeal;
import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author CuiYuangeng
 * @create 2022-02-20 14:20
 */
public interface SetMealDao {
    void add(Setmeal setmeal);
    void setSetMealAndCheckGroup(Map map);

    Page<Setmeal> findAll(@Param("queryString") String queryString);

    List<Setmeal> selectAll();

    Setmeal findById(Integer id);
}
