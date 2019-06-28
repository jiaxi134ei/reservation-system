package com.justin.reservationsystem.service.impl;

import com.justin.reservationsystem.mapper.SysRoleMapper;
import com.justin.reservationsystem.model.SysRole;
import com.justin.reservationsystem.service.IRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description TODO
 * Created by JiaBiao on 2019/06/28 下午 3:36
 */
@Service
public class RoleServiceImpl implements IRoleService {
    @Resource
    private SysRoleMapper roleMapper;

    @Override
    public List<SysRole> listRoles(String userId) {
        return roleMapper.listRoles(userId);
    }
}
