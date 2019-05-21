package com.medicalcare.dao;

import com.medicalcare.model.User;

public interface IUserDao {

    User saveUser(User user);

    User updateUser(User user);

}
