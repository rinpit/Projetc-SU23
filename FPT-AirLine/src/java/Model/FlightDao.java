package Model;

import DBcontext.DB;
import Control.Format;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FlightDao {
    Connection connection;
    PreparedStatement statement;
    ResultSet resultSet;

    List<Flight> flights;

    public List<Flight> getListFlight(String startDate, String departure, String destination) {
        flights = new ArrayList<>();
        Format format = new Format();
        String query = "select * from Flight where StartDate = ? and Departure = ? and Destination = ?";
        try {
            connection = new DB().makeConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, startDate);
            statement.setString(2, departure);
            statement.setString(3, destination);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Flight flight = new Flight(resultSet.getString(1), format.formatDate(resultSet.getString(2)),
                        format.formatDate(resultSet.getString(3)), format.formatTime(resultSet.getString(4))
                        , format.formatTime(resultSet.getString(5)), resultSet.getString(6), resultSet.getString(7));
                flights.add(flight);
            }
            //Only for IntelliJ
//            while (resultSet.next()) {
//                Flight flight = new Flight(resultSet.getString(1), format.addTwoDays(format.formatDate(resultSet.getString(2))),
//                        format.addTwoDays(format.formatDate(resultSet.getString(3))), format.formatTime(resultSet.getString(4))
//                        , format.formatTime(resultSet.getString(5)), resultSet.getString(6), resultSet.getString(7));
//                flights.add(flight);
//            }
            return flights;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
