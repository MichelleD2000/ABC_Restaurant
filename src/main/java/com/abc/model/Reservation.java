package com.abc.model;

import java.util.Date;

public class Reservation {
    private int id;
    private Date date;
    private String time;
    private int guests;
    private String name;
    private String phone;
    private String email;
    private String status; // New field for reservation status

    public Reservation(Date date, String time, int guests, String name, String phone, String email) {
        this.date = date;
        this.time = time;
        this.guests = guests;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.status = "pending"; // Default status
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }

    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }

    public int getGuests() { return guests; }
    public void setGuests(int guests) { this.guests = guests; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    
}
