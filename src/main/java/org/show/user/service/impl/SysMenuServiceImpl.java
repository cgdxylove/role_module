package org.show.user.service.impl;

import org.show.user.dao.SysMenuDao;
import org.show.user.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SysMenuServiceImpl implements SysMenuService {
    @Autowired
    private SysMenuDao sysMenuDao ;

    public List<Map<String,Object>> queryMenuListAll(Map paramMap){
        return sysMenuDao.queryMenuListAll(paramMap);
    }
}