package com.justin.reservationsystem.service.impl;

import com.justin.reservationsystem.mapper.SysUserMapper;
import com.justin.reservationsystem.model.SysUser;
import com.justin.reservationsystem.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Description TODO
 * Created by JiaBiao on 2019/06/28 下午 2:33
 */
@Service
public class UserServiceImpl implements IUserService {
    @Resource
    private SysUserMapper userMapper;

    @Override
    public SysUser getSysUserByUsername(String username) {
        return userMapper.getSysUserByUsername(username);
    }
}
