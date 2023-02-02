/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import module.Customer;

/**
 *
 * @author tient
 */
public class AccountDAO extends DBContext {

    public boolean loginGoogle(String email) {
        try {
            String sql = "SELECT [customer_id]\n"
                    + "      ,[customer_name]\n"
                    + "      ,[address]\n"
                    + "      ,[phone]\n"
                    + "      ,[email]\n"
                    + "  FROM [dbo].[Customer]\n"
                    + "  WHERE [email] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }
//    public boolean Addco
}
