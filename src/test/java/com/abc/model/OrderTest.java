package com.abc.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class OrderTest {

    private Order order;

    @BeforeEach
    public void setUp() {
        // Initialize the Order object before each test
        order = new Order();
        order.setOrderId(101);
        order.setCustomerName("John Doe");
        order.setOrderTime("2024-09-11 12:30:00");
        order.setOrderSummary("2x Burger, 1x Fries, 1x Drink");
        order.setCustomerAddress("1234 Elm Street");
        order.setTotalPrice(25.50);
    }

    @Test
    public void testGetOrderId() {
        assertEquals(101, order.getOrderId());
    }

    @Test
    public void testSetOrderId() {
        order.setOrderId(102);
        assertEquals(102, order.getOrderId());
    }

    @Test
    public void testGetCustomerName() {
        assertEquals("John Doe", order.getCustomerName());
    }

    @Test
    public void testSetCustomerName() {
        order.setCustomerName("Jane Smith");
        assertEquals("Jane Smith", order.getCustomerName());
    }

    @Test
    public void testGetOrderTime() {
        assertEquals("2024-09-11 12:30:00", order.getOrderTime());
    }

    @Test
    public void testSetOrderTime() {
        order.setOrderTime("2024-09-12 13:00:00");
        assertEquals("2024-09-12 13:00:00", order.getOrderTime());
    }

    @Test
    public void testGetOrderSummary() {
        assertEquals("2x Burger, 1x Fries, 1x Drink", order.getOrderSummary());
    }

    @Test
    public void testSetOrderSummary() {
        order.setOrderSummary("1x Pizza, 1x Drink");
        assertEquals("1x Pizza, 1x Drink", order.getOrderSummary());
    }

    @Test
    public void testGetCustomerAddress() {
        assertEquals("1234 Elm Street", order.getCustomerAddress());
    }

    @Test
    public void testSetCustomerAddress() {
        order.setCustomerAddress("5678 Oak Avenue");
        assertEquals("5678 Oak Avenue", order.getCustomerAddress());
    }

    @Test
    public void testGetTotalPrice() {
        assertEquals(25.50, order.getTotalPrice());
    }

    @Test
    public void testSetTotalPrice() {
        order.setTotalPrice(30.00);
        assertEquals(30.00, order.getTotalPrice());
    }
}

