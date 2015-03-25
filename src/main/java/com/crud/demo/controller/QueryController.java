package com.crud.demo.controller;

import com.crud.demo.dao.Query;
import com.crud.demo.dao.QuerySecond;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * author : lch
 * date : 2015/3/4
 * depiction :
 */
@Controller
public class QueryController {

    @Autowired
    private Query query;

    @Autowired
    private QuerySecond query2;

    @RequestMapping("/data")
    @ResponseBody
    public List queryData(String tableName) {
        return query.findAll(tableName);
    }

    @RequestMapping("/cols")
    @ResponseBody
    public String[] queryCols(String tableName) {
//        String[] clos = {"clos1", "cols2"};
        return query.findCols(tableName);
//        return query.findAll("record");
    }

    @RequestMapping({"/file"})
    @ResponseBody
    public String readFile(String path) {
        StringBuilder content = new StringBuilder();
        try {
            File file = new File(path);
//            final File file = new ClassPathResource(path).getFile();
            List fileList = FileUtils.readLines(file);
            for (int i = 0; i < fileList.size(); i++) {
                content.append(new StringBuilder().append((String) fileList.get(i)).append("<br />").toString());
            }
        } catch (IOException e) {
            e.printStackTrace();
            //ignore
        }
        return content.toString();
    }


    @RequestMapping("/data2")
    @ResponseBody
    public List queryData2(String tableName) {
        return query2.findAll(tableName);
    }

    @RequestMapping("/cols2")
    @ResponseBody
    public String[] queryCols2(String tableName) {
//        String[] clos = {"clos1", "cols2"};
        return query2.findCols(tableName);
//        return query.findAll("record");
    }



}
