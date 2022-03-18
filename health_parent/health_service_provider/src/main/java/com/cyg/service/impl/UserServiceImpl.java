package com.cyg.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.cyg.dao.PermissionDao;
import com.cyg.dao.RoleDao;
import com.cyg.dao.UserDao;
import com.cyg.pojo.Permission;
import com.cyg.pojo.Role;
import com.cyg.pojo.User;
import com.cyg.service.UserService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Set;

/**
 * @author CuiYuangeng
 * @create 2022-03-09 16:46
 */
@Service(interfaceClass = UserService.class)
@Transactional
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;
    @Resource
    private RoleDao roleDao;
    @Resource
    private PermissionDao permissionDao;

    @Override
    public User findByUsername(String username) {
        User user = userDao.findByUsername(username);
        if (user == null) {
            return null;
        }
        Integer userId = user.getId();
        Set<Role> roles = roleDao.findByUserId(userId);
        for (Role role : roles) {
            Integer roleId = role.getId();
            Set<Permission> permissionss = permissionDao.findByRoleId(roleId);
            role.setPermissions(permissionss);
        }
        user.setRoles(roles);
        return user;
    }
}
