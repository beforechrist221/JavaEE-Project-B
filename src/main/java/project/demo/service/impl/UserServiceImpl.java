package project.demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.demo.dao.GenericDao;
import project.demo.dao.UserDao;
import project.demo.dao.UserInfoDao;
import project.demo.model.User;
import project.demo.model.UserInfo;
import project.demo.service.UserService;

@Service
public class UserServiceImpl extends GenericServiceImpl<User, Integer> implements UserService {

    private UserDao userDao;
    private UserInfoDao userInfoDao;

    @Override
    @Autowired
    void setGenericDao(GenericDao<User, Integer> genericDao) {
        super.genericDao = genericDao;
        this.userDao = (UserDao) genericDao;
    }

    @Autowired
    public void setUserInfoDao(UserInfoDao userInfoDao) {
        this.userInfoDao = userInfoDao;
    }

    @Override
    public boolean signUp(User user) {
        // TODO: 10/25/2018
//        1. userDao
//        2. userInfoDao
        return false;
    }
}
