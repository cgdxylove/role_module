package org.show.user.dao;

import org.show.user.bean.Menu;

import java.util.List;
import java.util.Map;

public interface SysMenuDao {
    public List<Map<String,Object>> queryMenuListAll(Map map);

    /**
     * 菜单管理分页
     * @param map
     * @return
     */
    public List<Map<String,Object>> queryMenuPage(Map map);

    public int countMenu(Map map);

    /**
     * 登录获取权限菜单
     * @param map
     * @return
     */
    public List<Menu>  queryLoginMenuList(Map map);
}