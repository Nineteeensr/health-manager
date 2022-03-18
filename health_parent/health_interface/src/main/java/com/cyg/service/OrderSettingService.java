package com.cyg.service;

import com.cyg.pojo.OrderSetting;

import java.util.List;
import java.util.Map;

/**
 * @author CuiYuangeng
 * @create 2022-02-21 14:18
 */
public interface OrderSettingService {
    void add(List<OrderSetting> list);

    List<Map> getOrderSettingByMonth(String date);

    void editNumberByDate(OrderSetting orderSetting);
}
