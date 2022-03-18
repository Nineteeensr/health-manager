package com.cyg.service;

import com.cyg.pojo.User;

/**
 * @author CuiYuangeng
 * @create 2022-03-09 15:55
 */
public interface UserService {
    User findByUsername(String username);
}
