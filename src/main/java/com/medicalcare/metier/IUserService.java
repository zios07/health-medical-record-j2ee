package com.medicalcare.metier;

import com.medicalcare.model.User;

public interface IUserService {

    User createUser(User user);

    User updateUser(User user);

    User authenticateUser(User user);

}
