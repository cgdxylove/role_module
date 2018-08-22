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
    <title>主页</title>
    <link rel="stylesheet" type="text/css" href="static/plugins/jquery-easyui-1.5.5.5/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="static/plugins/jquery-easyui-1.5.5.5/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="static/plugins/bootstrap/css/bootstrap.css"/>

    <script type="text/javascript" src="static/plugins/jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="static/plugins/jquery-easyui-1.5.5.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="static/plugins/jquery-easyui-1.5.5.5/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="static/plugins/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="static\js\main\main.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
        });
    </script>
</head>
<body  class="easyui-layout">
<!-- 布局中如果不需要north这个面板，那么可以删掉这个div -->
    <div data-options="region:'north',split:true" style="height:55px;">
        <span style="height: 20px">学而不思则罔，思而不学则殆。</span>

        <a href="javascript:void(0);" style="float: right">
            <img style="height: 20px;width: 28px" src="static/images/main/admin.jpg"/>
        </a>
        <span style="float: right">欢迎您："管理员${userName}"</span>
    </div>

    <div region="west" split="true" title="导航菜单" style="width:150px;">
        <ul id="cdTree" class="easyui-tree">

        </ul>
    </div>
    <div id="content" region="center" data-options="region:'center'">
        <div class="easyui-tabs" id="contentTabs" data-options="fit:true,border:false">
        </div>
    </div>
</body>
</html>