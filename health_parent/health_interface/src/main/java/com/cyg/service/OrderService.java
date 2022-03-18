package com.cyg.service;

import com.cyg.entity.Result;

import java.util.Map;

/**
 * @author CuiYuangeng
 * @create 2022-03-02 19:07
 */
public interface OrderService {
    /**
     * 预约
     * @param map
     * @return
     */
    Result order(Map map) throws Exception;

    /**
     * 根据id查询预约信息，包括体检人信息、套餐信息
     * @param id
     * @return
     */
    Map findById(Integer id) throws Exception;
}
