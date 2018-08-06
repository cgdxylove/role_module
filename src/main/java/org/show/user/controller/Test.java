package org.show.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class Test {

    @RequestMapping(value = "/test")
    @ResponseBody
    public String Test(HttpServletRequest request, HttpServletResponse response){
        System.out.println("==========");
        return "111";
    }
}