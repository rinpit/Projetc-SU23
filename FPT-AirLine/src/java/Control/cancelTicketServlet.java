/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import Model.TicketDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author ADMIN
 */
public class cancelTicketServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ticketID = request.getParameter("ticketId");
        TicketDAO ticketDAO = new TicketDAO();
        try {
            ticketDAO.addSeat(ticketID);
            ticketDAO.cancelTicket(ticketID);
            response.sendRedirect("cancelTicket.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(cancelTicketServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
