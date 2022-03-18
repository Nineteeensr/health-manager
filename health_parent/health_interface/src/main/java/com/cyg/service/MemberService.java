package com.cyg.service;

import com.cyg.pojo.Member;

import java.util.List;
import java.util.Map;

/**
 * @author CuiYuangeng
 * @create 2022-03-07 17:11
 */
public interface MemberService {
    Member findByTelephone(String telephone);

    void add(Member member);

    List<Integer> findMemberCountByMonth(List<String> months);

    List<Map<String,Object>> countBySetmealOfOrder();

}
