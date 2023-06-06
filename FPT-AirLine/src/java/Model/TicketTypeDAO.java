package Model;

import Controller.DBContext;
import Controller.Format;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TicketTypeDAO {
    Connection connection;
    PreparedStatement statement;
    ResultSet resultSet;

    List<TicketType> tickets;

    public List<TicketType> getTickets() {
        tickets = new ArrayList<>();
        Format format = new Format();
        String query = "SELECT TicketType_Name, Unit_Price\n" +
                "FROM TicketType\n" +
                "INNER JOIN Price\n" +
                "ON TicketType.TicketType_ID = Price.TicketType_ID;";
        try {
            connection = DBContext.getConnection();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                TicketType ticket = new TicketType(resultSet.getString(1),resultSet.getString(2));
                tickets.add(ticket);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return tickets;
    }
}