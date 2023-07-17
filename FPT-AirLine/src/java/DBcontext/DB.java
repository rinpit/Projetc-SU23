/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBcontext;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
    public static Connection makeConnection() throws ClassNotFoundException {
        try {
            String url = "jdbc:sqlserver://localhost:1433;" + "databaseName=ManagerTicket;encrypt=false";
            String username = "sa123";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("Connected");
            return DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.getMessage();
            return null;
        }
    }
    public static void main(String[] args) throws ClassNotFoundException {
        Connection connection = DB.makeConnection();
       
    }
}
