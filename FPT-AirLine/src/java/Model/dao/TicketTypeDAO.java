package Model.dao;

import DBcontext.DB;
import Control.format.Format;
import Model.TicketType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import static org.eclipse.jdt.internal.compiler.parser.Parser.name;

public class TicketTypeDAO {

    Connection connection;
    PreparedStatement statement;
    ResultSet resultSet;

    List<TicketType> tickets;

    public List<TicketType> getTickets() {
        tickets = new ArrayList<>();
        Format format = new Format();
        String query = "SELECT TicketType.TicketType_ID,TicketType_Name, Unit_Price\n"
                + "FROM TicketType\n"
                + "INNER JOIN Price\n"
                + "ON TicketType.TicketType_ID = Price.TicketType_ID;";
        try {
            connection = DB.makeConnection();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                TicketType ticket = new TicketType(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3));
                tickets.add(ticket);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tickets;
    }

    public void updateTicketTypePrice(String id, String price) throws ClassNotFoundException {
        try {
            String statement = "UPDATE Price SET Unit_Price = ? WHERE TicketType_ID = ?";
            connection = DB.makeConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1, price);
            preparedStatement.setString(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    AccountDAO accountDAO = new AccountDAO();

    public void createTicketTypePrice(String name, String startDay, String endDay, String price) throws ClassNotFoundException {
        String tid = accountDAO.randomString();
        String pid = accountDAO.randomString();
        createTicketType(tid, name);
        try {
            String statement = "insert into Price\n"
                    + "values(?, ?, ?, ?, ?)";
            connection = DB.makeConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1, pid);
            preparedStatement.setString(2, tid);
            preparedStatement.setString(3, startDay);
            preparedStatement.setString(4, endDay);
            preparedStatement.setString(5, price);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void createTicketType(String id, String name) throws ClassNotFoundException {
        try {
            String statement = "insert into TicketType\n"
                    + "values(?, ?)";
            connection = DB.makeConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, name);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void createTicketType_Flight(String ticketType_ID, String flightId, int seats) throws ClassNotFoundException {
        try {
            String statement = "insert into TicketType_Flight\n"
                    + "values(?, ?, ?)";
            connection = DB.makeConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1, ticketType_ID);
            preparedStatement.setString(2, flightId);
            preparedStatement.setInt(3, seats);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteTicketTypePrice(String id) throws SQLException, ClassNotFoundException {
        String stmt = "DELETE FROM Price\n"
                + "               WHERE TicketType_ID = ?\n"
                + "DELETE FROM TicketType\n"
                + "               WHERE TicketType_ID = ?";
        connection = DB.makeConnection();
        PreparedStatement ps = connection.prepareStatement(stmt);
        ps.setString(1, id);
        ps.setString(2, id);
        ps.executeUpdate();
    }

}
