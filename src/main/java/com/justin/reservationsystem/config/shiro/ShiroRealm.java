package com.justin.reservationsystem.config.shiro;

import com.justin.reservationsystem.model.SysMenu;
import com.justin.reservationsystem.model.SysRole;
import com.justin.reservationsystem.model.SysUser;
import com.justin.reservationsystem.service.IMenuService;
import com.justin.reservationsystem.service.IRoleService;
import com.justin.reservationsystem.service.IUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @Description TODO
 * Created by JiaBiao on 2019/06/28 上午 11:19
 */
@Configuration
public class ShiroRealm extends AuthorizingRealm {

    private static Logger logger = LoggerFactory.getLogger(ShiroRealm.class);

    @Resource
    private IUserService userService;
    @Resource
    private IRoleService roleService;
    @Resource
    private IMenuService menuService;

    /**
     *
     * @Description:  认证
     * @Param:
     * @Return:
     * @Auther: JiaBiao
     * @Date:  2019/6/28 0028 上午 11:21
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String username = (String) authenticationToken.getPrincipal();
        SysUser user = userService.getSysUserByUsername(username);

        //未知账户
        if(user == null ) throw new UnknownAccountException();
        if("0".equals(user.getEnable())) {
            throw new LockedAccountException(); //账号锁定
        }

        String password = user.getPassword();
        String salt = user.getSalt();

        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(username,password, ByteSource.Util.bytes(salt),getName());

        //TODO 当验证通过后，把用户信息放在session里
        Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute("userSession", user);
        session.setAttribute("userSessionId", user.getId());

        return info;
    }


    /**
     *
     * @Description: 授权
     * @Param:
     * @Return:
     * @Auther: JiaBiao
     * @Date:  2019/6/28 0028 上午 11:21
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        Session session = SecurityUtils.getSubject().getSession();
        SysUser user = (SysUser) session.getAttribute("userSession");
        String userId = (String) session.getAttribute("userSessionId");
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        List<SysRole> roles = roleService.listRoles(userId);
        Set<String> roless = new HashSet<>();
        Set<String> permiss = new HashSet<>();
        for(SysRole role : roles) {
//            info.addRole(role.getEnname());
            roless.add(role.getEnname());
            List<SysMenu> menus = menuService.listMenus(role.getId());
            for(SysMenu menu:menus){
                if(!StringUtils.isEmpty(menu.getPermission())) permiss.add(menu.getPermission());
            }
        }
        info.addRoles(roless);
        info.addStringPermissions(permiss);
        logger.info("---- 获取到以下权限 ----");
        logger.info(info.getStringPermissions().toString());
        logger.info("---------------- Shiro 权限获取成功 ----------------------");
        return info;
    }
}
