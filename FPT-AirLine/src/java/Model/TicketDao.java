package Model;

import DBcontext.DB;
import Controller.Format;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TicketDao {
    Connection connection;
    PreparedStatement statement;
    ResultSet resultSet;

    List<Ticket> tickets;

    public List<Ticket> getTickets() {
        tickets = new ArrayList<>();
        Format format = new Format();
        String query = "SELECT TicketType_Name, Unit_Price\n" +
                "FROM TicketType\n" +
                "INNER JOIN Price\n" +
                "ON TicketType.TicketType_ID = Price.TicketType_ID;";
        try {
            connection = new DB().makeConnection();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Ticket ticket = new Ticket(resultSet.getString(1),format.formatPrice(resultSet.getString(2)));
                tickets.add(ticket);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return tickets;
    }
}
