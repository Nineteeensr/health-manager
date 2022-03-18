package com.cyg.dao;

import com.cyg.pojo.OrderSetting;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author CuiYuangeng
 * @create 2022-02-21 14:27
 */
public interface OrderSettingDao {

    void add(OrderSetting orderSetting);

    void editNumberByOrderDate(OrderSetting orderSetting);

    long findCountByOrderDate(Date orderDate);

    List<OrderSetting> getOrderSettingByMonth(Map<String, String> map);

    OrderSetting findByOrderDate(Date date);
    void editReservationsByOrderDate(OrderSetting orderSetting);
}
