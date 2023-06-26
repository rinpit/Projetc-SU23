package Control;

import Model.OrderTicketDAO;
import Model.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DeleteOrderTicketServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String orderTicketID = request.getParameter("orderTicketID");
            OrderTicketDAO orderTicket = new OrderTicketDAO();
            orderTicket.deleteOrderTicekt(orderTicketID);
            response.sendRedirect("OrderTicketServlet");
        } catch (SQLException ex) {
            Logger.getLogger(DeleteEmployeeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
