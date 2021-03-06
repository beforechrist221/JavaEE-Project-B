package project.demo.service;

import project.demo.model.User;

public interface UserService extends GenericService<User, Integer> {

    User queryUserByEmail(String email);

    boolean signUp(User user);

    User signIn(User user);

}
