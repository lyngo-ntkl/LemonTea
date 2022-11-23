/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 *
 * @author Dell
 */
public class Order {

    private final String orderID;
    private String userID;
    private Timestamp orderDateTime;
    private double total;

    public Order(String orderID) {
        this.orderID = orderID;
    }

    public Order(String orderID, String userID, Timestamp orderDateTime, double total) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDateTime = orderDateTime;
        this.total = total;
    }

    public String getOrderID() {
        return orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Timestamp getOrderDateTime() {
        return orderDateTime;
    }

    public void setOrderDateTime(Timestamp orderDateTime) {
        this.orderDateTime = orderDateTime;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
