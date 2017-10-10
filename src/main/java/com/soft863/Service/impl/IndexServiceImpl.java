package com.soft863.Service.impl;

import com.soft863.Service.IndexService;
import com.soft863.dao.IndexDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class IndexServiceImpl implements IndexService {

    @Autowired
    private IndexDao indexDao;

    public List<Map<String, Object>> queryForList() {
        return indexDao.queryForList();
    }
}
