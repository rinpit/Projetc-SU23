/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Control.orderServlet;
import DBcontext.DB;
import jakarta.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class TicketDAO {

    private ArrayList<Ticket> tickets = new ArrayList<Ticket>();
    Connection connection;

    public TicketDAO() {
        try {
            connection = DB.makeConnection();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public void createTicket(String ticketID, String orderID, String flightID, String ticketTypeID, String luggageID, String seat) throws SQLException {
        String stmt = "insert into Ticket values" + " (?,?,?,?,?,?)";
        PreparedStatement ps = connection.prepareStatement(stmt);
        ps.setString(1, ticketID);
        ps.setString(2, orderID);
        ps.setString(3, flightID);
        ps.setString(4, ticketTypeID);
        ps.setString(5, luggageID);
        ps.setString(6, seat);
        ps.executeUpdate();
    }

    public ArrayList<String> getSeats(String TicketTypeID, String flightID) throws SQLException {
        ArrayList<String> seats = new ArrayList<>();
        String stmt = "SELECT t.Seats\n"
                + "FROM Ticket t\n"
                + "JOIN TicketType tt ON t.TicketType_ID = tt.TicketType_ID\n"
                + "WHERE tt.TicketType_ID = ? and t.Flight_ID = ?";
        PreparedStatement ps = connection.prepareStatement(stmt);
        ps.setString(1, TicketTypeID);
        ps.setString(2, flightID);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            if (rs.getString(1) != null) {
                seats.add(rs.getString(1));
            }
        }
        return seats;
    }

    public String createSeats(String TicketTypeID, String flightID) {
        String seat = null;
        try {
            ArrayList<String> seats = getSeats(TicketTypeID, flightID);
            if (TicketTypeID.equals("TT1")) {
                seat = "E" + (seats.size() + 1);
            } else if (TicketTypeID.equals("TT2")) {
                seat = "B" + (seats.size() + 1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TicketDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return seat;
    }

    public void getTicket(int numAdult, int numKid, String flightId, String orderID, HttpServletRequest request, String ticketType, String isGo) {
        AccountDAO accdao = new AccountDAO();
        PassengerDAO passdao = new PassengerDAO();
        for (int i = 1; i <= numAdult; i++) {
            String luggageA = null;
            String passengerID = accdao.randomString();
            String passFullName = request.getParameter("nameAdult" + i);
            String birthDay = request.getParameter("txtDateA" + i);
            String ticketID = accdao.randomString();
            String seat = createSeats(ticketType, flightId);
            if (isGo.equals("Go")) {
                luggageA = request.getParameter("luggageGoA" + i);
            } else {
                luggageA = request.getParameter("luggageBackA" + i);
            }
            try {
                createTicket(ticketID, orderID, flightId, ticketType, luggageA, seat);
                passdao.createPassenger(passengerID, ticketID, passFullName, birthDay);
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        }
        for (int i = 1; i <= numKid; i++) {
            String luggageK = null;
            String passengerID = accdao.randomString();
            String passFullName = request.getParameter("nameKid" + i);
            String birthDay = request.getParameter("txtDateK" + i);
            String ticketID = accdao.randomString();
            String seat = createSeats(ticketType, flightId);
            if (isGo.equals("Go")) {
                luggageK = request.getParameter("luggageGoK" + i);
            } else {
                luggageK = request.getParameter("luggageBackK" + i);
            }
            try {
                createTicket(ticketID, orderID, flightId, ticketType, luggageK, seat);
                passdao.createPassenger(passengerID, ticketID, passFullName, birthDay);
            } catch (SQLException ex) {
                Logger.getLogger(orderServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void cancelTicket(String ticketID) throws SQLException {
        String stmt = "ALTER TABLE dbo.Passenger\n"
                + "DROP CONSTRAINT fk_tblPassenger2;\n"
                + "\n"
                + "ALTER TABLE dbo.Passenger\n"
                + "ADD CONSTRAINT fk_tblPassenger2 \n"
                + "    FOREIGN KEY (Ticket_ID) REFERENCES dbo.Ticket(Ticket_ID)\n"
                + "    ON DELETE CASCADE;\n"
                + "\n"
                + "DELETE FROM Ticket WHERE Ticket_ID = ?;\n"
                + "\n"
                + "DELETE FROM Passenger WHERE Ticket_ID = ?;";
        PreparedStatement ps = connection.prepareStatement(stmt);
        ps.setString(1, ticketID);
        ps.setString(2, ticketID);
        ps.executeUpdate();
    }

    public void addSeat(String ticketID) throws SQLException {
        String smtEco = "UPDATE Flight\n"
                + "SET \n"
                + "    SeatsB = CASE WHEN Ticket.TicketType_ID = 'TT2' THEN SeatsB + 1 ELSE SeatsB END,\n"
                + "    SeatsC = CASE WHEN Ticket.TicketType_ID = 'TT1' THEN SeatsC + 1 ELSE SeatsC END        \n"
                + "FROM (\n"
                + "    SELECT Flight_ID, TicketType_ID\n"
                + "    FROM Ticket\n"
                + "    WHERE Ticket_ID = ?\n"
                + ") AS Ticket \n"
                + "INNER JOIN Flight ON Ticket.Flight_ID = Flight.Flight_ID\n"
                + "WHERE Ticket.TicketType_ID IN ('TT1', 'TT2');";
        PreparedStatement ps = connection.prepareStatement(smtEco);
        ps.setString(1, ticketID);
        ps.executeUpdate();
    }

//    public static void main(String[] args) throws SQLException {
//        TicketDAO ticketDAO = new TicketDAO();
//        ticketDAO.cancelTicket("sbhytx");
//    }
}
