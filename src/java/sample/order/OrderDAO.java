/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author Dell
 */
public class OrderDAO {
    
    private static final String CREATE_ORDER_ID = "SELECT orderID FROM tblOrder";
    
    private static final String ADD_BILL="INSERT INTO tblOrder(orderID, userID, orderDate, total) VALUES (?, ?, ?, ?)";
    
    private static final String ADD_BILL_DETAIL="INSERT INTO tblOrderDetail(detailID,orderID,productID,price,quantity) VALUES (?, ?, ?)";
    
    private static final String DELETE_BILL_DETAIL="DELETE tblOrderDetail WHERE detailID=?";
    
    public String createOrderID() throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String id = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_ORDER_ID);
                rs = ptm.executeQuery();
                String tmp;
                int i = 1;
                boolean check = true;
                while (check) {
                    tmp = String.format("%09d", i);
                    if (rs.next()) {
                        if (tmp.equals(rs.getString("orderID"))) {
                            i++;
                        } else {
                            id = tmp;
                            check = false;
                        }
                    } else {
                        id = tmp;
                        check = false;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return id;
    }
    
    public boolean addBill(Order order) throws SQLException{
        boolean check=false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD_BILL);
                ptm.setString(1, order.getOrderID());
                ptm.setString(2, order.getUserID());
                ptm.setObject(3, order.getOrderDateTime());
                ptm.setDouble(4, order.getTotal());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean addBillDetail(OrderDetails orderDetail) throws SQLException{
        boolean check=false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD_BILL);
                ptm.setString(1, orderDetail.getDetailID());
                ptm.setString(2, orderDetail.getOrderID());
                ptm.setString(3, orderDetail.getProductID());
                ptm.setDouble(4, orderDetail.getPrice());
                ptm.setInt(5, orderDetail.getQuantity());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
