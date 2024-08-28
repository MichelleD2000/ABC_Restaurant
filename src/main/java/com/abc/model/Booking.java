package com.abc.model;

public class Booking {
    private int id;
    private String eventType;
    private String eventName;
    private String date;
    private String time;
    private int guests;
    private String name;
    private String phone;
    private String email;

    // Constructor
    public Booking(int id, String eventType, String eventName, String date, String time, int guests, String name, String phone, String email) {
        this.id = id;
        this.eventType = eventType;
        this.eventName = eventName;
        this.date = date;
        this.time = time;
        this.guests = guests;
        this.name = name;
        this.phone = phone;
        this.email = email;
    }

    // Default constructor
    public Booking() {}

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEventType() {
        return eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getGuests() {
        return guests;
    }

    public void setGuests(int guests) {
        this.guests = guests;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "id=" + id +
                ", eventType='" + eventType + '\'' +
                ", eventName='" + eventName + '\'' +
                ", date='" + date + '\'' +
                ", time='" + time + '\'' +
                ", guests=" + guests +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
