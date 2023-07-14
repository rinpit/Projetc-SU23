/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import Model.Account;
import Model.dao.AccountDAO;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("login-email");
        String password = request.getParameter("login-pass");
        String role = request.getParameter("role");
        String remember = request.getParameter("remember");
        AccountDAO dao = new AccountDAO();
        if (role.equals("customer")) {
            
            ArrayList<Account> accounts = dao.getAccount(email, password);
            if (!accounts.isEmpty()) {
                String userID = accounts.get(0).getAccID();
                HttpSession sessionUser = request.getSession();
                sessionUser.setAttribute("email", email);
                sessionUser.setAttribute("userID", userID);
                if (remember != null) {
                    Cookie e = new Cookie("emailC", email);
                    e.setMaxAge(60 * 15);
                    Cookie p = new Cookie("passC", password);
                    response.addCookie(e);
                    p.setMaxAge(60 * 15);
                }
                response.sendRedirect("index.jsp?id=" + userID);
            } else {
                request.setAttribute("mess", "Wrong username or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            
        } else if (role.equals("employee")) {
            ArrayList<Account> accountsEmployee = dao.getAccountEmployee(email, password);
            if (!accountsEmployee.isEmpty()) {
                String employeeID = accountsEmployee.get(0).getAccID();
                HttpSession sessionEmployee = request.getSession();
                sessionEmployee.setAttribute("role", "employee");
                sessionEmployee.setAttribute("email", email);
                sessionEmployee.setAttribute("employeeID", employeeID);
                if (remember != null) {
                    Cookie e = new Cookie("emailC", email);
                    e.setMaxAge(60 * 15);
                    Cookie p = new Cookie("passC", password);
                    response.addCookie(e);
                    p.setMaxAge(60 * 15);
                }
                response.sendRedirect("homepage.jsp");
            } else {
                request.setAttribute("mess", "Wrong username or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            
        } else if (role.equals("admin")) {
            ArrayList<Account> accountsAdmin = dao.getAccountAdmin(email, password);
            if (!accountsAdmin.isEmpty()) {
                String adminID = accountsAdmin.get(0).getAccID();
                HttpSession sessionAdmin = request.getSession();
                sessionAdmin.setAttribute("role", "admin");
                sessionAdmin.setAttribute("email", email);
                sessionAdmin.setAttribute("adminID", adminID);
                if (remember != null) {
                    Cookie e = new Cookie("emailC", email);
                    e.setMaxAge(60 * 15);
                    Cookie p = new Cookie("passC", password);
                    response.addCookie(e);
                    p.setMaxAge(60 * 15);
                }
                response.sendRedirect("homepage.jsp");
            } else {
                request.setAttribute("mess", "Wrong username or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }

    }

}
