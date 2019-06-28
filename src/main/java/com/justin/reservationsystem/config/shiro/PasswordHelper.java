package com.justin.reservationsystem.config.shiro;

import com.justin.reservationsystem.model.SysUser;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * @Description TODO
 * Created by JiaBiao on 2019/06/28 下午 3:59
 */
public class PasswordHelper {

    private String algorithName = "md5";
    private int hashIterations = 2;
    public String encryptPassword(SysUser user) {
        String encrptPsww = new SimpleHash(algorithName,user.getPassword(), ByteSource.Util.bytes(user.getSalt()),hashIterations).toHex();
        return encrptPsww;
    }

    public static void main(String[] args) {
        PasswordHelper passwordHelper = new PasswordHelper();
        SysUser sysUser = new SysUser();
        sysUser.setPassword("123456");
        sysUser.setSalt("123456");
        System.out.println(passwordHelper.encryptPassword(sysUser));
    }

}
