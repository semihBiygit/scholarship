package com.semihbiygit.repository;

import com.semihbiygit.config.DatabaseConnectionManager;
import com.semihbiygit.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class UserDAO {

    private Connection connection;

    public UserDAO(Connection connection) {
        this.connection = DatabaseConnectionManager.getConnection();
    }

    public void addAdmin(User user) {
        String query = "INSERT INTO users (username, password, role, application_id) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, "ADMIN");
            statement.setInt(4, user.getApplication_id());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addUser(User user) {
        String query = "INSERT INTO users (user_id,username, password, role) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, new Random().nextInt(90000) + 10000);
            statement.setString(2, user.getUsername());
            statement.setString(3, user.getPassword());
            statement.setString(4, "USER");
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUserById(Long user_id) {
        String query = "SELECT * FROM users WHERE user_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setLong(1, user_id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return mapUser(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getUserByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return mapUser(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        String query = "SELECT * FROM users where role='USER' ";
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                userList.add(mapUser(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public void deleteUser(int userId) {
        String query = "DELETE FROM users WHERE user_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private User mapUser(ResultSet resultSet) throws SQLException {
        return User.builder()
                .user_id(resultSet.getLong("user_id"))
                .username(resultSet.getString("username"))
                .password(resultSet.getString("password"))
                .role(resultSet.getString("role"))
                .application_id(resultSet.getInt("application_id"))
                .build();
    }

}
