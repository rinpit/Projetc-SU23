/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DBcontext.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class CustomerDAO extends AccountDAO{
    private ArrayList<Customer> customers = new ArrayList<Customer>();
    Connection connection;

    public CustomerDAO() {
        try {
            connection = DB.makeConnection();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    
    public void createCustomer(String email, String password, String role, String phone, String fullName) throws SQLException {
        String id = randomString();
        String stmt = "insert into Users values" + " (?,?,?,?,'','',?,'','','',?)";

        PreparedStatement ps = connection.prepareStatement(stmt);
        ps.setString(1, id);
        ps.setString(2, email);
        ps.setString(3, password);
        ps.setNString(4, fullName);
        ps.setString(5, phone);
        ps.setString(6, role);
        ps.executeUpdate();
    }
}
