package com.abc.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.Date;

public class ReservationTest {

    private Reservation reservation;
    private Date date;

    @BeforeEach
    public void setUp() {
        // Initialize the Reservation object with default values
        date = new Date();
        reservation = new Reservation(date, "7:00 PM", 4, "John Doe", "1234567890", "johndoe@example.com");
        reservation.setId(1);
    }

    @Test
    public void testGetId() {
        assertEquals(1, reservation.getId());
    }

    @Test
    public void testSetId() {
        reservation.setId(2);
        assertEquals(2, reservation.getId());
    }

    @Test
    public void testGetDate() {
        assertEquals(date, reservation.getDate());
    }

    @Test
    public void testSetDate() {
        Date newDate = new Date(System.currentTimeMillis() + 86400000); // One day later
        reservation.setDate(newDate);
        assertEquals(newDate, reservation.getDate());
    }

    @Test
    public void testGetTime() {
        assertEquals("7:00 PM", reservation.getTime());
    }

    @Test
    public void testSetTime() {
        reservation.setTime("8:00 PM");
        assertEquals("8:00 PM", reservation.getTime());
    }

    @Test
    public void testGetGuests() {
        assertEquals(4, reservation.getGuests());
    }

    @Test
    public void testSetGuests() {
        reservation.setGuests(6);
        assertEquals(6, reservation.getGuests());
    }

    @Test
    public void testGetName() {
        assertEquals("John Doe", reservation.getName());
    }

    @Test
    public void testSetName() {
        reservation.setName("Jane Doe");
        assertEquals("Jane Doe", reservation.getName());
    }

    @Test
    public void testGetPhone() {
        assertEquals("1234567890", reservation.getPhone());
    }

    @Test
    public void testSetPhone() {
        reservation.setPhone("0987654321");
        assertEquals("0987654321", reservation.getPhone());
    }

    @Test
    public void testGetEmail() {
        assertEquals("johndoe@example.com", reservation.getEmail());
    }

    @Test
    public void testSetEmail() {
        reservation.setEmail("janedoe@example.com");
        assertEquals("janedoe@example.com", reservation.getEmail());
    }

    @Test
    public void testGetStatus() {
        assertEquals("pending", reservation.getStatus());
    }

    @Test
    public void testSetStatus() {
        reservation.setStatus("confirmed");
        assertEquals("confirmed", reservation.getStatus());
    }
}

