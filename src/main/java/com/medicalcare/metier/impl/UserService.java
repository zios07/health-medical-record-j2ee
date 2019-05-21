package com.medicalcare.metier.impl;

import com.medicalcare.dao.IUserDao;
import com.medicalcare.dao.impl.UserDao;
import com.medicalcare.metier.IUserService;
import com.medicalcare.model.User;

public class UserService implements IUserService {

    private IUserDao userDao = new UserDao();

    @Override
    public User createUser(User user) {
        return user;
    }

    @Override
    public User updateUser(User user) {
        return user;
    }

    @Override
    public User authenticateUser(User user) {
        return user;
    }
}
