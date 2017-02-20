package com.cj.serviceImpl;

import com.cj.bean.User;
import com.cj.common.bean.Pager4EasyUI;
import com.cj.dao.UserDAO;
import com.cj.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

/**
 * Created by interface on 2017/2/19.
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDAO userDAO;
    @Override
    public List<User> queryAll() {
        return null;
    }

    @Override
    public User queryById(Serializable id) {
        return null;
    }

    @Override
    public void add(User user) {

    }

    @Override
    public void update(User user) {

    }

    @Override
    public void deleteById(Serializable id) {

    }

    @Override
    public Pager4EasyUI<User> queryByPagerAndCriteria(Pager4EasyUI<User> pager, User user) {
        return null;
    }

    @Override
    public int countByCriteria(User user) {
        return 0;
    }

    @Override
    public User queryByLogin(User user) {
        return userDAO.queryByLogin(user);
    }
}
