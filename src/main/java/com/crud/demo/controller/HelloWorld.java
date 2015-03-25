package com.crud.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * author : lch
 * date : 2015/3/4
 * depiction :
 */
@Controller
public class HelloWorld {

    @RequestMapping("/hi")
    @ResponseBody
    public String sayHi() {
        return "Hello,world";
    }


//    @RequestMapping("/data")
//    @ResponseBody
//    public Map<String, String> data() {
//        Map<String, String> map = new HashMap<String, String>();
//        map.put("package", "1");
//        map.put("section", "1");
//        map.put("size", "1");
//        map.put("architecture", "1");
//        return map;
//    }
}
