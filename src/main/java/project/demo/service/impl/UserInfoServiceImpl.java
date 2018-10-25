package project.demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.demo.dao.GenericDao;
import project.demo.model.UserInfo;
import project.demo.service.UserInfoService;

@Service
public class UserInfoServiceImpl extends GenericServiceImpl<UserInfo, Integer> implements UserInfoService {

    @Override
    @Autowired
    void setGenericDao(GenericDao<UserInfo, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}
