package org.show.user.service;

import java.util.List;
import java.util.Map;

public interface SysMenuService {
    public List<Map<String,Object>> queryMenuListAll(Map paramMap);

    public Map queryMenuListPage(Map paramMap);
}