package Controller;

import Model.Flight;
import Model.FlightDao;
import Model.Ticket;
import Model.TicketDao;
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
        Format format = new Format();

//        round-trip or one-way
        String selectFlight = request.getParameter("flight");

        String sdeparture = request.getParameter("departure");
        String sdestination = request.getParameter("destination");
        String sstartDate = request.getParameter("startDate");
        String sendDate = request.getParameter("endDate");

        String sadult = request.getParameter("adult");
        String skid = request.getParameter("kid");
        String sbaby = request.getParameter("baby");

        HttpSession session = request.getSession();
        session.setAttribute("FlightType", selectFlight);
        session.setAttribute("Departure", sdeparture);
        session.setAttribute("Destination", sdestination);
        session.setAttribute("StartDate", format.formatDate(sstartDate));
        if(sendDate != null){
            session.setAttribute("EndDate", format.formatDate(sendDate));
        }
        session.setAttribute("adult", sadult);
        session.setAttribute("kid", skid);
        session.setAttribute("baby", sbaby);

        FlightDao flightDao = new FlightDao();
        List<Flight> flights = flightDao.getListFlight(sstartDate, sdeparture, sdestination);
        TicketDao ticketDao = new TicketDao();
        List<Ticket> tickets = ticketDao.getTickets();

        request.setAttribute("listFlight", flights);
        request.setAttribute("listTicket", tickets);

        request.getRequestDispatcher("select-flights.jsp").forward(request, response);
    }


}
