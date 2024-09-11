package com.abc.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class BookingTest {

    private Booking booking;

    @BeforeEach
    public void setUp() {
        // Initialize the booking object before each test
        booking = new Booking(1, "Wedding", "Beach Wedding", "2024-10-01", "17:00", 100, "John Doe", "1234567890", "john.doe@example.com");
    }

    @Test
    public void testConstructor() {
        // Test the constructor with parameters
        assertEquals(1, booking.getId());
        assertEquals("Wedding", booking.getEventType());
        assertEquals("Beach Wedding", booking.getEventName());
        assertEquals("2024-10-01", booking.getDate());
        assertEquals("17:00", booking.getTime());
        assertEquals(100, booking.getGuests());
        assertEquals("John Doe", booking.getName());
        assertEquals("1234567890", booking.getPhone());
        assertEquals("john.doe@example.com", booking.getEmail());
    }

    @Test
    public void testSettersAndGetters() {
        // Test setting and getting values
        booking.setId(2);
        booking.setEventType("Conference");
        booking.setEventName("Tech Conference");
        booking.setDate("2024-11-15");
        booking.setTime("09:00");
        booking.setGuests(300);
        booking.setName("Jane Smith");
        booking.setPhone("0987654321");
        booking.setEmail("jane.smith@example.com");

        assertEquals(2, booking.getId());
        assertEquals("Conference", booking.getEventType());
        assertEquals("Tech Conference", booking.getEventName());
        assertEquals("2024-11-15", booking.getDate());
        assertEquals("09:00", booking.getTime());
        assertEquals(300, booking.getGuests());
        assertEquals("Jane Smith", booking.getName());
        assertEquals("0987654321", booking.getPhone());
        assertEquals("jane.smith@example.com", booking.getEmail());
    }

    @Test
    public void testToString() {
        // Test the toString method
        String expected = "Booking{id=1, eventType='Wedding', eventName='Beach Wedding', date='2024-10-01', time='17:00', guests=100, name='John Doe', phone='1234567890', email='john.doe@example.com'}";
        assertEquals(expected, booking.toString());
    }
}
