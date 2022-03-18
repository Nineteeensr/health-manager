package com.cyg.controller;

import com.cyg.constant.MessageConstant;
import com.cyg.constant.RedisMessageConstant;
import com.cyg.entity.Result;
import com.cyg.utils.ValidateCodeUtils;
import com.cyg.utils.ZhenZiYunSMSUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.JedisPool;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author CuiYuangeng
 * @create 2022-02-28 16:56
 */
@RestController
@RequestMapping("/validateCode")
public class ValidateCodeController {

    @Resource
    private JedisPool jedisPool;

    /**
     * 用户体检预约发送验证码
     *
     * @param telephone 手机号
     * @return
     */
    @RequestMapping("/send4Order")
    public Result send4Order(@RequestParam String telephone) {
        // 随机生成四位验证码
        Integer validateCode = ValidateCodeUtils.generateValidateCode(4);
        Map map = new HashMap();
        map.put("validateCode", validateCode.toString());
        // 发送验证码
        try {
            ZhenZiYunSMSUtils.sendMessage(ZhenZiYunSMSUtils.VALIDATE_CODE, telephone, map);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.SEND_VALIDATECODE_FAIL);
        }
        // 验证码存到redis 设置失效时间(5 min)
        jedisPool.getResource().setex(telephone + RedisMessageConstant.SENDTYPE_ORDER, 300, validateCode.toString());
        return new Result(true, MessageConstant.SEND_VALIDATECODE_SUCCESS);
    }

    /**
     * 手机快速登录
     *
     * @param telephone
     * @return
     */
    @RequestMapping("/send4Login")
    public Result send4Login(@RequestParam String telephone) {
        // 随机生成六位验证码
        Integer validateCode = ValidateCodeUtils.generateValidateCode(6);
        Map map = new HashMap();
        map.put("validateCode", validateCode.toString());
        try {
            ZhenZiYunSMSUtils.sendMessage(ZhenZiYunSMSUtils.VALIDATE_CODE, telephone, map);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.SEND_VALIDATECODE_FAIL);
        }
        jedisPool.getResource().setex(telephone + RedisMessageConstant.SENDTYPE_LOGIN, 300, validateCode.toString());
        return new Result(true, MessageConstant.SEND_VALIDATECODE_SUCCESS);
    }
}
