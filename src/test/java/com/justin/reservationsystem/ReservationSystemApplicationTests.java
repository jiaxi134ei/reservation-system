package com.justin.reservationsystem;

import com.justin.reservationsystem.mapper.SysMenuMapper;
import com.justin.reservationsystem.mapper.SysRoleMapper;
import com.justin.reservationsystem.mapper.SysUserMapper;
import com.justin.reservationsystem.model.SysMenu;
import com.justin.reservationsystem.model.SysRole;
import com.justin.reservationsystem.model.SysUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ReservationSystemApplicationTests {
    @Resource
    SysUserMapper userMapper;
    @Resource
    SysRoleMapper roleMapper;
    @Resource
    SysMenuMapper menuMapper;

    @Test
    public void contextLoads() {
    }

    @Test
    public void test01(){
        SysUser user = userMapper.getSysUserByUsername("admin");
        System.out.println(user.getName());
    }
    @Test
    public void test02(){
        List<SysRole> roles = roleMapper.listRoles("1");
        System.out.println(roles.get(0).getRoleType());
    }
    @Test
    public void test03(){
        List<SysMenu> menus = menuMapper.listMenus("1");
        for (SysMenu menu:menus){
            System.out.println(menu.getPermission());
        }
    }
}
