package project.demo.dao.impl;

import org.springframework.stereotype.Repository;
import project.demo.dao.UserDao;
import project.demo.model.User;

@Repository
public class UserDaoImpl extends GenericDaoImpl<User, Integer> implements UserDao {
}
