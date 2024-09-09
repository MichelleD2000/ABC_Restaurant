package com.abc.service;

import com.abc.dao.StaffDAO;
import com.abc.model.Staff;

import java.sql.SQLException;
import java.util.List;

public class StaffService {
    
    private static StaffService instance;
    private StaffDAO staffDAO;

    private StaffService() {
        this.staffDAO = new StaffDAO();
    }

    public static synchronized StaffService getInstance() {
        if (instance == null) {
            instance = new StaffService();
        }
        return instance;
    }

    // Retrieve all staff members
    public List<Staff> getAllStaff() throws SQLException {
        return staffDAO.getAllStaff();
    }

    // Retrieve a staff member by ID
    public Staff getStaffById(int id) throws SQLException {
        return staffDAO.getStaffById(id);
    }

    // Register a new staff member
    

    // Update an existing staff member
    public void updateStaff(Staff staff) throws SQLException {
        staffDAO.updateStaff(staff);
    }

    // Delete a staff member by ID
    public void deleteStaff(int id) throws SQLException {
        staffDAO.deleteStaff(id);
    }

    // Retrieve a staff member by email and password for login
    public Staff loginStaff(String email, String password) throws SQLException {
        return staffDAO.loginStaff(email, password);
    }

	public void addStaff(Staff staff)throws SQLException {
		 staffDAO.addStaff(staff);
		// TODO Auto-generated method stub
		
	}
}
