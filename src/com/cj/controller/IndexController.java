package com.cj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by interface on 2017/2/20.
 */
@Controller
@RequestMapping("/")
public class IndexController {

    @RequestMapping(value="index", method = RequestMethod.GET)
    public String index() {
        return "index/index";
    }
}
