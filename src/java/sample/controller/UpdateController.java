/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.beverage.Beverage;
import sample.beverage.BeverageDAO;

/**
 *
 * @author Dell
 */
public class UpdateController extends HttpServlet {
    
    private static final String ERROR="error.html";
    private static final String SUCCESS="SearchController";

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
        String url=ERROR;
        try {
            String productID=request.getParameter("productID");
            String productName=request.getParameter("productName");
            double price=Double.parseDouble(request.getParameter("price"));
            int quantity=Integer.parseInt(request.getParameter("quantity"));
            String[] category=request.getParameter("category").split("-");
            String categoryID=category[0];
            BeverageDAO dao = new BeverageDAO();
            Beverage drink=new Beverage(productID, productName, price, quantity, categoryID);
            boolean check=dao.updateBeverage(drink);
            if(check){
                url=SUCCESS;
            }
            String image=request.getParameter("image");
            if(image!=null){
                FileInputStream fis = new FileInputStream(image);
            }
        } catch (Exception e) {
            log("Error at UpdateController: "+e.toString());
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