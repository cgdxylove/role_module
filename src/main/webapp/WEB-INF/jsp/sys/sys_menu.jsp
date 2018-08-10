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
	<title>系统_菜单管理</title>
	<link rel="stylesheet" type="text/css" href="static/plugins/jquery-easyui-1.5.5.5/themes/bootstrap/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="static/plugins/jquery-easyui-1.5.5.5/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="static/plugins/bootstrap/css/bootstrap.css"/>

	<script type="text/javascript" src="static/plugins/jquery/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="static/plugins/jquery-easyui-1.5.5.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="static/plugins/jquery-easyui-1.5.5.5/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="static/plugins/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="static\js\sys\sys_menu.js"></script>
</head>
<body>
<div class="common-container">
	<%--<div class="">
		<form class="form-search" id="">
			<label>菜单名称：</label>
			<input type="text" class="search-query">
			<label>请求路径URL</label>
			<input type="text" class="search-query">
			<button type="button" class="btn btn-primary text-right" style="" onclick="searchInvoice();">查询</button>
		</form>
	</div>--%>
	<table id="datagrid">
	</table>
	<div id="toolbar">
		<form class="form-inline" role="form">
			<div class="input-group input-group-sm">
				<span class="input-group-addon">名称</span>
				<input type="text" class="form-control" id="name" placeholder="">
			</div>
			<div class="input-group input-group-sm">
				<span class="input-group-addon">路径URL</span>
				<input type="text" class="form-control" id="URL" placeholder="">
			</div>
			<button type="submit" class="btn btn-info">提交</button>
		</form>
		<ul>
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#datagrid').edatagrid('addRow')">New</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#datagrid').edatagrid('destroyRow')">Destroy</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#datagrid').edatagrid('saveRow')">Save</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#datagrid').edatagrid('cancelRow')">Cancel</a>
		</ul>
	</div>
</div>
</body>
</html>