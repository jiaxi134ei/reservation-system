package com.justin.reservationsystem.service;

import com.justin.reservationsystem.model.SysMenu;

import java.util.List;

/**
 * @Description TODO
 * Created by JiaBiao on 2019/06/28 下午 3:48
 */
public interface IMenuService {

    List<SysMenu> listMenus(String roleId);
}
