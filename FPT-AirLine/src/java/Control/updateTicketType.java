

package Control;

import Model.updateTicketTypeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
public class updateTicketType extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String S_id= request.getParameter("id");
        String S_type = request.getParameter("type");
        session.setAttribute("sId", S_id);
        
        request.setAttribute("id", S_id);
        request.setAttribute("type", S_type);
        request.getRequestDispatcher("updateTicketType.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("sId");
        String sPrice = request.getParameter("price");
        updateTicketTypeDAO ticketTypeDAO = new updateTicketTypeDAO();
        ticketTypeDAO.updateTicketTypePrice(id, sPrice);
        response.sendRedirect("ticketTypeServlet");
    }

}
