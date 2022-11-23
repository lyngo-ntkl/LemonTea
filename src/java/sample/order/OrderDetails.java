/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

/**
 *
 * @author Dell
 */
public class OrderDetails {

    private final String detailID;
    private String orderID;
    private String productID;
    private double price;
    private int quantity;
    private double total;

    public OrderDetails(String detailID) {
        this.detailID = detailID;
    }

    public OrderDetails(String detailID, String orderID, String productID, double price, int quantity, double total) {
        this.detailID = detailID;
        this.orderID = orderID;
        this.productID = productID;
        this.price = price;
        this.quantity = quantity;
        this.total = total;
    }

    public String getDetailID() {
        return detailID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
