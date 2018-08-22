package org.show.user.service.impl;

import org.show.user.dao.SysMenuDao;
import org.show.user.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SysMenuServiceImpl implements SysMenuService {
    @Autowired
    private SysMenuDao sysMenuDao ;

    public List<Map<String,Object>> queryMenuListAll(Map paramMap){
        return sysMenuDao.queryMenuListAll(paramMap);
    }

    @Override
    public Map queryMenuListPage(Map paramMap) {
        int count = sysMenuDao.countMenu(paramMap);
        int currentPage = Integer.valueOf(paramMap.get("page").toString());
        int pageSize = Integer.valueOf(paramMap.get("rows").toString());
        int start = (currentPage-1)*pageSize ;
        paramMap.put("start",start);
        paramMap.put("pageSize",pageSize);
        List<Map<String, Object>> pageList =  sysMenuDao.queryMenuPage(paramMap);
        Map map = new HashMap();
        map.put("rows",pageList);
        map.put("total",count);
        return map ;
    }
}