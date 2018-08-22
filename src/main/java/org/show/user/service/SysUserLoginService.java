package org.show.user.service;

import org.show.user.bean.Menu;

import java.util.List;
import java.util.Map;

public interface SysUserLoginService {
    public List<Menu> queryLoginMenuList(Map map);
    public Map<String,Object> getLoginUser(Map map);
}