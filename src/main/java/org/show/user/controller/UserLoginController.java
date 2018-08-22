package org.show.user.controller;

import com.alibaba.fastjson.JSON;
import org.show.user.bean.Menu;
import org.show.user.service.SysMenuService;
import org.show.user.service.SysUserLoginService;
import org.show.user.util.OrgStringUtill;
import org.show.user.util.PropertiesName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/login")
public class UserLoginController {
    @Autowired
    private SysMenuService sysMenuService ;
    @Autowired
    private SysUserLoginService userLoginService;

    @RequestMapping(value = "/userLogin")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String,Object> paramMap){
            ModelAndView mv = new ModelAndView();
            if(OrgStringUtill.isEmpty(paramMap.get("userName"))||OrgStringUtill.isEmpty(paramMap.get("passWord"))){
                String msg = "用户名密码不能为空！";
                mv.addObject("msg",msg);
                mv.setViewName("main/login");
                return mv ;
            }
            Map<String,Object> userMap = userLoginService.getLoginUser(paramMap);
            //如果用户名密码不正确
            if(OrgStringUtill.isEmpty(userMap)||OrgStringUtill.isEmpty(userMap.get("user_id"))){
                String msg = "用户名密码错误！";
                mv.addObject("msg",msg);
                mv.setViewName("main/login");
            }else{
                //是否做成单点登录？
                //是否激活
                //是否禁用
                //正常
                HttpSession session = request.getSession();
                session.setAttribute(PropertiesName.USERINFO,userMap);
                mv.addObject("userName",userMap.get("user_name"));
                mv.setViewName("/main/main");
            }
            return mv ;
    }

    @RequestMapping(value = "/getMenus")
    @ResponseBody
    public String queryMenuListAll(HttpServletRequest request, HttpSession session){
        Map<String,Object> userMap = (Map) session.getAttribute(PropertiesName.USERINFO);
        List<Menu> list = userLoginService.queryLoginMenuList(userMap);
        if (list ==null)
            return null ;
        else
            return JSON.toJSONString(list);
    }

}