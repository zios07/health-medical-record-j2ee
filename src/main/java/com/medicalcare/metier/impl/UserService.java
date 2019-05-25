package com.medicalcare.metier.impl;

import com.medicalcare.dao.IUserDao;
import com.medicalcare.dao.impl.UserDao;
import com.medicalcare.metier.IUserService;
import com.medicalcare.model.Doctor;
import com.medicalcare.model.Patient;
import com.medicalcare.model.User;

public class UserService implements IUserService {

    private IUserDao userDao = new UserDao();

    @Override
    public User createUser(User user) {
        return userDao.saveUser(user);
    }

    @Override
    public User updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public User authenticateUser(User user) {
        User u = userDao.getUserByUsername(user.getUsername());
        if (u != null && u.getPassword().equals(user.getPassword())) {
            return u;
        }
        return null;
    }

}
