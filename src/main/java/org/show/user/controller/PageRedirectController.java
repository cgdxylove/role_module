package org.show.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Lenovo on 2018/8/8.
 */
@Controller
@RequestMapping(value = "/sys")
public class PageRedirectController {

    @RequestMapping(value = "/gotoSysMenu")
    public String gotoSysMenu(HttpServletRequest request, HttpServletResponse response){

        return "sys/sys_menu";
    }
}