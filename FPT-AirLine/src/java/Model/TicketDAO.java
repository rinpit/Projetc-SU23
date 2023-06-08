/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DBcontext.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

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
    
    public void createTicket(String ticketID,String orderID, String flightID, String ticketTypeID) throws SQLException {
        String stmt = "insert into Ticket values" + " (?,?,?,?,?)";
        PreparedStatement ps = connection.prepareStatement(stmt);
        ps.setString(1, ticketID);
        ps.setString(2, orderID);
        ps.setString(3, flightID);
        ps.setString(4, ticketTypeID);
        ps.setNull(5, java.sql.Types.INTEGER);
        ps.executeUpdate();
    }
}
