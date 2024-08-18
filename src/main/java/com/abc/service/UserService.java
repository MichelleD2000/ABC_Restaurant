package com.abc.service;

import com.abc.dao.UserDAO;
import com.abc.model.User;

public class UserService {

    private UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    // Register a user
    public void registerUser(User user) {
        userDAO.registerUser(user);
    }

    // Login a user
    public User loginUser(String email, String password) {
        return userDAO.loginUser(email, password);
    }
}
