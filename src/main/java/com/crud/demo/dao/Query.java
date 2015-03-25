package com.crud.demo.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * author : lch
 * date : 2015/3/4
 * depiction :
 */
@Repository("query")
public class Query {

    @Resource(name="jdbcTemplate")
    private JdbcTemplate jdbcTemplate;

    public List<Map<String,String>> findAll(String tableName) {
        String querySql = "SELECT * FROM %s";
        List result = jdbcTemplate.queryForList(String.format(querySql, tableName));
        return result;
    }

    public String[] findCols(String tableName) {
        String querySql = "SHOW FULL COLUMNS FROM %s";
        List<String> resultList = new ArrayList<String>();
        List<Map<String,Object>> result = jdbcTemplate.queryForList(String.format(querySql, tableName));
        for (Map<String,Object> map : result) {
            resultList.add(map.get("Field").toString());
        }
        return resultList.toArray(new String[]{});
    }
}
