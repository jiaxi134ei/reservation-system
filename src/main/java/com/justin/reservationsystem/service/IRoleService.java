package com.justin.reservationsystem.service;

import com.justin.reservationsystem.model.SysRole;

import java.util.List;

/**
 * @Description TODO
 * Created by JiaBiao on 2019/06/28 下午 3:35
 */
public interface IRoleService {

    public List<SysRole> listRoles(String userId);
}
