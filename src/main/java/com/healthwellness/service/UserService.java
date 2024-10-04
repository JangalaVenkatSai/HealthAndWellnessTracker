package com.healthwellness.service;

import com.healthwellness.dao.UserDAO;
import com.healthwellness.model.User;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public boolean registerUser(User user) {
        return userDAO.registerUser(user);
    }

    public User validateUser(String username, String password) {
        return userDAO.validateUser(username, password);
    }
}
