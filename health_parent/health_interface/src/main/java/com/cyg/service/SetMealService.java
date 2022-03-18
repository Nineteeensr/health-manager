package com.cyg.service;

import com.cyg.entity.PageResult;
import com.cyg.entity.QueryPageBean;
import com.cyg.pojo.Setmeal;

import java.util.List;

/**
 * @author CuiYuangeng
 * @create 2022-02-20 14:15
 */
public interface SetMealService {
    /**
     * 添加套餐
     * @param setMeal
     * @param checkgroupIds
     */
    void add(Setmeal setMeal, Integer[] checkgroupIds);

    /**
     * 分页查询
     * @param queryPageBean
     * @return
     */
    PageResult pageQuery(QueryPageBean queryPageBean);

    List<Setmeal> findAll();

    Setmeal findById(Integer id);

}
