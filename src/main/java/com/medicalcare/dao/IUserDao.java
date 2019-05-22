package com.medicalcare.dao;

import com.medicalcare.model.User;

import java.util.List;

public interface IUserDao {

    User saveUser(User user);

    User updateUser(User user);

    List<User> getUsers();

    User getUserByUsername(String username);
}
