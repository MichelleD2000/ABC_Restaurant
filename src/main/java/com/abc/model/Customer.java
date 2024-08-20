package com.abc.model;

public class Customer {
    private int customerId;
    private String name;
    private String email;
    private String address;
    private String phoneNumber;
    private String password; // New field

    // Default constructor
    public Customer() {
    }

    // Constructor with all fields
    public Customer(int customerId, String name, String email, String address, String phoneNumber, String password) {
        this.customerId = customerId;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.password = password;
    }

    // Getters and setters for all fields
    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() { // New getter
        return password;
    }

    public void setPassword(String password) { // New setter
        this.password = password;
    }
}
