/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Control.employee;

import Model.Promotion;
import Model.PromotionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
public class updatePromotionServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String promotion_id = request.getParameter("id");
        PromotionDAO dao = new PromotionDAO();
        Promotion promotion = dao.getPromotionById(promotion_id);
        request.setAttribute("promotion", promotion);
        request.getRequestDispatcher("updatePromotion.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String promotion_id = request.getParameter("promotionID");
        
        String startDateString = request.getParameter("startDay");
        LocalDate startDay = LocalDate.parse(startDateString);
        String startDayString = startDay.toString();
        
        String endDateString = request.getParameter("endDay");
        LocalDate endDay = LocalDate.parse(endDateString);
        String endDayString = endDay.toString();
        
        String price = request.getParameter("price");
        float Float_price = Float.parseFloat(price);
        String description = request.getParameter("description");
        
        PromotionDAO dAO = new PromotionDAO();
        try {
            dAO.updatePromotion(promotion_id, description, startDayString, endDayString, Float_price);
            response.sendRedirect("listPromotionServlet");
            
        } catch (SQLException ex) {
            Logger.getLogger(updatePromotionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

}
