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
        fitColumns : false, //设置为 true，则会自动扩大或缩小列的尺寸以适应网格的宽度并且防止水平滚动。默认为false
        checkOnSelect:true, //若设置为 true，当用户点击某一行时，则会选中/取消选中复选框。若设置为 false 时，只有当用户点击了复选框时，才会选中/取消选中复选框。默认为true
        resizable : true, //设置为 true，则允许该列可调整尺寸
        striped : false, // 设置为 true，则把行条纹化。（即奇偶行使用不同背景色）默认为false
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
                title : '操作',
                field : 'operation',
                width : 60,
                align : "center",
                formatter: function(value,rowData,rowIndex){
                    var str = '<button class="" title="分配按钮" onclick="viewMessage('+rowIndex+')"></button>';
                    return str;
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
        pageList : [ 10,15, 30, 45 ],
        rowStyler:function(index,row){},
        onLoadSuccess : function(data) { }
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
    alert();
    return  ;
    $.ajax({
        url: '',
        type: "POST",
        dataType:'json',
        data:{"menu_id":row.menu_id},
        success: function(data){
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
        }
    });
}
