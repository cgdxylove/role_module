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
    var _url = node.attribute.url ;
    if($("#contentTabs").tabs("exists", tabName)) {// 如果已存在，选中
        $("#contentTabs").tabs("select", tabName);
        var tab = $("#contentTabs").tabs('getTab',tabName);
        var index = $("#contentTabs").tabs('getTabIndex',tab);
        if(tab && tab.find('iframe').length > 0){
            var _refresh_ifram = tab.find('iframe')[0];
            _refresh_ifram.contentWindow.location.href=_url;
        }
    }else {
        var _content ="<iframe scrolling='auto' frameborder='0' src='"+_url+"' style='width:100%; height:100%'></iframe>";
        $(contentTabs).tabs('add',{
            title:tabName,
            content:_content,
            closable:true
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

