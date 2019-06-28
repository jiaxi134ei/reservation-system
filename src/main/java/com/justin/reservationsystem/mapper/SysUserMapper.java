package com.justin.reservationsystem.mapper;

import com.justin.reservationsystem.model.SysUser;

public interface SysUserMapper {
    SysUser getSysUserByUsername(String username);
}