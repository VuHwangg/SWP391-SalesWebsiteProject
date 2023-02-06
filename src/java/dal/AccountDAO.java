/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import model.Customer;

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

    public Account checkLoginCus(String username, String password) {
        Account acc = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * "
                    + " FROM Account "
                    + " WHERE username =? AND password=? ";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                String name = rs.getString("username");
                String pass = rs.getString("password");
                String displayname = rs.getString("displayname");
                acc = new Account(name, pass, displayname);
            }

        } catch (Exception ex) {

        }
        return acc;
    }

    public boolean AddAcount(String username, String password, String displayname) {
        boolean check = false;
        try {
            String sql = "Insert Account "
                    + "(username,password,displayname) values (?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, displayname);

            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
        }
        return check;
    }

    public boolean AddCust(String customer_name, String address, String phone, String email) {
        boolean check = false;
        try {
            String sql = "Insert into Customer "
                    + "(customer_name,address,phone,email) values (?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customer_name);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, email);

            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
        }
        return check;
    }

    public boolean AddRole(int roleid, String username) {
        boolean check = false;
        try {
            String sql = "Insert into Role_Account"
                    + "(role_id,username) values(?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, roleid);
            ps.setString(2, username);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
        }
        return check;
    }

    public Account checkExistAcc(String username) {
        Account acc = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * "
                    + " FROM Account "
                    + " WHERE username =? ";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);

            rs = stm.executeQuery();
            if (rs.next()) {
                String name = rs.getString("username");
                String pass = rs.getString("password");
                String displayname = rs.getString("displayname");
                acc = new Account(name, pass, displayname);
            }

        } catch (Exception ex) {

        }
        return acc;
    }

    public int GetRole(String username) {
        int role = 0;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {

            String sql = "select role_id from Role_Account where username = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);

            rs = stm.executeQuery();
            if (rs.next()) {
                role = rs.getInt("role_id");
            }
        } catch (Exception e) {

        }

        return role;
    }

    public Customer GetCust(String email) {
        Customer cust = null;
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
                int customer_id = rs.getInt("customer_id");
                String customer_name = rs.getString("customer_name");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String email1 = rs.getString("email");
                cust = new Customer(customer_id, customer_name, address, phone, email1);
            }
        } catch (SQLException e) {
        }
        return cust;
    }

    public boolean UpdateCust(String name, String adress, String phone, String mail) {
        boolean check = false;
        try {
            String sql = "Update Customer "
                    + "set customer_name = ? ,address = ? ,phone = ? where email = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, adress);
            ps.setString(3, phone);
            ps.setString(4, mail);
            
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
        }
        return check;
    }
     public boolean UpdateAccName(String name, String mail) {
        boolean check = false;
        try {
            String sql = "Update  Account set displayname = ? where username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            
            ps.setString(2, mail);
            
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
        }
        return check;
    }

}
