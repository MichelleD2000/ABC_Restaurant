package com.abc.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CustomerTest {

    private Customer customer;

    @BeforeEach
    public void setUp() {
        // Initialize the Customer object before each test
        customer = new Customer(1, "John Doe", "john.doe@example.com", "123 Street", "1234567890", "password123", "Main Outlet");
    }

    @Test
    public void testGetCustomerId() {
        assertEquals(1, customer.getCustomerId());
    }

    @Test
    public void testSetCustomerId() {
        customer.setCustomerId(2);
        assertEquals(2, customer.getCustomerId());
    }

    @Test
    public void testGetName() {
        assertEquals("John Doe", customer.getName());
    }

    @Test
    public void testSetName() {
        customer.setName("Jane Smith");
        assertEquals("Jane Smith", customer.getName());
    }

    @Test
    public void testGetEmail() {
        assertEquals("john.doe@example.com", customer.getEmail());
    }

    @Test
    public void testSetEmail() {
        customer.setEmail("jane.smith@example.com");
        assertEquals("jane.smith@example.com", customer.getEmail());
    }

    @Test
    public void testGetAddress() {
        assertEquals("123 Street", customer.getAddress());
    }

    @Test
    public void testSetAddress() {
        customer.setAddress("456 Avenue");
        assertEquals("456 Avenue", customer.getAddress());
    }

    @Test
    public void testGetPhoneNumber() {
        assertEquals("1234567890", customer.getPhoneNumber());
    }

    @Test
    public void testSetPhoneNumber() {
        customer.setPhoneNumber("0987654321");
        assertEquals("0987654321", customer.getPhoneNumber());
    }

    @Test
    public void testGetPassword() {
        assertEquals("password123", customer.getPassword());
    }

    @Test
    public void testSetPassword() {
        customer.setPassword("newPassword456");
        assertEquals("newPassword456", customer.getPassword());
    }

    @Test
    public void testGetRestaurantOutlet() {
        assertEquals("Main Outlet", customer.getRestaurantOutlet());
    }

    @Test
    public void testSetRestaurantOutlet() {
        customer.setRestaurantOutlet("Secondary Outlet");
        assertEquals("Secondary Outlet", customer.getRestaurantOutlet());
    }
}
