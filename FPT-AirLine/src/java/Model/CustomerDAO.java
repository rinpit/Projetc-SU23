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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class CustomerDAO extends AccountDAO {

    private ArrayList<Customer> customers = new ArrayList<Customer>();
    Connection connection;

    public CustomerDAO() {
        try {
            connection = DB.makeConnection();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public void createCustomer(String email, String password, String role, String fullName) throws SQLException {
        String id = randomString();
        String stmt = "insert into Users values" + " (?,?,?,?,'','','','','','',?)";

        PreparedStatement ps = connection.prepareStatement(stmt);
        ps.setString(1, id);
        ps.setString(2, email);
        ps.setString(3, password);
        ps.setNString(4, fullName);
        ps.setString(5, role);
        ps.executeUpdate();
    }
    
    public ArrayList<Customer> getCustomer() throws SQLException {
        String query = "select Email, Name, Gender, Birthday, Phone, Address, Nationality, CCCD \n"
                + "from Users where Role = 'cus'\n"
                + "order by UserID";

        PreparedStatement ps = connection.prepareStatement(query);
        rs = ps.executeQuery();
        while (rs.next()) {
            customers.add(new Customer(rs.getString(2), rs.getString(3),rs.getString(4),
                    rs.getString(5), rs.getString(1), rs.getString(6),
                    rs.getString(7), rs.getString(8)));
        }
        return customers;
    }

    public ArrayList<Customer> getCustomerByPage(String page) throws SQLException {
        ArrayList<Customer> custs = new ArrayList<>();
        String query = "select Email, Name, Gender, Birthday, Phone, Address, Nationality, CCCD \n"
                + "from Users where Role = 'cus'\n"
                + "order by UserID\n"
                + "offset ? rows fetch next 5 rows only";

        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, (Integer.parseInt(page) - 1) * 5);
        rs = ps.executeQuery();
        while (rs.next()) {
            custs.add(new Customer(rs.getString(2), rs.getString(3),rs.getString(4),
                    rs.getString(5), rs.getString(1), rs.getString(6),
                    rs.getString(7), rs.getString(8)));
        }
        return custs;
    }

    public int getMaxPage(int pageSize, int Listsize) {
        try {
            int size = Listsize / pageSize;
            if (Listsize % pageSize != 0) {
                size++;
            }
            if (size == 0) {
                return 1;
            }
            return size;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return 0;
    }

    public static void main(String[] args) {
        CustomerDAO c = new CustomerDAO();
        try {
            System.out.println(c.getMaxPage(5, c.getCustomer().size()));
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            for (Customer cus : c.getCustomerByPage("1")) {
                System.out.println(cus);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
