package com.semihbiygit.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnectionManager {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/scholarshipDB";
    private static final String DB_USERNAME = "postgres";
    private static final String DB_PASSWORD = "123";

    public static Connection getConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}

