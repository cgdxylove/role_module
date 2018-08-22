package org.show.user.service.impl;

import org.show.user.bean.Menu;
import org.show.user.dao.SysMenuDao;
import org.show.user.dao.SysUserDao;
import org.show.user.service.SysUserLoginService;
import org.show.user.util.OrgStringUtill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SysUserLoginServiceImpl implements SysUserLoginService {
    @Autowired
    private SysMenuDao sysMenuDao ;
    @Autowired
    private SysUserDao userDao ;

    @Override
    public List<Menu> queryLoginMenuList(Map map) {
        List<Menu> list = sysMenuDao.queryLoginMenuList(map);
        List menuList = new ArrayList();
        Menu menu = new Menu();
        if(!OrgStringUtill.isEmpty(list)){
            for(Menu bean : list){
                String level = bean.getLevel();
                if("1".equals(level)){//
                    menu.setState("open");
                    bean.setChildren(getChildrenMenus(bean.getId(),list));
                    menuList.add(bean);
                }
            }
        }
        return menuList;
    }

    public List<Menu> getChildrenMenus(String id,List<Menu> list){
        if(list.size()==0){
            return null ;
        }
        List<Menu> childList = new ArrayList<>();
        Map attributeMap = new HashMap();
        for(Menu menu : list){
            String pid = menu.getParentId();
            if(id.equals(pid)){
                if(!OrgStringUtill.isEmpty(menu.getUrl())){
                    attributeMap.put("url",menu.getUrl());
                    menu.setAttribute(attributeMap);
                }
                menu.setState("open");
                if("1".equals(menu.getLevel())){
                    menu.setChildren(getChildrenMenus(menu.getId(),list));
                }
                childList.add(menu);
            }
        }
        return childList ;
    }


    @Override
    public Map<String, Object> getLoginUser(Map map) {
        return userDao.getLoginUser(map);
    }
}