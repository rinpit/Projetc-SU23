/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import Model.BillDAO;
import Model.UserDAO;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
public class BillServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String userIDSession = (String) session.getAttribute("userID");
            String flightTypeSession = (String) session.getAttribute("FlightType");
            if (flightTypeSession.equals("1")) {
                request.setAttribute("flightType", "Khứ hồi");
            } else {
                request.setAttribute("flightType", "Một chiều");
            }
            BillDAO bill = new BillDAO();
            UserDAO information = new UserDAO();
            request.setAttribute("bill", bill.readBill(userIDSession));
            request.setAttribute("user", information.readUser(userIDSession));
            request.getRequestDispatcher("bill.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BillServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
