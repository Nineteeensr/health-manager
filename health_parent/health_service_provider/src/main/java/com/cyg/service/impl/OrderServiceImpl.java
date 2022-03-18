package com.cyg.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.cyg.constant.MessageConstant;
import com.cyg.dao.MemberDao;
import com.cyg.dao.OrderDao;
import com.cyg.dao.OrderSettingDao;
import com.cyg.entity.Result;
import com.cyg.pojo.Member;
import com.cyg.pojo.Order;
import com.cyg.pojo.OrderSetting;
import com.cyg.service.OrderService;
import com.cyg.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author CuiYuangeng
 * @create 2022-03-03 19:06
 */
@Service
public class OrderServiceImpl implements OrderService {

    private OrderSettingDao orderSettingDao;

    private MemberDao memberDao;

    private OrderDao orderDao;

    @Autowired
    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    @Autowired
    public void setMemberDao(MemberDao memberDao) {
        this.memberDao = memberDao;
    }

    @Autowired
    public void setOrderSettingDao(OrderSettingDao orderSettingDao) {
        this.orderSettingDao = orderSettingDao;
    }

    /**
     * 预约
     *
     * @param map
     * @return
     */
    @Override
    public Result order(Map map) throws Exception {
        // 1. 检查用户所选择的预约日期是否已经提前进行了预约设置，如果没有设置则无法进行预约
        String orderDateString = (String) map.get("orderDate");
        Date orderDate = DateUtils.parseString2Date(orderDateString);
        OrderSetting orderSetting = orderSettingDao.findByOrderDate(orderDate);
        if (orderSetting == null) {
            // 指定日期没有进行预约设置，无法完成预约
            return new Result(false, MessageConstant.SELECTED_DATE_CANNOT_ORDER);
        }
        // 2. 检查用户所选择的预约日期是否已经约满，如果已经约满则无法预约
        // 可预约人数
        int number = orderSetting.getNumber();
        // 已预约人数
        int reservations = orderSetting.getReservations();
        if (reservations >= number) {
            return new Result(false, MessageConstant.ORDER_FULL);
        }
        // 3. 检查用户是否重复预约（同一个用户在同一天预约了同一个套餐），如果是重复预约则无法完成再次预约
        String telephone = (String) map.get("telephone");
        Member member = memberDao.findByTelephone(telephone);
        if (member != null) {
            // 判断是否重复预约
            Integer memberId = member.getId();
            String setmealId = (String) map.get("setmealId");
            Order order = new Order(memberId, orderDate, Integer.parseInt(setmealId));
            List<Order> list = orderDao.findByCondition(order);
            if (!list.isEmpty()) {
                // 重复预约
                return new Result(false, MessageConstant.HAS_ORDERED);
            }
        } else {
            // 4. 检查当前用户是否为会员，如果是会员则直接完成预约，如果不是会员则自动完成注册并进行预约
            member = new Member();
            member.setName((String) map.get("name"));
            member.setPhoneNumber(telephone);
            member.setIdCard((String) map.get("idCard"));
            member.setSex((String) map.get("sex"));
            member.setRegTime(new Date());
            memberDao.add(member);
        }
        // 5. 预约成功，更新当日的已预约人数
        Order order = new Order();
        order.setMemberId(member.getId());
        order.setOrderDate(orderDate);
        order.setOrderType((String) map.get("orderType"));
        order.setOrderStatus(Order.ORDERSTATUS_NO);
        order.setSetmealId(Integer.parseInt((String) map.get("setmealId")));
        orderDao.add(order);
        orderSetting.setReservations(reservations + 1);
        orderSettingDao.editReservationsByOrderDate(orderSetting);
        return new Result(true, MessageConstant.ORDER_SUCCESS, order.getId());
    }

    /**
     * 根据预约ID查询预约相关信息(体检人姓名，预约日期，套餐名称，预约类型)
     *
     * @param id
     * @return
     */
    @Override
    public Map findById(Integer id) throws Exception {
        Map map = orderDao.findById4Detail(id);
        if (!map.isEmpty()) {
            Date orderDate = (Date) map.get("orderDate");
            map.put("orderDate", DateUtils.parseDate2String(orderDate));
        }
        return map;
    }
}
