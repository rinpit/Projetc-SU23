/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.DistanceDAO;
import Model.DistanceV2;
import Model.Flight;
import Model.FlightDAO;

/**
 *
 * @author Pham Thinh
 */
public class addFlight extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addFlight</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addFlight at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //processRequest(request, response);
        String flightId = request.getParameter("flightId");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String departure = request.getParameter("departure");
        String destination = request.getParameter("destination");
        int gate = Integer.parseInt(request.getParameter("gate"));
        int seatsB = Integer.parseInt(request.getParameter("seatsB"));
        int seatsC = Integer.parseInt(request.getParameter("seatsC"));
        String distanceID = request.getParameter("distanceID");

        FlightDAO flightdao = new FlightDAO();
        Flight d = flightdao.getFlightById(flightId);
        if (d == null) {
            Flight fNew = new Flight(flightId, startDate, endDate, startTime, endTime, departure, destination, gate, seatsB, seatsC, distanceID);
            flightdao.insert(fNew);
            response.sendRedirect("ListFlightServlet");
        } else {
            request.setAttribute("error", flightId + " exitsed!!");
            request.getRequestDispatcher("addFlight.jsp").forward(request, response);
        }
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
