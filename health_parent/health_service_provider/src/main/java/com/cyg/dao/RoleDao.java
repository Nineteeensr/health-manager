package com.cyg.dao;

import com.cyg.pojo.Role;

import java.util.Set;

/**
 * @author CuiYuangeng
 * @create 2022-03-09 16:51
 */
public interface RoleDao {
    Set<Role> findByUserId(Integer userId);
}
