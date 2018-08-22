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
	<%--<script type="text/javascript" src="static\js\sys\sys_menu.js"></script>--%>
	<script type="text/javascript">
        $(function(){
            setHeight();
            loadDatagrid();
        });
        $(window).resize(function(){
            setHeight();
        });

        function setHeight(){
            $(".common-container").height($(window).height()-8);
        }
        function loadDatagrid(){
            $("#datagrid").datagrid({
                url : 'sysMenuData/queryMenuListPage.do',
                fit : true, // 自适应上级容器 高度和宽度
                rownumbers : true, //若设置为 true，则显示带有行号的列。默认为false
                fitColumns : true, //设置为 true，则会自动扩大或缩小列的尺寸以适应网格的宽度并且防止水平滚动。默认为false
                checkOnSelect:true, //若设置为 true，当用户点击某一行时，则会选中/取消选中复选框。若设置为 false 时，只有当用户点击了复选框时，才会选中/取消选中复选框。默认为true
                resizable : true, //设置为 true，则允许该列可调整尺寸
                striped : true, // 设置为 true，则把行条纹化。（即奇偶行使用不同背景色）默认为false
                singleSelect:false, //设置为 true，则只允许选中一行。默认为false
                remoteSort:false, //定义是否从服务器排序数据
                toolbar:'#toolbar',
                method : "post",
                loadMsg : "正在请求数据...",
                columns : [[
                    {
                        field : 'menu_id',
                        checkbox:true
                    },
                    {
                        title : '菜单名称',
                        field : 'menu_name',
                        width : 100,
                        align : "center"
                    },
                    {
                        title : 'URL',
                        field : 'menu_url',
                        width : 60,
                        align : "center"
                    },
                    {
                        title : '上级菜单',
                        field : 'menu_pid',
                        width : 80,
                        align : "center"
                    },
                    {
                        title : '录入时间',
                        field : 'lrsj',
                        width : 80,
                        align : "center"/*,
					 formatter: function(value,rowData,rowIndex){
					 if(rowData.lrsj!=null && rowData.lrsj!="null" && ""!=rowData.lrsj && undefined!=typeof(rowData.lrsj)){
					 return lrsj.substring(0,19);
					 }else{
					 return "" ;
					 }
					 }*/
                    },
                    {
                        title : '操作',
                        field : 'operation',
                        width : 60,
                        align : "center",
                        formatter: function(value,rowData,rowIndex){
                            var str = '<span  value="分配按钮"  onclick="viewMessage('+rowIndex+')"></span>';
                            return "test";
                        }
                    }
                ]],
				/* 设置 datagrid属性******* */
                showHeader : true, // 定义是否显示行头。
                showFooter : true, // 定义是否显示行脚。
                pagination : true,
                pagePosition : "bottom", // 'top'，'bottom'，'both'
                pageNumber : 1, // 初始化页码 默认第1页
                pageSize : 15, // 每页显示的记录条数，初始化页面尺寸
                pageList : [ 10,15, 30 ],
                rowStyler:function(index,row){
                    if(index%2==1){
                        return 'background:#f6f7fa'
                    }else{
                        return 'background:#fff'
                    }
                },
                onLoadSuccess : function(data) {

                }
            });
        }

        //查询
        function searchInvoice(){
			/*
			 var title=$("#title").val();
			 var readyFlag=$('#readyFlag').combobox('getValue');
			 var type=$('#type').combobox('getValue');
			 var startTime=$('#startTime').datebox('getValue');
			 var endTime=$('#endTime').datebox('getValue');
			 $("#datagrid").datagrid("load",{
			 title:title,readyFlag:readyFlag,type:type,startTime:startTime,endTime:endTime
			 });
			 */
            $("#datagrid").datagrid("load",{});
        }

        //组合查询重置
        function resetAll(){
            $("#title").textbox("setValue","");
            $("#readyFlag").combobox("setValue","");
            $("#type").combobox("setValue","");
            $("#startTime").datebox("setValue","");
            $("#endTime").datebox("setValue","");
        }

        //删除
        function deleteMessage(){
            var selections = $('#datagrid').datagrid('getSelections');
            var str='';
            if(selections.length>0){
                for(var i=0;i < selections.length;i++){
                    str +=  selections[i].id+',';
                }
            }
            if(str==''){
                layer.msg("请选择删除数据",{
                    shade:[0.1,"#fff"],
                    shadeClose:false,
                    zIndex:99999
                });
                return false;
            }
            var id=str.substr(0,str.length-1);
            layer.confirm("是否删除该条信息？",{
                    icon:3,
                    title:"提示",
                    shade:[0.1,"#fff"],
                    shadeClose:false,
                    zIndex:99999
                }, function(index){
                    $.ajax({
                        url: 'message/doDelectMessage.do',
                        type: "POST",
                        dataType:'json',
                        data:{"id":id},
                        success: function(data){
                            layer.msg(data.returnMsg,{
                                shade:[0.1,"#fff"],
                                shadeClose:false,
                                zIndex:99999
                            });
                            $("#datagrid").datagrid('reload');
                        },
                        error: function(XMLHttpRequest, textStatus, errorThrown) {
                        }
                    });
                }
            );
        }

        function viewMessage(index){
            alert(index);
            return  ;
			/*$.ajax({
			 url: '',
			 type: "POST",
			 dataType:'json',
			 data:{"menu_id":row.menu_id},
			 success: function(data){
			 },
			 error: function(XMLHttpRequest, textStatus, errorThrown) {
			 }
			 });*/
        }
	</script>

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