/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DBcontext.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class OrderTicketDAO {

    OrderTicket orderTicket = new OrderTicket();
    private Connection connection;

    public OrderTicketDAO() {
        try {
            connection = DB.makeConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InformationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public OrderTicket readOrderTicket(String userID) throws ClassNotFoundException {
        try {
            ResultSet resultSet;
            String statement = "SELECT SubQuery.*\n"
                    + "FROM (\n"
                    + "    SELECT OT.Order_ID, OT.TotalAmount, F.Departure, F.StartDate, F.StartTime, F.Destination, F.EndDate, F.EndTime, ROW_NUMBER() OVER (ORDER BY OT.date DESC) AS RowNum\n"
                    + "    FROM Users U\n"
                    + "    FULL OUTER JOIN OrderTicket OT ON U.UserID = OT.UserID\n"
                    + "    FULL OUTER JOIN Ticket T ON OT.Order_ID = T.Order_ID\n"
                    + "    FULL OUTER JOIN Flight F ON T.Flight_ID = F.Flight_ID\n"
                    + "    WHERE U.UserID = ?\n"
                    + ") AS SubQuery\n"
                    + "WHERE SubQuery.RowNum = 1;";
            PreparedStatement preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1, userID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                orderTicket.setOrderID(resultSet.getString(1));
                orderTicket.setTotalAmount(resultSet.getFloat(2));
                orderTicket.setDeparture(resultSet.getString(3));
                orderTicket.setStartDate(resultSet.getDate(4));
                orderTicket.setStartTime(resultSet.getString(5));
                orderTicket.setDestination(resultSet.getString(6));
                orderTicket.setEndDate(resultSet.getDate(7));
                orderTicket.setEndTime(resultSet.getString(8));
            }
        } catch (SQLException ex) {
            Logger.getLogger(InformationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderTicket;
    }

//    public void updateInformation(String userIDPara, String namePara, String birthdayPara, String cccdPara, String nationalityPara, String phonePara, String addressPara) {
//        try {
//            String statement = "UPDATE Users SET Name=?,Birthday=?,CCCD=?,Nationality=?,Phone=?,Address=? WHERE UserID=?";
//            PreparedStatement preparedStatement = connection.prepareStatement(statement);
//            preparedStatement.setString(1, namePara);
//            preparedStatement.setDate(2, java.sql.Date.valueOf(birthdayPara));
//            preparedStatement.setString(3, cccdPara);
//            preparedStatement.setString(4, nationalityPara);
//            preparedStatement.setString(5, phonePara);
//            preparedStatement.setString(6, addressPara);
//            preparedStatement.setString(7, userIDPara);
//            preparedStatement.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(InformationDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//    
//    public void updatePassword(String userIDPara, String passwordPara) {
//        try {
//            String statement = "UPDATE Users SET Password=? "
//                    + "WHERE UserID=?";
//            PreparedStatement preparedStatement = connection.prepareStatement(statement);
//            preparedStatement.setString(1, passwordPara);
//            preparedStatement.setString(2, userIDPara);
//            preparedStatement.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(InformationDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}
