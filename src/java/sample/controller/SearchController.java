/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.beverage.Beverage;
import sample.beverage.BeverageDAO;
import sample.user.UserDTO;

/**
 *
 * @author Dell
 */
public class SearchController extends HttpServlet {
//    private static final String ERROR="adminPage.jsp";

    private static final String ERROR = "error.html";
    private static final String AD = "AD";
    private static final String ADMIN_PAGE = "adminPage.jsp";
    private static final String US = "US";
    private static final String USER_PAGE = "userPage.jsp";
    private static final String DEFAULT_PAGE = "index.jsp";

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
            String search = request.getParameter("search");
            BeverageDAO dao = new BeverageDAO();
            List<Beverage> listDrink = dao.searchBeverage(search);
            if (listDrink.size() > 0) {
                request.setAttribute("LIST_DRINK", listDrink);
                HttpSession session = request.getSession();
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser != null) {
                    if (AD.equals(loginUser.getRoleID())) {
                        url = ADMIN_PAGE;
                    } else if (US.equals(loginUser.getRoleID())) {
                        url = USER_PAGE;
                    } else {
                        url = DEFAULT_PAGE;
                    }
                } else {
                    url = DEFAULT_PAGE;
                }
            }
        } catch (Exception e) {
            log("Error at SearchController: " + e.toString());
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
