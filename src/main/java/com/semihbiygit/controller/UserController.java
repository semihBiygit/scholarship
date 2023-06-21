package com.semihbiygit.controller;

import com.semihbiygit.config.DatabaseConnectionManager;
import com.semihbiygit.model.User;
import com.semihbiygit.model.Application;
import com.semihbiygit.repository.ApplicationDAO;
import com.semihbiygit.repository.UserDAO;
import com.semihbiygit.service.UserService;
import com.semihbiygit.service.ApplicationService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class UserController extends HttpServlet {

    private UserService userService;
    private ApplicationService applicationService;

    @Override
    public void init() throws ServletException {
        super.init();
        Connection connection = DatabaseConnectionManager.getConnection();
        userService = new UserService(new UserDAO(connection));
        applicationService = new ApplicationService(new ApplicationDAO(connection));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "edit":
                showUserForm(req, resp);
                break;
            default:
                listUsers(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "loginAdmin":
                loginAdmin(req, resp);
                break;
            case "loginUser":
                loginUser(req, resp);
                break;
            case "addAdmin":
                addAdminUser(req, resp);
                break;
            case "addUser":
                addUser(req, resp);
                break;
            case "delete":
                deleteUser(req, resp);
                break;
            default:
                listUsers(req, resp);
                break;
        }
    }

    private void loginAdmin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User admin = userService.loginAdmin(username, password);
        if (admin != null) {
            req.getSession().setAttribute("admin", admin);
            resp.sendRedirect("dashboard.jsp");
        } else {
            req.setAttribute("error", "Geçersiz kullanıcı adı ya da şifre!");
            req.getRequestDispatcher("admin_login.jsp").forward(req, resp);
        }
    }

    private void loginUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = userService.loginUser(username, password);
        if (user != null) {
            req.getSession().setAttribute("userId", user.getUser_id());
            req.getSession().setAttribute("user", user);
            resp.sendRedirect("create_application.jsp");
        } else {
            req.setAttribute("error", "Geçersiz kullanıcı adı ya da şifre!");
            req.getRequestDispatcher("user_login.jsp").forward(req, resp);
        }
    }

    private void listUsers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> userList = userService.getAllUsers();
        req.setAttribute("users", userList);
        req.getRequestDispatcher("users.jsp").forward(req, resp);
    }

    private void addUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        userService.addUser(User.builder()
                .username(username)
                .password(password)
                .build());
        req.setAttribute("successMessage", "Kullanıcı oluşturuldu");
        req.getRequestDispatcher("user_login.jsp").forward(req, resp);
    }

    private void addAdminUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        userService.addAdmin(User.builder()
                .username(username)
                .password(password)
                .build());
        resp.sendRedirect("users");
    }

    private void showUserForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long userId = Long.parseLong(req.getParameter("id"));
        User user = userService.getUserById(userId);
        List<Application> applicationList = applicationService.getAllApplications();
        req.setAttribute("user", user);
        req.setAttribute("applications", applicationList);
        req.getRequestDispatcher("edit_user.jsp").forward(req, resp);
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("id"));
        userService.deleteUser(userId);
        resp.sendRedirect("users");
    }
}
