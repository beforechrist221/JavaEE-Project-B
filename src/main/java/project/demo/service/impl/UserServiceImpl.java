package project.demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.demo.dao.GenericDao;
import project.demo.model.User;
import project.demo.service.UserService;

@Service
public class UserServiceImpl extends GenericServiceImpl<User, Integer> implements UserService {

    @Override
    @Autowired
    void setGenericDao(GenericDao<User, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}
