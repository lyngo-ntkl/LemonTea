/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.beverage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author Dell
 */
public class BeverageDAO {

    private static final String SEARCH = "SELECT productID, productName, price, quantity, categoryID FROM tblProduct "
            + "WHERE productName like ?";
    private static final String UPDATE = "UPDATE tblProduct SET productName=?, price=?, quantity=?, categoryID=? "
            + "WHERE productID=?";
    private static final String INSERT_IMAGE = "INSERT INTO tblProduct(imageID, productID, picture) VALUES(?,?,?)";
    private static final String DELETE = "DELETE tblProduct "
            + "WHERE productID=?";
    private static final String INSERT = "INSERT INTO tblProduct(productID, productName, price, quantity, categoryID) VALUES(?, ?, ?, ?, ?)";

    private static final String CREATE_PRODUCT_ID = "SELECT productID FROM tblProduct "
            + "WHERE categoryID=?";

    private static final String GET_MENU = "SELECT * FROM tblProduct";
    
    private static final String CHECK_OUT = "UPDATE tblProduct SET quantity = (SELECT quantity FROM tblProduct WHERE productID=?)-? "
            + "WHERE productID=? AND quantity>=?";

    public List<Beverage> searchBeverage(String search) throws SQLException {
        List<Beverage> listBeverage = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    listBeverage.add(new Beverage(productID, productName, price, quantity, categoryID));
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
        return listBeverage;
    }

    public boolean updateBeverage(Beverage drink) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, drink.getProductName());
                ptm.setDouble(2, drink.getPrice());
                ptm.setInt(3, drink.getQuantity());
                ptm.setString(4, drink.getCategoryID());
                ptm.setString(5, drink.getProductID());
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
    
    public boolean insertImage(BeverageImage image) throws SQLException{
        boolean check=false;
        Connection conn=null;
        PreparedStatement ptm=null;
        try {
            conn=DBUtils.getConnection();
            ptm=conn.prepareStatement(INSERT_IMAGE);
            ptm.setString(1, image.getImageID());
            ptm.setString(2, image.getProductID());
            ptm.setObject(3, image.getImage());
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }

    public boolean deleteBeverage(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
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

    public String createProductID(String categoryID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String id = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_PRODUCT_ID);
                ptm.setString(1, categoryID);
                rs = ptm.executeQuery();
                String indicator, tmp;
                int i = 1;
                boolean check = true;
                switch (categoryID) {
                    case "B1":
                        indicator = "T";
                        break;
                    case "B2":
                        indicator = "C";
                        break;
                    case "B3":
                        indicator = "M";
                        break;
                    default:
                        indicator = "";
                }
                while (check) {
                    tmp = indicator + String.format("%02d", i);
                    if (rs.next()) {
                        if (tmp.equals(rs.getString("productID"))) {
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

    public boolean insertBeverage(Beverage beverage) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, beverage.getProductID());
                ptm.setString(2, beverage.getProductName());
                ptm.setDouble(3, beverage.getPrice());
                ptm.setInt(4, beverage.getQuantity());
                ptm.setString(5, beverage.getCategoryID());
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

    public List<Beverage> getMenu() throws SQLException {
        List<Beverage> menu = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_MENU);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    menu.add(new Beverage(productID, productName, price, quantity, categoryID));
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
        return menu;
    }

    public boolean checkOut(Beverage beverage) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm=conn.prepareStatement(CHECK_OUT);
                ptm.setString(1, beverage.getProductID());
                ptm.setInt(2, beverage.getQuantity());
                ptm.setString(3, beverage.getProductID());
                ptm.setInt(4, beverage.getQuantity());
                check=ptm.executeUpdate()>0;
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
        return check;
    }
}
