$(document).ready(function(){
    //初始化菜单
    $('#cdTree').tree({
        url:"/login/getMenus.do",
        onDblClick:function(node){
            if(node.attribute.url){
                openLeftWin(node);
            }
        }
    });
});

function openLeftWin(node) {
    var tabName = node.text;
    if($("#content").tabs("exists", tabName)) {// 如果已存在，选中
        $("#content").tabs("select", tabName);
    }else {
        $("#content").tabs("add", {
            title : tabName,
            selected : true,
            closable : true,
            href : node.attribute.url,//此处可动态跳转页面,在加载的json、或者后台数据中组合添加属性即可
            tools : [ {  //加载刷新小按钮
                iconCls : "icon-page_refresh",//应该使用8*8像素图片,没有找到8*8
                handler : function() {
                    var currentTab = $("#content").tabs('getSelected');
                    refreshTab(currentTab);
                }
            } ]
        });
    }
}

/**
 * 通用刷新tabs方法
 * currentTab 刷新的tabs对象
 */
function refreshTab(currentTab) {
    var url = $(currentTab.panel('options')).attr('href');
    $('#tabs').tabs('update', {
        tab : currentTab,
        options : {
            href : url //重新获取目标页面
        }
    });
    currentTab.panel('refresh');//刷新
}

