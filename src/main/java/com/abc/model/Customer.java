package com.abc.model;

public class Customer {
    private int customerId;
    private String name;
    private String email;
    private String address;
    private String phoneNumber;
    private String password;
    private String restaurantOutlet;

    public Customer() {}

    public Customer(int customerId, String name, String email, String address, String phoneNumber, String password, String restaurantOutlet) {
        this.customerId = customerId;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.restaurantOutlet = restaurantOutlet;
    }

    // Getters and setters
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRestaurantOutlet() {
        return restaurantOutlet;
    }

    public void setRestaurantOutlet(String restaurantOutlet) {
        this.restaurantOutlet = restaurantOutlet;
    }
}
