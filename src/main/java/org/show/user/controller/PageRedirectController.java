package org.show.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Lenovo on 2018/8/8.
 */
@Controller
@RequestMapping(value = "/sys")
public class PageRedirectController {

    @RequestMapping(value = "/login")
    public ModelAndView gotoLogin(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main/login");
        return mv;
    }
    /**
     * 主页
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/gotoMain")
    public ModelAndView gotoMain(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main/main");
        return mv;
    }

    /**
     * 菜单管理
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/gotoSysMenu")
    public String gotoSysMenu(HttpServletRequest request, HttpServletResponse response){
        return "sys/sys_menu";
    }

}