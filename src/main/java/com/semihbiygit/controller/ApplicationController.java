package com.semihbiygit.controller;

import com.semihbiygit.config.DatabaseConnectionManager;
import com.semihbiygit.model.Application;
import com.semihbiygit.repository.ApplicationDAO;
import com.semihbiygit.service.ApplicationService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class ApplicationController extends HttpServlet {

    private ApplicationService applicationService;

    @Override
    public void init() throws ServletException {
        super.init();
        Connection connection = DatabaseConnectionManager.getConnection();
        applicationService = new ApplicationService(new ApplicationDAO(connection));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listApplications(req, resp);
                break;
            case "getApplicationsByUserId":
                getApplicationsByUserId(req, resp, Integer.parseInt(req.getParameter("userId")));
                break;
            case "delete":
                deleteApplication(req, resp);
                break;
            default:
                listApplications(req, resp);
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
            case "add":
                addApplication(req, resp);
                break;
            case "changeStatus":
                changeStatus(req, resp);
                break;
            default:
                listApplications(req, resp);
                break;
        }
    }

    private void listApplications(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Application> applicationList = applicationService.getAllApplications();
        req.setAttribute("applications", applicationList);
        req.getRequestDispatcher("view_application.jsp").forward(req, resp);
    }

    private void getApplicationsByUserId(HttpServletRequest req, HttpServletResponse resp, int userId) throws ServletException, IOException {
        List<Application> applicationList = applicationService.getApplicationsByUserId(userId);
        req.setAttribute("applications", applicationList);
        req.getRequestDispatcher("view_application.jsp").forward(req, resp);
    }


    private void addApplication(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String birthDate = req.getParameter("birthDate");
        String universityName = req.getParameter("universityName");
        String address = req.getParameter("address");
        String cv = req.getParameter("cv");
        String status = req.getParameter("status");
        int userId = Integer.parseInt(req.getParameter("userId"));
        applicationService.addApplication(Application.builder()
                .user_id(userId)
                .firstName(firstName)
                .lastName(lastName)
                .birthDate(birthDate)
                .universityName(universityName)
                .address(address)
                .cv(cv)
                .status(status)
                .build());
        resp.sendRedirect("my_applications.jsp");

    }

    private void changeStatus(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long applicationId = Long.parseLong(req.getParameter("id"));
        String status = req.getParameter("status");
        Application application = applicationService.getApplicationById(applicationId);
        applicationService.updateApplicationStatus(applicationId, status);
        req.setAttribute("application", application);
        req.getRequestDispatcher("applications?action=list").forward(req, resp);
    }

    private void deleteApplication(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long applicationId = Long.parseLong(req.getParameter("id"));
        applicationService.deleteApplication(applicationId);
        resp.sendRedirect("applications");
    }
}
