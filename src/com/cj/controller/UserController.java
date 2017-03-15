package com.cj.controller;

import com.cj.bean.User;
import com.cj.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;

import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    public String Login(User user, HttpSession session){
        UsernamePasswordToken token = new UsernamePasswordToken(user.getEmail(),new Md5Hash(user.getPwd()).toBase64());
        Subject subject = SecurityUtils.getSubject();
        session.setAttribute("user", user);
        try{
            subject.login(token);
        }catch(AuthorizationException exception){
            logger.info(new String("登入失败,"));
            return "index/index";
        }catch(UnknownAccountException exception){
            logger.info( new String("不存在该账号"));
            return "index/index";
        }catch(IncorrectCredentialsException exception){
            logger.info(new String("密码错误"));
            return "index/index";
        }catch(AuthenticationException exception){
            logger.info( new String("身份验证失败，账号或密码错误"));
            return "index/index";
        }
        return "layout_full_screen";
    }
    @RequestMapping(value="exit",method=RequestMethod.GET)
    public String exit(){
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "index/index";
    }
}
