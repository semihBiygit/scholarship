package com.semihbiygit.repository;

import com.semihbiygit.config.DatabaseConnectionManager;
import com.semihbiygit.model.Application;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class ApplicationDAO {

    private Connection connection;

    public ApplicationDAO(Connection connection) {
        this.connection = DatabaseConnectionManager.getConnection();
    }

    public void addApplication(Application application) {
        String query = "INSERT INTO applications (application_id,first_name, last_name, birth_date, university_name, address, cv, status,user_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, new Random().nextInt(9000) + 1000);            statement.setString(2, application.getFirstName());
            statement.setString(3, application.getLastName());
            statement.setString(4, application.getBirthDate());
            statement.setString(5, application.getUniversityName());
            statement.setString(6, application.getAddress());
            statement.setString(7, application.getCv());
            statement.setString(8, application.getStatus());
            statement.setLong(9, application.getUser_id());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Application getApplicationById(Long application_id) {
        String query = "SELECT * FROM applications WHERE application_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setLong(1, application_id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return mapApplication(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Application> getAllApplications() {
        List<Application> applicationList = new ArrayList<>();
        String query = "SELECT * FROM applications";
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                applicationList.add(mapApplication(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applicationList;
    }

    public List<Application> getApplicationsByUserId(int userId) {
        List<Application> applicationList = new ArrayList<>();
        String query = "SELECT * FROM applications WHERE user_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                applicationList.add(mapApplication(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applicationList;
    }

    public void updateApplicationStatus(Long id, String status) {
        String query = "UPDATE applications SET status = ? WHERE application_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, status);
            statement.setLong(2, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteApplication(Long id) {
        String query = "DELETE FROM applications WHERE application_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setLong(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Application mapApplication(ResultSet resultSet) throws SQLException {
        return Application.builder()
                .application_id(resultSet.getLong("application_id"))
                .firstName(resultSet.getString("first_name"))
                .lastName(resultSet.getString("last_name"))
                .birthDate(resultSet.getString("birth_date"))
                .universityName(resultSet.getString("university_name"))
                .address(resultSet.getString("address"))
                .cv(resultSet.getString("cv"))
                .status(resultSet.getString("status"))
                .user_id(resultSet.getInt("user_id"))
                .build();
    }
}
