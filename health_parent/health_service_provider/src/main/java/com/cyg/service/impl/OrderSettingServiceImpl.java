package com.cyg.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.cyg.dao.OrderSettingDao;
import com.cyg.pojo.OrderSetting;
import com.cyg.service.OrderSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * @author CuiYuangeng
 * @create 2022-02-21 14:25
 */
@Service(interfaceClass = OrderSettingService.class)
@Transactional
public class OrderSettingServiceImpl implements OrderSettingService {

    @Autowired
    OrderSettingDao orderSettingDao;

    /**
     * 批量导入预约设置数据
     *
     * @param list
     */
    @Override
    public void add(List<OrderSetting> list) {
        if (list != null && list.size() > 0) {
            for (OrderSetting orderSetting : list) {
                // 判断当前日期是否已经进行了预约设置
                long countByOrderDate = orderSettingDao.findCountByOrderDate(orderSetting.getOrderDate());
                if (countByOrderDate > 0) {
                    // 已经进行了预约设置，执行更新操作
                    orderSettingDao.editNumberByOrderDate(orderSetting);
                } else {
                    // 没有进行预约设置，执行插入操作
                    orderSettingDao.add(orderSetting);
                }
            }
        }
    }

    /**
     * 根据月份查询预约数据
     *
     * @param date yyyy-MM-dd
     * @return
     */
    @Override
    public List<Map> getOrderSettingByMonth(String date) {
        String dateBegin = date + "-1";//2019-3-1
        String dateEnd = date + "-31";//2019-3-31
        Map map = new HashMap();
        map.put("begin", dateBegin);
        map.put("end", dateEnd);
        List<OrderSetting> list = orderSettingDao.getOrderSettingByMonth(map);
        List<Map> data = new ArrayList<>();
        for (OrderSetting orderSetting : list) {
            Map orderSettingMap = new HashMap();
            orderSettingMap.put("date", orderSetting.getOrderDate().getDate());//获得日期（几号）
            orderSettingMap.put("number", orderSetting.getNumber());//可预约人数
            orderSettingMap.put("reservations", orderSetting.getReservations());//已预约人数
            data.add(orderSettingMap);
        }
        return data;
    }

    /**
     * 根据日期设置对应的预约设置数据
     *
     * @param orderSetting
     */
    @Override
    public void editNumberByDate(OrderSetting orderSetting) {
        Date date = orderSetting.getOrderDate();
        long count = orderSettingDao.findCountByOrderDate(date);
        // 有数据
        if (count > 0) {
            // 更新
            orderSettingDao.editNumberByOrderDate(orderSetting);
        } else {
            // 插入
            orderSettingDao.add(orderSetting);
        }
    }
}
