package project.demo.service.impl;

import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.demo.dao.GenericDao;
import project.demo.dao.UserDao;
import project.demo.dao.UserInfoDao;
import project.demo.model.User;
import project.demo.model.UserInfo;
import project.demo.service.UserService;

import java.text.SimpleDateFormat;
import java.util.Date;

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

    private User queryUserByEmail(String email) {
        return userDao.queryOne("queryUserByEmail", email);
    }

    @Override
    public boolean signUp(User user) {
        /*
        1. checkEmail
            1.1 return false
        2. signUp
            2.1 password encrypted
            2.2 create user (id email password)
            2.3 create userInfo (id createTime, userId)
            2.4 return true
         */
        if (queryUserByEmail(user.getEmail()) != null) {
            return false;
        }
        StrongPasswordEncryptor strongPasswordEncryptor = new StrongPasswordEncryptor();
        user.setPassword(strongPasswordEncryptor.encryptPassword(user.getPassword()));
        userDao.create(user);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = simpleDateFormat.format(new Date());
        int userId = user.getId();
        UserInfo userInfo = new UserInfo(createTime, userId);
        userInfoDao.create(userInfo);
        return true;
    }
}
