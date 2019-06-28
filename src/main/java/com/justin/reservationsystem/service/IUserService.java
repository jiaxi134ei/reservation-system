package com.justin.reservationsystem.service;

import com.justin.reservationsystem.model.SysUser;

/**
 * @Description TODO
 * Created by JiaBiao on 2019/06/28 下午 2:32
 */
public interface IUserService {

    public SysUser getSysUserByUsername(String username);
}
