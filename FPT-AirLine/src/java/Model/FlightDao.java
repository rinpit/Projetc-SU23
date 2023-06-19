package Model;

import DBcontext.DB;
import Control.Format;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FlightDAO {

    Connection connection;
    PreparedStatement statement;
    ResultSet resultSet;

    List<Flight> flights;

    public List<Flight> getListFlight(String startDate, String departure, String destination) {
        flights = new ArrayList<>();
        Format format = new Format();
        String query = "Select * from \n"
                + "Flight where StartDate = ? and Departure = ? and Destination = ?\n"
                + "ORDER BY StartTime ASC";
        try {
            connection = new DB().makeConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, startDate);
            statement.setString(2, departure);
            statement.setString(3, destination);
            resultSet = statement.executeQuery();
//            while (resultSet.next()) {
//                Flight flight = new Flight(resultSet.getString(1), format.formatDate(resultSet.getString(2)),
//                        format.formatDate(resultSet.getString(3)), format.formatTime(resultSet.getString(4))
//                        , format.formatTime(resultSet.getString(5)), resultSet.getString(6), resultSet.getString(7));
//                flights.add(flight);
//            }
            //Only for Minh
            while (resultSet.next()) {
                Flight flight = new Flight(resultSet.getString(1), format.addTwoDays(format.formatDate(resultSet.getString(2))),
                        format.addTwoDays(format.formatDate(resultSet.getString(3))), format.formatTime(resultSet.getString(4)),
                        format.formatTime(resultSet.getString(5)), resultSet.getString(6), resultSet.getString(7), resultSet.getInt(9),
                        resultSet.getInt(10));
                flights.add(flight);
            }
            return flights;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateSeatFlight(int seatsB, int seatsC, String FlightID, String ticketType) throws SQLException, ClassNotFoundException {
        connection = new DB().makeConnection();
        if (ticketType.equals("TT2")) {
            try {
                flights = new ArrayList<>();
                String query = "UPDATE Flight\n"
                        + "Set SeatsB = ?\n"
                        + "WHERE Flight_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, seatsB);
                statement.setString(2, FlightID);
                statement.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(InformationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                flights = new ArrayList<>();
                String query = "UPDATE Flight\n"
                        + "Set SeatsC = ?\n"
                        + "WHERE Flight_ID = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, seatsC);
                statement.setString(2, FlightID);
                statement.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(InformationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Flight flights = new Flight();
        FlightDAO flightDAO = new FlightDAO();
        List<Flight> flightsOne = flightDAO.getListFlight("2023-05-25", "Đà Nẵng", "Hồ Chí Minh");
        for (Flight flight : flightsOne) {
            System.out.println(flight);
            System.out.println(flight.getSeatB());
        }
//        flightDAO.updateSeatFlight(50, 50, "DM1", "Economic");

    }
}
