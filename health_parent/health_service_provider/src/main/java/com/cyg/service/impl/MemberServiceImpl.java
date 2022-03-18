package com.cyg.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.cyg.dao.MemberDao;
import com.cyg.pojo.Member;
import com.cyg.service.MemberService;
import com.cyg.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author CuiYuangeng
 * @create 2022-03-07 17:24
 */
@Service(interfaceClass = MemberService.class)
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDao memberDao;

    @Override
    public Member findByTelephone(String telephone) {
        return memberDao.findByTelephone(telephone);
    }

    @Override
    public void add(Member member) {
        String password = member.getPassword();
        if (!StringUtils.isEmpty(password)) {
            // MD5加密
            String passwordMD5 = MD5Utils.md5(password);
            member.setPassword(passwordMD5);
        }
        memberDao.add(member);
    }

    @Override
    public List<Integer> findMemberCountByMonth(List<String> months) {
        List<Integer> memberCount = new ArrayList<>();
        for (String month : months) {
            String date = month + ".31";
            Integer count = memberDao.findMemberCountBeforeDate(date);
            memberCount.add(count);
        }
        return memberCount;
    }

    @Override
    public List<Map<String, Object>> countBySetmealOfOrder() {
       List<Map<String,Object>> setmealCount = memberDao.countBySetmealOfOrder();
        return setmealCount;
    }
}
