package com.cyg.dao;

import com.cyg.pojo.User;

/**
 * @author CuiYuangeng
 * @create 2022-03-09 16:49
 */
public interface UserDao {
    User findByUsername(String username);
}
