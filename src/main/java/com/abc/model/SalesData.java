package com.abc.model;

public class SalesData {
    private String date;
    private int totalOrders;
    private String bestSellingItem;
    private double totalDailyIncome;

    public SalesData(String date, int totalOrders, String bestSellingItem, double totalDailyIncome) {
        this.date = date;
        this.totalOrders = totalOrders;
        this.bestSellingItem = bestSellingItem;
        this.totalDailyIncome = totalDailyIncome;
    }

    public String getDate() {
        return date;
    }

    public int getTotalOrders() {
        return totalOrders;
    }

    public String getBestSellingItem() {
        return bestSellingItem;
    }

    public double getTotalDailyIncome() {
        return totalDailyIncome;
    }
}
