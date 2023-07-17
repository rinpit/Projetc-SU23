/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.employee;

import Model.TicketType;
import Model.dao.TicketTypeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "CreateTicketTypeFlightServlet", urlPatterns = {"/CreateTicketTypeFlightServlet"})
public class CreateTicketTypeFlightServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String fid = request.getParameter("fid");

            TicketTypeDAO ticketTypeDAO = new TicketTypeDAO();
            List<TicketType> list = ticketTypeDAO.getTickets();

            for (TicketType ticketType1 : list) {
                String seats = request.getParameter("seats" + ticketType1.getTicketTypeId());
                int numberSeats = Integer.parseInt(seats);
                ticketTypeDAO.createTicketType_Flight(ticketType1.getTicketTypeId(), fid, numberSeats);
            }
            response.sendRedirect("ticketTypeServlet");
        } catch (ClassNotFoundException ex) {

        }
    }

}
