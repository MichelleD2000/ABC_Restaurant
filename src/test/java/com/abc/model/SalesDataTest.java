package com.abc.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class SalesDataTest {

    private SalesData salesData;

    @BeforeEach
    public void setUp() {
        // Initialize the SalesData object with default values
        salesData = new SalesData("2024-09-11", 150, "Burger", 1200.50);
    }

    @Test
    public void testGetDate() {
        assertEquals("2024-09-11", salesData.getDate());
    }

    @Test
    public void testGetTotalOrders() {
        assertEquals(150, salesData.getTotalOrders());
    }

    @Test
    public void testGetBestSellingItem() {
        assertEquals("Burger", salesData.getBestSellingItem());
    }

    @Test
    public void testGetTotalDailyIncome() {
        assertEquals(1200.50, salesData.getTotalDailyIncome(), 0.01); // Allow a small delta for floating-point comparison
    }
}
