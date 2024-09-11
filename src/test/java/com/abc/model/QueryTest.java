package com.abc.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.Timestamp;

public class QueryTest {

    private Query query;
    private Timestamp timestamp;

    @BeforeEach
    public void setUp() {
        // Initialize the Query object and Timestamp before each test
        timestamp = new Timestamp(System.currentTimeMillis());
        query = new Query();
        query.setId(1);
        query.setCustomerName("Alice Johnson");
        query.setCustomerEmail("alice.johnson@example.com");
        query.setQueryText("What are your restaurant's opening hours?");
        query.setStatus("Pending");
        query.setCreatedAt(timestamp);
    }

    @Test
    public void testGetId() {
        assertEquals(1, query.getId());
    }

    @Test
    public void testSetId() {
        query.setId(2);
        assertEquals(2, query.getId());
    }

    @Test
    public void testGetCustomerName() {
        assertEquals("Alice Johnson", query.getCustomerName());
    }

    @Test
    public void testSetCustomerName() {
        query.setCustomerName("Bob Smith");
        assertEquals("Bob Smith", query.getCustomerName());
    }

    @Test
    public void testGetCustomerEmail() {
        assertEquals("alice.johnson@example.com", query.getCustomerEmail());
    }

    @Test
    public void testSetCustomerEmail() {
        query.setCustomerEmail("bob.smith@example.com");
        assertEquals("bob.smith@example.com", query.getCustomerEmail());
    }

    @Test
    public void testGetQueryText() {
        assertEquals("What are your restaurant's opening hours?", query.getQueryText());
    }

    @Test
    public void testSetQueryText() {
        query.setQueryText("Do you have vegan options?");
        assertEquals("Do you have vegan options?", query.getQueryText());
    }

    @Test
    public void testGetStatus() {
        assertEquals("Pending", query.getStatus());
    }

    @Test
    public void testSetStatus() {
        query.setStatus("Resolved");
        assertEquals("Resolved", query.getStatus());
    }

    @Test
    public void testGetCreatedAt() {
        assertEquals(timestamp, query.getCreatedAt());
    }

    @Test
    public void testSetCreatedAt() {
        Timestamp newTimestamp = new Timestamp(System.currentTimeMillis() - 10000);
        query.setCreatedAt(newTimestamp);
        assertEquals(newTimestamp, query.getCreatedAt());
    }
}

