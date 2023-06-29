/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.dao;

import DBcontext.DB;
import Model.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    private ArrayList<Order> orders = new ArrayList<Order>();
    Connection connection;
    ResultSet resultSet;

    public OrderDAO() {
        try {
            connection = DB.makeConnection();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public void createOrder(String orderID, String userID, String date, String promotionID, String tax, String totalAmount) throws SQLException {
        String stmt = "insert into OrderTicket values" + " (?,?,?,?,?,?,?)";
        PreparedStatement ps = connection.prepareStatement(stmt);
        ps.setString(1, orderID);
        ps.setString(2, userID);
        ps.setString(3, date);
        if (promotionID.isBlank()) {
            ps.setNull(4, java.sql.Types.INTEGER);
        } else {
            ps.setString(4, promotionID);
        }
        ps.setString(5, tax);
        ps.setString(6, totalAmount);
        ps.setString(7, "false");
        ps.executeUpdate();
    }

    public List<Order> getListOrder(String userID) throws SQLException {
        orders = new ArrayList<>();
        String query = "Select * from OrderTicket where UserID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, userID);
            resultSet = ps.executeQuery();
            while (resultSet.next()) {
                Order order = new Order(resultSet.getString(1), resultSet.getString(3),
                        resultSet.getString(4), resultSet.getFloat(5), resultSet.getString(6));
                orders.add(order);
            }
            return orders;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

//    public static void main(String[] args) throws SQLException {
//        OrderDAO orderDAO = new OrderDAO();
//        List<Order> orders = orderDAO.getListOrder("221608");
//        for (Order order : orders) {
//            System.out.println(order);
//        }
//    }
}
