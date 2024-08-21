package com.abc.service;

import com.abc.dao.CustomerDAO;
import com.abc.model.Customer;

import java.sql.SQLException;
import java.util.List;

public class CustomerService {
    private static CustomerService instance;
    private CustomerDAO customerDAO;

    private CustomerService() {
        customerDAO = new CustomerDAO();
    }

    public static synchronized CustomerService getInstance() {
        if (instance == null) {
            instance = new CustomerService();
        }
        return instance;
    }

    public List<Customer> getAllCustomers() throws SQLException {
        return customerDAO.getAllCustomers();
    }

    public Customer getCustomerById(int id) throws SQLException {
        return customerDAO.getCustomerById(id);
    }

    public void addCustomer(Customer customer) throws SQLException {
        customerDAO.addCustomer(customer);
    }

    public void updateCustomer(Customer customer) throws SQLException {
        customerDAO.updateCustomer(customer);
    }

    public void deleteCustomer(int id) throws SQLException {
        customerDAO.deleteCustomer(id);
    }

    public Customer getCustomerByEmailAndPassword(String email, String password) throws SQLException {
        return customerDAO.getCustomerByEmailAndPassword(email, password);
    }
}
