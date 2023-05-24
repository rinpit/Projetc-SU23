package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import DBcontext.DB;

public class InformationDAO {

    private Information information = new Information();
    private Connection connection;

    public InformationDAO() {
        try {
            connection = new DB().makeConnection();
        }catch (ClassNotFoundException ex) {
            Logger.getLogger(InformationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Information readInformation(String userID) throws ClassNotFoundException {
        try {
            ResultSet resultSet;
            String statement = "SELECT * FROM Users WHERE Users.UserID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1, userID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                information.setUserID(resultSet.getString(1));
                information.setEmail(resultSet.getString(2));
                information.setPassword(resultSet.getString(3));
                information.setName(resultSet.getString(4));
                information.setGender(resultSet.getString(5));
                information.setBirthday(resultSet.getDate(6));
                information.setPhone(resultSet.getString(7));
                information.setAddress(resultSet.getString(8));
                information.setNationality(resultSet.getString(9));
                information.setCccd(resultSet.getString(10));
                information.setRole(resultSet.getString(11));
            }
        } catch (SQLException ex) {
            Logger.getLogger(InformationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return information;
    }

    public void updateInformation(String userIDPara, String namePara, String birthdayPara, String cccdPara, String nationalityPara, String phonePara, String addressPara) {
        try {
            String statement = "UPDATE Users SET Name=?,Birthday=?,CCCD=?,Nationality=?,Phone=?,Address=? WHERE UserID=?";
            PreparedStatement preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1, namePara);
            preparedStatement.setDate(2, java.sql.Date.valueOf(birthdayPara));
            preparedStatement.setString(3, cccdPara);
            preparedStatement.setString(4, nationalityPara);
            preparedStatement.setString(5, phonePara);
            preparedStatement.setString(6, addressPara);
            preparedStatement.setString(7, userIDPara);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(InformationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePassword(String userIDPara, String passwordPara) {
        try {
            String statement = "UPDATE Users SET Password=? "
                        + "WHERE UserID=?";
            PreparedStatement preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1, passwordPara);
            preparedStatement.setString(2, userIDPara);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(InformationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
