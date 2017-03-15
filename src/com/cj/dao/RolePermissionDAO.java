package com.cj.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by interface on 2017/2/27.
 */
@Repository
public interface RolePermissionDAO {
    public List<String> queryAllPermissionByRoleName(String roleName);
}
