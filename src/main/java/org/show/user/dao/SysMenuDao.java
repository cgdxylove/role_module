package org.show.user.dao;

import java.util.List;
import java.util.Map;

public interface SysMenuDao {
    public List<Map<String,Object>> queryMenuListAll(Map map);

    public List<Map<String,Object>> queryMenuPage(Map map);

    public int countMenu(Map map);

}