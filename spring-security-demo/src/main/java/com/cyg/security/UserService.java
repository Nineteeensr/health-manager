package com.cyg.security;

import com.cyg.pojo.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author CuiYuangeng
 * @create 2022-03-08 14:28
 */
public class UserService implements UserDetailsService {
    //模拟数据库中的用户数据
    public static Map<String, User> map = new HashMap<>();

    static {
        com.cyg.pojo.User user1 = new com.cyg.pojo.User();
        user1.setUsername("admin");
        user1.setPassword("admin");

        com.cyg.pojo.User user2 = new com.cyg.pojo.User();
        user2.setUsername("xiaoming");
        user2.setPassword("1234");

        map.put(user1.getUsername(), user1);
        map.put(user2.getUsername(), user2);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = map.get(username);
        if (user == null) {
            return null;
        }
        //模拟数据库中的密码，后期需要查询数据库
        String passwordInDb = "{noop}" + user.getPassword();
        List<GrantedAuthority> list = new ArrayList<>();
        //授权，后期需要改为查询数据库动态获得用户拥有的权限和角色
        list.add(new SimpleGrantedAuthority("add"));
        list.add(new SimpleGrantedAuthority("delete"));
        if (username.equals("admin")) {
            list.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        }
        org.springframework.security.core.userdetails.User securityUser = new org.springframework.security.core.userdetails.User(username, passwordInDb, list);
        return securityUser;
    }
}
