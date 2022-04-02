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
        // 根据id查询用户 select * from t_user where username = #{username}
        User user = userDao.findByUsername(username);
        if (user == null) {
            return null;
        }
        Integer userId = user.getId();
        // 根据用户id 去user_role中间表 查询用户对应的角色 得到roles集合 多对多关系
        // select * from t_role r,t_user_role ur where ur.role_id = r.id and ur.user_id = #{userId}
        Set<Role> roles = roleDao.findByUserId(userId);
        // 遍历roles集合 获取每个角色的role_id
        for (Role role : roles) {
            Integer roleId = role.getId();
            // 根据 role_id 去 role_permission（角色对应的权限）中间表 查询角色对应的权限 多对多关系
            // select * from t_permission p, t_role_permission pr where p.id = pr.permission_id and pr.role_id = #{roleId}
            Set<Permission> permissionss = permissionDao.findByRoleId(roleId);
            role.setPermissions(permissionss);
        }
        user.setRoles(roles);
        return user;
    }
}
