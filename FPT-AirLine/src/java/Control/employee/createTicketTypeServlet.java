
package Control.employee;

import Model.dao.TicketTypeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
public class createTicketTypeServlet extends HttpServlet {

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
        try {
            String name = request.getParameter("name");
            
            String startDateString = request.getParameter("startDay");
            LocalDate startDay = LocalDate.parse(startDateString);
            String startDayString = startDay.toString();
            
            String endDateString = request.getParameter("endDay");
            LocalDate endDay = LocalDate.parse(endDateString);
            String endDayString = endDay.toString();
            
            String price = request.getParameter("price");
            
            TicketTypeDAO dAO = new TicketTypeDAO();
            dAO.createTicketTypePrice(name, startDayString, endDayString, price);
            response.sendRedirect("ticketTypeServlet");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(createTicketTypeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
