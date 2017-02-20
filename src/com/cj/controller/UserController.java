package com.cj.controller;

import com.cj.bean.User;
import com.cj.common.bean.EncryptUtil;
import com.cj.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by interface on 2017/2/19.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;
    private Logger logger = LoggerFactory.getLogger(UserController.class);
    @RequestMapping(value="login",method= RequestMethod.POST)
    public String Lgoin(User user, HttpSession session){
        user.setPwd(EncryptUtil.md5Encrypt(user.getPwd()));
        User u = userService.queryByLogin(user);
        session.setAttribute("user",u);
        if(u != null){
            logger.info("登入成功");
            return "layout_full_screen";
        }
        logger.info("登入失败");
        return "index/index";
    }
    @RequestMapping(value="exit",method=RequestMethod.GET)
    public String exit(HttpSession session){
        session.removeAttribute("user");
        logger.info("退出登入");
        return "index/index";
    }
}
