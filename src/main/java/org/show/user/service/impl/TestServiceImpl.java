package org.show.user.service.impl;

import org.show.user.dao.TestDao;
import org.show.user.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Lenovo on 2018/8/7.
 */
@Service
public class TestServiceImpl implements TestService{

    @Autowired
    private TestDao testDao ;

    @Override
    public Map<String, Object> testService() {
        List<Map<String,Object>> list = testDao.queryUserList() ;
        return list==null?null:list.get(0);
    }
}