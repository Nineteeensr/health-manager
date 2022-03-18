package com.cyg.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.cyg.constant.MessageConstant;
import com.cyg.constant.RedisMessageConstant;
import com.cyg.entity.Result;
import com.cyg.pojo.Member;
import com.cyg.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Map;

/**
 * @author CuiYuangeng
 * @create 2022-03-07 17:03
 */
@RequestMapping("/member")
@RestController
public class MemberController {
    @Autowired
    private JedisPool jedisPool;
    @Reference
    private MemberService memberService;

    /**
     * 用户快速登录
     *
     * @param map
     * @param httpServletResponse
     * @return
     */
    @RequestMapping("/login")
    public Result login(HttpServletResponse httpServletResponse, @RequestBody Map map) {
        // 取出手机号
        String telephone = (String) map.get("telephone");
        System.out.println("telephone = " + telephone);
        // 从redis中取出验证码
        String validateCodeInRedis = jedisPool.getResource().get(telephone + RedisMessageConstant.SENDTYPE_LOGIN);
        // 用户输入的验证码
        String validateCode = (String) map.get("validateCode");
        if (!StringUtils.isEmpty(validateCode) && !StringUtils.isEmpty(validateCodeInRedis) && validateCode.equals(validateCodeInRedis)) {
            // 验证码输入正确
            // 判断用户是否为会员
            Member member = memberService.findByTelephone(telephone);
            if (member == null) {
                // 不是会员 自动注册 将用户信息存入member表
                member.setRegTime(new Date());
                member.setPhoneNumber(telephone);
                memberService.add(member);
            }
            // 向客户端浏览器写入Cookie，内容为手机号 跟踪用户
            Cookie cookie = new Cookie("login_member_telephone", telephone);
            // 路径
            cookie.setPath("/");
            // 有效期 三十天
            cookie.setMaxAge(60 * 60 * 24 * 30);
            httpServletResponse.addCookie(cookie);
            // 保存会员信息到Redis中
            String json = JSON.toJSON(member).toString();
            jedisPool.getResource().setex(telephone, 1800, json);
            return new Result(true, MessageConstant.LOGIN_SUCCESS);
        } else {
            return new Result(false, MessageConstant.VALIDATECODE_ERROR);
        }
    }
}
