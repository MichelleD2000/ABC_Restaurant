package com.abc.service;

import com.abc.dao.StaffDAO;
import com.abc.model.Staff;

public class StaffService {
    
    private static StaffService instance;
    private StaffDAO staffDAO;

    private StaffService() {
        this.staffDAO = new StaffDAO();
    }

    public static StaffService getInstance() {
        if (instance == null) {
            synchronized (StaffService.class) {
                if (instance == null) {
                    instance = new StaffService();
                }
            }
        }
        return instance;
    }

    public void registerStaff(Staff staff) {
         staffDAO.registerStaff(staff);
    }

    public Staff loginStaff(String email, String password) {
        return staffDAO.loginStaff(email, password);
    }
}
