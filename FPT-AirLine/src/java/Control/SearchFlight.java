package Control;

import Model.Flight;
import Model.FlightDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchFlight", value = "/SearchFlight")
public class SearchFlight extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sstartDate = request.getParameter("startDate");
        String sendDate = request.getParameter("endDate");
        String sdeparture = request.getParameter("departure");
        String sdestination = request.getParameter("destination");

        FlightDao flightDao = new FlightDao();
        List<Flight>  flights = flightDao.getListFlightRoundTrip(sstartDate, sendDate, sdeparture, sdestination);
        List<Flight>  flighty = flightDao.getListFlightOneWay(sstartDate, sdeparture, sdestination);

        if(sendDate == null){
            request.setAttribute("listFlight", flighty);
        }else request.setAttribute("listFlight", flights);
        request.getRequestDispatcher("flights.jsp").forward(request, response);
    }
}
