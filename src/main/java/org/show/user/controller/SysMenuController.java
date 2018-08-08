package org.show.user.controller;

import com.alibaba.fastjson.JSON;
import org.show.user.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "sysMenuData")
public class SysMenuController {
    @Autowired
    private SysMenuService sysMenuService ;

    @RequestMapping(value = "queryMenuListAll")
    @ResponseBody
    public String queryMenuListAll(HttpServletRequest request, HttpServletResponse response
            ,@RequestParam Map<String, Object> param){
        List<Map<String,Object>> list = sysMenuService.queryMenuListAll(param);
        if (list ==null)
            return null ;
        else
            return JSON.toJSONString(list);
    }
}