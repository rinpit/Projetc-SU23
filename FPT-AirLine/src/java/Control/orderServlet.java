/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import Model.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class orderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String flightType = (String) session.getAttribute("FlightType");
        String id = request.getParameter("flightId");
        String ticketTypePrice = request.getParameter("ticketTypePrice");
        String ticketTotalA = request.getParameter("ticketTotalA");
        if ((String) session.getAttribute("kid") != null) {
            String ticketTotalK = request.getParameter("ticketTotalK");
            session.setAttribute("ticketTotalK", ticketTotalK);
        }
        session.setAttribute("ticketTypePrice", ticketTypePrice);
        session.setAttribute("ticketTotalA", ticketTotalA);
        session.setAttribute("id", id);
        if (flightType.equals("1")) {
            request.getRequestDispatcher("detail_roundtrip.jsp").forward(request, response);
        } else if (flightType.equals("2")) {
            request.getRequestDispatcher("detail_onetrip.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountDAO accdao = new AccountDAO();

        String userID = (String) session.getAttribute("userID");
        int numAdult = (int) session.getAttribute("adult");
        int numKid = (int) session.getAttribute("kid");
        int numBaby = (int) session.getAttribute("baby");
        for (int i = 1; i <= (numAdult + numKid + numBaby); i++) {
            String passengerID = accdao.randomString();
            String ticketID = accdao.randomString();
        }
        for (int i = 1; i <= numAdult; i++) {
            String nameAdult = request.getParameter("nameAdult" + i);
            String birthday = request.getParameter("txtDate" + i);

        }

    }

}
