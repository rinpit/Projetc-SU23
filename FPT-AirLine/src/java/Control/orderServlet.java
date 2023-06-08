/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import Model.AccountDAO;
import Model.OrderDAO;
import Model.PassengerDAO;
import Model.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.format.DateTimeFormatter;
import java.time.LocalDate;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class orderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountDAO accdao = new AccountDAO();
        OrderDAO orderdao = new OrderDAO();
        TicketDAO ticketdao = new TicketDAO();
        PassengerDAO passdao = new PassengerDAO();

        String userID = (String) session.getAttribute("userID");
        int numAdult = Integer.parseInt((String)session.getAttribute("adult"));
        int numKid = Integer.parseInt((String)session.getAttribute("kid"));
        int numBaby = Integer.parseInt((String)session.getAttribute("baby"));
        String ticketType = (String) session.getAttribute("ticketType");
        String flightID = (String) session.getAttribute("flightId");
        String totalAmount = request.getParameter("totalAmount");
        String orderID = accdao.randomString();
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String dateString = currentDate.format(formatter);
        try {
            orderdao.createOrder(orderID, userID, dateString, "1.1", totalAmount);
        } catch (SQLException ex) {
            Logger.getLogger(orderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        for (int i = 1; i <= numAdult; i++) {
            String passengerID = accdao.randomString();
            String passFullName = request.getParameter("nameAdult" + i);
            String birthDay = request.getParameter("txtDateA" + i);
            String ticketID = accdao.randomString();
            try {
                ticketdao.createTicket(ticketID, orderID, flightID, ticketType);
                passdao.createPassenger(passengerID, ticketID, passFullName, birthDay);
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        }
        for (int i = 1; i <= numKid; i++) {
            String passengerID = accdao.randomString();
            String passFullName = request.getParameter("nameKid" + i);
            String birthDay = request.getParameter("txtDateK" + i);
            String ticketID = accdao.randomString();
            try {
                ticketdao.createTicket(ticketID, orderID, flightID, ticketType);
                passdao.createPassenger(passengerID, ticketID, passFullName, birthDay);
            } catch (SQLException ex) {
                Logger.getLogger(orderServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        request.getRequestDispatcher("payment.jsp").forward(request, response);
    }

}
