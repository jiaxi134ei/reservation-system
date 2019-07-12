package com.justin.reservationsystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description TODO
 * Created by JiaBiao on 2019/07/12 上午 11:34
 */
@Controller
public class TestController {
    @RequestMapping("/header")
    public String header(){
        return "layout/header";
    }
    @RequestMapping("/footer")
    public String defaulthtml(){
        return "layout/fotter";
    }
}
