
package Control;

import Model.Promotion;
import Model.PromotionDAO;
import Model.TicketType;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class listPromotionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PromotionDAO promotionDao = new PromotionDAO();
        List<Promotion> promotions = promotionDao.getPromotion();
        Collections.sort(promotions, Comparator.comparing(Promotion::getStartDate));
        request.setAttribute("listPromotion", promotions);
        request.getRequestDispatcher("listPromotion.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

}
