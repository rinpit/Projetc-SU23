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
import java.util.Date;
import java.util.List;

/**
 *
 * @author Dell
 */
public class PromotionDAO {
    Connection connection;
    PreparedStatement ps = null;
    ResultSet rs = null;
    List<Promotion> list ;

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
    
    public List<Promotion> getPromotion() {
    List<Promotion> list = new ArrayList<>();
    String query = "SELECT * FROM Promotion";
    try {
        ps = connection.prepareStatement(query);
        rs = ps.executeQuery();
        while (rs.next()) {
            String promotionID = rs.getString("Promotion_ID");
            String description = rs.getString("Description");
            Date startDate = rs.getDate("StartDate");
            Date endDate = rs.getDate("EndDate");
            float amount = rs.getFloat("Amount");
            
            list.add(new Promotion(promotionID, description, startDate, endDate, amount));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return list;
}

}
