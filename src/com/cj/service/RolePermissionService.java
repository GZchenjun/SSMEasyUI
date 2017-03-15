package com.cj.service;

import org.apache.shiro.authz.Permission;

import java.util.Collection;

/**
 * Created by interface on 2017/2/27.
 */
public interface RolePermissionService {
    public Collection<Permission> queryAllPermissionByRoleName(String roleName);

}
