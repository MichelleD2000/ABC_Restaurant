package com.abc.service;

import com.abc.dao.AdminDAO;
import com.abc.model.Admin;

import java.sql.SQLException;
import java.util.List;

public class AdminService {
    private static AdminService instance;
    private AdminDAO adminDAO;

    private AdminService() {
        adminDAO = new AdminDAO();
    }

    public static synchronized AdminService getInstance() {
        if (instance == null) {
            instance = new AdminService();
        }
        return instance;
    }

    public List<Admin> getAllAdmins() throws SQLException {
        return adminDAO.getAllAdmins();
    }

    public Admin getAdminById(int id) throws SQLException {
        return adminDAO.getAdminById(id);
    }

    public void addAdmin(Admin admin) throws SQLException {
        adminDAO.addAdmin(admin);
    }

    public void updateAdmin(Admin admin) throws SQLException {
        adminDAO.updateAdmin(admin);
    }

    public void deleteAdmin(int id) throws SQLException {
        adminDAO.deleteAdmin(id);
    }

    public Admin getAdminByEmailAndPassword(String email, String password) throws SQLException {
        return adminDAO.getAdminByEmailAndPassword(email, password);
    }
}
