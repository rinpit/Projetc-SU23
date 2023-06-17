/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Control.Format;
import DBcontext.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class PromotionDAO {
    Connection connection;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public ArrayList<Promotion> result = new ArrayList<>();

    public PromotionDAO() {
        try {
            connection = DB.makeConnection();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    
    public void createPromotion(String id, String description, String startDay, String endDay, float price) throws SQLException{
        String stmt = "insert into Promotion values (?, ?, ?, ?, ? )";
        PreparedStatement ps = connection.prepareStatement(stmt);
        ps.setString(1, id);
        ps.setNString(2, description);
        ps.setString(3, startDay);
        ps.setString(4, endDay);
        ps.setFloat(5, price);
        ps.executeUpdate();
    }
    
    public ArrayList<Promotion> getPromotion() {
        String query = "select * from Promotion";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.add(new Promotion(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return result;
    }
}
