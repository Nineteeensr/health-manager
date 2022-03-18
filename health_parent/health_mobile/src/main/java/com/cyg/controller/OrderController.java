package com.cyg.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.cyg.constant.MessageConstant;
import com.cyg.constant.RedisMessageConstant;
import com.cyg.entity.Result;
import com.cyg.pojo.Order;
import com.cyg.service.OrderService;
import com.cyg.utils.ZhenZiYunSMSUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.JedisPool;

import java.util.HashMap;
import java.util.Map;

/**
 * @author CuiYuangeng
 * @create 2022-03-02 18:49
 */
@RestController
@RequestMapping("/order")
public class OrderController {
    @Reference
    private OrderService orderService;

    private JedisPool jedisPool;

    @Autowired
    public void setJedisPool(JedisPool jedisPool) {
        this.jedisPool = jedisPool;
    }

    /**
     * 在线体检预约
     *
     * @param map
     * @return
     */
    @RequestMapping("/submit")
    public Result submit(@RequestBody Map map) {
        String telephone = (String) map.get("telephone");
        // 从redis中获取保存的验证码
        String redisCode = jedisPool.getResource().get(telephone + RedisMessageConstant.SENDTYPE_ORDER);
        String validateCode = (String) map.get("validateCode");
        // 判断验证码是否一致
        if (validateCode == null || redisCode == null || !validateCode.equals(redisCode)) {
            // 失败返回结果
            return new Result(false, MessageConstant.VALIDATECODE_ERROR);
        }
        // 成功去预约
        // 设置预约类型：微信预约，电话预约
        map.put("orderType", Order.ORDERTYPE_WEIXIN);
        Result result = null;
        try {
            result = orderService.order(map);
        } catch (Exception e) {
            e.printStackTrace();
            return result;
        }
        // 预约成功后发送短信
        if (result.isFlag()) {
            Map map1 = new HashMap();
            String orderDate = (String) map.get("orderDate");
            map1.put("orderDate", orderDate);
            map1.put("memberName", map.get("name").toString());
            ZhenZiYunSMSUtils.sendMessage(ZhenZiYunSMSUtils.ORDER_NOTICE, telephone, map1);
        }
        return result;
    }

    /**
     * 根据id查询预约信息，包括套餐信息和会员信息
     * @param id
     * @return
     */
    @RequestMapping("/findById")
    public Result findById(Integer id) {
        Map map = null;
        try {
            map = orderService.findById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_ORDER_FAIL);
        }
        return new Result(true, MessageConstant.QUERY_ORDER_SUCCESS,map);
    }
}
