package com.semihbiygit.service;

import com.semihbiygit.model.Application;
import com.semihbiygit.repository.ApplicationDAO;

import java.util.List;

public class ApplicationService {

    private ApplicationDAO applicationDAO;

    public ApplicationService(ApplicationDAO applicationDAO) {
        this.applicationDAO = applicationDAO;
    }

    public void addApplication(Application application) {
        applicationDAO.addApplication(application);
    }

    public Application getApplicationById(Long id) {
        return applicationDAO.getApplicationById(id);
    }

    public List<Application> getAllApplications() {
        return applicationDAO.getAllApplications();
    }

    public List<Application> getApplicationsByUserId(int userId) {
        return applicationDAO.getApplicationsByUserId(userId);
    }

    public void updateApplicationStatus(Long id, String status) {
        applicationDAO.updateApplicationStatus(id, status);
    }

    public void deleteApplication(Long id) {
        applicationDAO.deleteApplication(id);
    }
}
