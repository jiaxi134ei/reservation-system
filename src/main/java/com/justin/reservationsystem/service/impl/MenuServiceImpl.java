package com.justin.reservationsystem.service.impl;

import com.justin.reservationsystem.mapper.SysMenuMapper;
import com.justin.reservationsystem.model.SysMenu;
import com.justin.reservationsystem.service.IMenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description TODO
 * Created by JiaBiao on 2019/06/28 下午 3:49
 */
@Service
public class MenuServiceImpl implements IMenuService {
    @Resource
    private SysMenuMapper menuMapper;

    @Override
    public List<SysMenu> listMenus(String roleId) {
        return menuMapper.listMenus(roleId);
    }
}
