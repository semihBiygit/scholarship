package com.semihbiygit.service;

import com.semihbiygit.model.User;
import com.semihbiygit.repository.UserDAO;

import java.util.List;

public class UserService {

    private UserDAO userDAO;

    public UserService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public boolean authenticateUser(String username, String password) {
        User user = userDAO.getUserByUsername(username);

        if (user != null && user.getPassword().equals(password)) {
            return true;
        }

        return false;
    }

    public void addAdmin(User user) {
        userDAO.addAdmin(user);
    }

    public void addUser(User user) {
        userDAO.addUser(user);
    }

    public User getUserById(Long id) {
        return userDAO.getUserById(id);
    }

    public List<User> getAllUsers() {
        return userDAO.getAllUsers();
    }

    public void deleteUser(int userId) {
        userDAO.deleteUser(userId);
    }

    public User loginUser(String username, String password) {
        User user = userDAO.getUserByUsername(username);
        if (user != null && user.getPassword().equals(password) && user.getRole().equals("USER")) {
            return user;
        }
        return null;
    }


    public User loginAdmin(String username, String password) {
        User admin = userDAO.getUserByUsername(username);
        if (admin != null && admin.getPassword().equals(password) && admin.getRole().equals("ADMIN")) {
            return admin;
        }
        return null;
    }
}

