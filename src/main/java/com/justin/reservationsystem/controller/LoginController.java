package com.justin.reservationsystem.controller;

import com.justin.reservationsystem.model.SysUser;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @Description TODO
 * Created by JiaBiao on 2019/06/28 下午 5:04
 */
@Controller
@RequestMapping("/auth")
public class LoginController {

    @PostMapping("/login")
    public String submitLogin(String username, String password, HttpServletRequest request, Model model) {
        try {
            UsernamePasswordToken token = new UsernamePasswordToken(username,password);
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
            SysUser user = (SysUser) subject.getPrincipal();
        } catch (UnknownAccountException e) {
            //账号不存在和下面密码错误一般都合并为一个账号或密码错误，这样可以增加暴力破解难度
            model.addAttribute("message", "账号不存在！");
            return "login";
        } catch (DisabledAccountException e) {
            model.addAttribute("message", "账号未启用！");
            return "login";
        } catch (IncorrectCredentialsException e) {
            model.addAttribute("message", "密码错误！");
            System.out.println("密码错误！");
            return "login";
        } catch (Throwable e) {
            model.addAttribute("message", "未知错误！");
            return "login";
        }
        // 执行到这里说明用户已登录成功
        return "redirect:/auth/index";

    }

    @GetMapping("/login")
    public String loginPage(){
        return "login";
    }

    @RequestMapping("/403")
    public String unauthorizedRole(){
        System.out.println("------没有权限-------");
        return "/user/403";
    }

    @RequestMapping("/logout")
    public String logOut(HttpSession session) {
        SecurityUtils.getSubject().logout();
        return "/user/login";
    }
    @RequestMapping("/index")
    public String index(){
        return "layout/footer";
    }
}
