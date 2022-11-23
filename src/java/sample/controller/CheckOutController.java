/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.beverage.Beverage;
import sample.beverage.BeverageDAO;
import sample.beverage.Cart;
import sample.order.Order;
import sample.order.OrderDAO;
import sample.order.OrderDetails;
import sample.user.UserDTO;

/**
 *
 * @author Dell
 */
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "viewCart.jsp";
    private static final String SUCCESS = "viewCart.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            if (session != null) {
                UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
                if (user != null) {
                    Cart cart = (Cart) session.getAttribute("CART");
                    if (cart != null) {
                        BeverageDAO dao = new BeverageDAO();
                        OrderDAO orderDAO = new OrderDAO();
                        Order order = new Order(orderDAO.createOrderID(), user.getUserID(), new Timestamp(System.currentTimeMillis()), 0);
                        String message = "";
                        double total = 0;
                        for (Beverage drink : cart.getCart().values()) {
                            if (dao.checkOut(drink)) {
                                total += drink.getPrice();
                                cart.remove(drink.getProductID());
                                orderDAO.addBillDetail(new OrderDetails(order.getOrderID(), order.getOrderID(), drink.getProductID(), drink.getPrice(), drink.getQuantity(), drink.getPrice() * drink.getQuantity()));
                            } else {
                                message += drink.getProductName() + "is not available enough.\n";
                            }
                        }
                        if (!message.isEmpty()) {
                            request.setAttribute("MESSAGE", message);
                        }
                        if (total > 0) {
                            order.setTotal(total);
                            orderDAO.addBill(order);
                            url = SUCCESS;
                        }
                    }
                }
            }
        } catch (Exception e) {
            log("Error at CheckOutController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
