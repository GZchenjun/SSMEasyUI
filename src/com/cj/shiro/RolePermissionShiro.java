package com.cj.shiro;

import com.cj.service.RolePermissionService;
import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.permission.RolePermissionResolver;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.Collection;

/**
 * Created by interface on 2017/2/27.
 */
@Controller(value="RolePermission")
public class RolePermissionShiro implements RolePermissionResolver {
    @Resource
    private RolePermissionService rolePermissionService;
    @Override
    public Collection<Permission> resolvePermissionsInRole(String roleName) {
        return rolePermissionService.queryAllPermissionByRoleName(roleName);
    }
}
