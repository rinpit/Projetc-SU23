/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DBcontext.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

public class OrderDAO {
    private ArrayList<Order> orders = new ArrayList<Order>();
    Connection connection;

    public OrderDAO() {
        try {
            connection = DB.makeConnection();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    
    public void createOrder(String orderID,String userID, String date, String tax, String totalAmount) throws SQLException {
        String stmt = "insert into OrderTicket values" + " (?,?,?,?,?,?)";
        PreparedStatement ps = connection.prepareStatement(stmt);
        ps.setString(1, orderID);
        ps.setString(2, userID);
        ps.setString(3, date);
        ps.setNull(4, java.sql.Types.INTEGER);
        ps.setString(5, tax);
        ps.setString(6, totalAmount);
        ps.executeUpdate();
    }
}
