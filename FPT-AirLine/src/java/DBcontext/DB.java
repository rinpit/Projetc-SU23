/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBcontext;
import Model.Flight;
import Model.FlightDao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

public class DB {
    public static Connection makeConnection() throws ClassNotFoundException {
        try {
            String url = "jdbc:sqlserver://localhost:1433;" + "databaseName=ManagerTicket;encrypt=false";
            String username = "sa";
            String password = "sa";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("Connected");
            return DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.getMessage();
            return null;
        }
    }

    public static void main(String[] args) {
        FlightDao flightDao = new FlightDao();
        //ArrayList<Flight> flights = new ArrayList<>();
        ArrayList<Flight> flights = (ArrayList<Flight>) flightDao.getListFlightRoundTrip("2023-05-24", "2023-05-25", "Da Nang", "Ho Chi Minh");
        for (Flight flight : flights) {
            System.out.println(flight);
        }
    }
}
