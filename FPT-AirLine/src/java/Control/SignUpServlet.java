/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.Account;
import Model.CustomerDAO;

/**
 *
 * @author admin
 */
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CustomerDAO cusDao = new CustomerDAO();
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("pass");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        Account acc = cusDao.checkExist(email);
        if (acc == null) {
            System.out.println("User is null");
            try {
                cusDao.createCustomer(email, password,"Customer", phone, fullName);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
                requestDispatcher.forward(request, response);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            request.setAttribute("mess1", "Account already exists");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
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
