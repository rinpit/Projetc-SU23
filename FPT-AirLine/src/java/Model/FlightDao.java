package Model;
import DBcontext.DB;
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

    public List<Flight> getListFlightRoundTrip(String startDate, String endDate, String departure, String destination) {
        flights = new ArrayList<>();
        String query = "select * from Flight where StartDate = ? and EndDate = ? and Departure = ? and Destination = ?";
        try {
            connection = new DB().makeConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, startDate);
            statement.setString(2, endDate);
            statement.setString(3, departure);
            statement.setString(4, destination);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Flight flight = new Flight(resultSet.getString(1), resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4), resultSet.getString(5),
                        resultSet.getString(6), resultSet.getString(7));
                flights.add(flight);
            }
            return flights;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Flight> getListFlightOneWay(String startDate, String departure, String destination) {
        flights = new ArrayList<>();
        String query = "select * from Flight where StartDate = ? and Departure = ? and Destination = ?";
        try {
            connection = new DB().makeConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, startDate);
            statement.setString(2, departure);
            statement.setString(3, destination);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Flight flight = new Flight(resultSet.getString(1),
                        resultSet.getString(2), resultSet.getString(4),
                        resultSet.getString(5), resultSet.getString(6),
                        resultSet.getString(7));
                flights.add(flight);
            }
            return flights;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
