package project.demo.dao.impl;

import org.springframework.stereotype.Repository;
import project.demo.dao.UserInfoDao;
import project.demo.model.UserInfo;

@Repository
public class UserInfoDaoImpl extends GenericDaoImpl<UserInfo, Integer> implements UserInfoDao {
}
