package com.justin.reservationsystem.mapper;

import ch.qos.logback.classic.net.server.HardenedLoggingEventInputStream;
import com.justin.reservationsystem.model.SysRole;

import java.util.List;

public interface SysRoleMapper {
    int deleteByPrimaryKey(String id);

    int insert(SysRole record);

    int insertSelective(SysRole record);

    SysRole selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);

    List<SysRole> listRoles(String userId);
}