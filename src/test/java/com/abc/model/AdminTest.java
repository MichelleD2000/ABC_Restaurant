package com.abc.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.abc.model.Admin;

public class AdminTest {
    private Admin admin;

    @BeforeEach
    public void setUp() {
        admin = new Admin();
    }

    @Test
    public void testDefaultConstructor() {
        assertNotNull(admin);  // Ensures that the object is created
    }

    @Test
    public void testParameterizedConstructor() {
        Admin admin = new Admin(1, "John Doe", "john@example.com", "password123");
        assertEquals(1, admin.getAdminId());
        assertEquals("John Doe", admin.getName());
        assertEquals("john@example.com", admin.getEmail());
        assertEquals("password123", admin.getPassword());
    }

    @Test
    public void testSetAdminId() {
        admin.setAdminId(100);
        assertEquals(100, admin.getAdminId());
    }

    @Test
    public void testSetName() {
        admin.setName("Alice");
        assertEquals("Alice", admin.getName());
    }

    @Test
    public void testSetEmail() {
        admin.setEmail("alice@example.com");
        assertEquals("alice@example.com", admin.getEmail());
    }

    @Test
    public void testSetPassword() {
        admin.setPassword("securepassword");
        assertEquals("securepassword", admin.getPassword());
    }
}
