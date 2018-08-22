<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>登陆页面</title>
    <link rel="stylesheet" type="text/css" href="static/plugins/jquery-easyui-1.5.5.5/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="static/plugins/jquery-easyui-1.5.5.5/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="static/plugins/bootstrap/css/bootstrap.css"/>

    <script type="text/javascript" src="static/plugins/jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="static/plugins/jquery-easyui-1.5.5.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="static/plugins/jquery-easyui-1.5.5.5/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="static/plugins/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        function submmit(){
            debugger ;
            if(document.getElementById('userName').value == ""){
                $(".tips_text span").html("&nbsp;&nbsp;登录账号不能为空");
            }else if(document.getElementById('passWord').value == ""){
                $(".tips_text span").html("&nbsp;&nbsp;登录密码不能为空");
            }else{
                $("#form").submit();
            }
        }
    </script>
    <style>
        body{background: url(images/00.jpg)no-repeat;background-size:cover;font-size: 16px;}
        .form{
            background: rgba(255,255,255,0.4);
            padding: 20px;
            padding-left: 40px;
            padding-right: 40px;
        }
    </style>
</head>
<body>
<body>
        <div class="container"style="margin-top: 200px;">
                <form class="col-sm-offset-4col-sm-4 col-sm-offset-4 form form-horizontal " action="<%=basePath%>login/userLogin.do"  method="post" id="login_form" >
                        <h3 class="text-center">用户登录</h3>
                        <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">账&nbsp;号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="userName"name="userName" placeholder="请输入用户名">
                            </div>
                        </div>

                        <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密&nbsp;码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control"id="passWord" name="passWord" placeholder="请输入密码">
                            </div>
                        </div>
                <button class="btn btn-success center-block" onclick="submmit();">登录</button>
                    <div class="tips">
                        <span class="tips_text"><span>&nbsp;&nbsp;${msg}</span></span>
                    </div>
                </form>

        </div>
        </body>
</body>
</html>