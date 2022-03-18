package com.cyg.dao;

import com.cyg.pojo.Permission;

import java.util.Set;

/**
 * @author CuiYuangeng
 * @create 2022-03-09 16:54
 */
public interface PermissionDao {
    Set<Permission> findByRoleId(Integer roleId);
}
