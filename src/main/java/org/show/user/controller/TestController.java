package org.show.user.controller;

import org.show.user.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
public class TestController {

    @Autowired
    private TestService testService ;

    @RequestMapping(value = "/test")
    public String Test(HttpServletRequest request, HttpServletResponse response){
        System.out.println("==========");
        Map<String,Object> map = testService.testService();
        return "test/test";
    }
}