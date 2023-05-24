package Control;

import Model.InformationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UpdateInformationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String userIDSession = (String) session.getAttribute("userID");
            InformationDAO information = new InformationDAO();
            request.setAttribute("information", information.readInformation(userIDSession));
            request.getRequestDispatcher("updateInformation.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateInformationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userIDPara = (String) session.getAttribute("userID");
        String namePara = request.getParameter("namePara");
        String birthdayPara = request.getParameter("birthdayPara");
        String cccdPara = request.getParameter("cccdPara");
        String nationalityPara = request.getParameter("nationalityPara");
        String phonePara = request.getParameter("phonePara");
        String addressPara = request.getParameter("addressPara");
        InformationDAO information = new InformationDAO();
        information.updateInformation(userIDPara, namePara, birthdayPara, cccdPara, nationalityPara, phonePara, addressPara);
        response.sendRedirect("PersonalServlet");
    }
}
