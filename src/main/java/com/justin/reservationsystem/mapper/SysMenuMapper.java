package com.justin.reservationsystem.mapper;

import com.justin.reservationsystem.model.SysMenu;

import java.util.List;

public interface SysMenuMapper {

    List<SysMenu> listMenus(String roleId);
}