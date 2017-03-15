package com.cj.serviceImpl;

import com.cj.dao.RolePermissionDAO;
import com.cj.service.RolePermissionService;
import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.permission.WildcardPermission;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Created by interface on 2017/2/27.
 */
@Service
public class RolePermissionServiceImpl implements RolePermissionService {
    @Resource
    private RolePermissionDAO dao;
    @Override
    public Collection<Permission> queryAllPermissionByRoleName(String roleName) {
        List<String> permissionList = dao.queryAllPermissionByRoleName(roleName);
        List<Permission> permissions = new ArrayList<Permission>();
        for(String p : permissionList){
            Permission permission = new WildcardPermission(p);
            permissions.add(permission);
        }
        return permissions;
    }
}
