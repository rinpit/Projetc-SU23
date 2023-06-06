
package Model;

import Controller.DBContext;
import Controller.Format;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DistanceDAO {
    private List<Distance> distanceList = new ArrayList<>();

    Connection connection;
    PreparedStatement statement;
    ResultSet resultSet;

    public DistanceDAO() {
        try {
            connection = DBContext.getConnection();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Distance> getDistances(String startDate, String departure, String destination) {
        Format format = new Format();
        String query = "SELECT *\n" +
                "FROM Flight as f, Distance\n" +
                "WHERE f.Distance_ID = Distance.Distance_ID " +
                "and f.StartDate = ? and f.Departure = ? and f.Destination = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, startDate);
            statement.setString(2, departure);
            statement.setString(3, destination);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Distance distance = new Distance(resultSet.getString(11),resultSet.getString(12),resultSet.getFloat(13),resultSet.getString(1), format.formatDate(resultSet.getString(2)),
                        format.formatDate(resultSet.getString(3)), format.formatTime(resultSet.getString(4))
                        , format.formatTime(resultSet.getString(5)), resultSet.getString(6), resultSet.getString(7));
                distanceList.add(distance);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return distanceList;
    }

}
