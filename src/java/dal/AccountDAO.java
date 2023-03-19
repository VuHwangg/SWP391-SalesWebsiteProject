/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Account;
import model.Customer;

/**
 *
 * @author tient
 */
public class AccountDAO extends DBContext {

    public boolean loginGoogle(String email, boolean status) {
        try {
            String sql = "SELECT [customer_id]\n"
                    + "      ,[customer_name]\n"
                    + "      ,[address]\n"
                    + "      ,[phone]\n"
                    + "      ,[email],[status]\n"
                    + "  FROM [dbo].[Customer]\n"
                    + "  WHERE [email] = ? and status =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setBoolean(2, status);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
        }
        return false;
    }

    public Account checkLoginCus(String username, String password,boolean status) {
        Account acc = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * "
                    + " FROM Account "
                    + " WHERE username =? AND password=? and [status] =1 ";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                String name = rs.getString("username");
                String pass = rs.getString("password");
                String displayname = rs.getString("displayname");
                status = rs.getBoolean("status");

                acc = new Account(username, password, displayname, status);
            }

        } catch (Exception ex) {

        }
        return acc;
    }

    public boolean addAcount(String username, String password, String displayname, boolean status) {
        boolean check = false;
        try {
            String sql = "Insert into Account "
                    + "(username,password,displayname,[status]) values (?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, displayname);
            ps.setBoolean(4, status);
           
            check = ps.executeUpdate() > 0;

        } catch (Exception e) {
        }
        return check;
    }

    public boolean addCust(String customer_name, String address, String phone, String email, boolean status) {
        boolean check = false;
        try {
            String sql = "Insert into Customer "
                    + "(customer_name,address,phone,email,[status]) values (?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customer_name);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, email);
            ps.setBoolean(5, status);

            check = ps.executeUpdate() > 0;

        } catch (Exception e) {
        }
        return check;
    }

    public boolean addRole(int roleid, String username) {
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

    public Account checkExistAcc(String username,boolean status) {
        Account acc = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * "
                    + " FROM Account "
                    + " WHERE username =? and [status] = 1";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);

            rs = stm.executeQuery();
            if (rs.next()) {
                String name = rs.getString("username");
                String pass = rs.getString("password");
                String displayname = rs.getString("displayname");
                status = rs.getBoolean("status");

                acc = new Account(name, pass, displayname, status);
            }

        } catch (Exception ex) {

        }
        return acc;
    }

    public int getRole(String username) {
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

    public Customer getCust(String email, boolean status) {
        Customer cust = null;
        try {
            String sql = "SELECT [customer_id]\n"
                    + "      ,[customer_name]\n"
                    + "      ,[address]\n"
                    + "      ,[phone]\n"
                    + "      ,[email],[status]\n"
                    + "  FROM [dbo].[Customer]\n"
                    + "  WHERE [email] = ? and status =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setBoolean(2, status);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int customer_id = rs.getInt("customer_id");
                String customer_name = rs.getString("customer_name");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String email1 = rs.getString("email");

                cust = new Customer(customer_id, customer_name, address, phone, email1, status);
            }

        } catch (SQLException e) {
        }
        return cust;
    }

    public boolean updateCust(String name, String adress, String phone, String mail) {
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

    public boolean updateAccName(String name, String mail) {
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

    public ArrayList<Account> arrAcc() {
        ArrayList<Account> arr = new ArrayList<>();
        try {
            String sql = "select * from Account  inner join Role_Account  on Account.username = Role_Account.username where (Role_Account.role_id =2 or Role_Account.role_id =3) and Account.status = 1  ";
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String name = rs.getString("username");
                String pass = rs.getString("password");
                String displayname = rs.getString("displayname");
                boolean status = rs.getBoolean("status");
               
                int role_id = rs.getInt("role_id");
                arr.add(new Account(name, pass, displayname, status, role_id));
            }

        } catch (SQLException e) {
        }
        return arr;
    }

    public boolean updateStatusAccount(String username) {
        boolean check = false;
        try {
            String sql = "Update Account set [status] = 0 where username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);

            check = ps.executeUpdate() > 0;

        } catch (Exception e) {
        }
        return check;
    }

    public Account getAcc(String username) {
        Account acc = new Account();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from Account  inner join Role_Account  on Account.username = Role_Account.username where Account.username= ? and Account.status = 1   ";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);

            rs = stm.executeQuery();
            if (rs.next()) {
                username = rs.getString("username");
                String pass = rs.getString("password");
                String displayname = rs.getString("displayname");
                boolean status = rs.getBoolean("status");

                int role = rs.getInt("role_id");
                acc = new Account(username, pass, displayname, status, role);
            }

        } catch (Exception ex) {

        }
        return acc;
    }

    public boolean updateAcc(String name, String username, String pass) {
        boolean check = false;
        try {
            String sql = "Update Account "
                    + "set  [password] = ? ,displayname = ?  where username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, name);
           
            ps.setString(4, username);

            check = ps.executeUpdate() > 0;

        } catch (Exception e) {
        }
        return check;
    }

    public boolean updateRole_Acc(int role_id, String username) {
        boolean check = false;
        try {
            String sql = "Update Role_Account "
                    + "set role_id = ? where username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, role_id);
            ps.setString(2, username);

            check = ps.executeUpdate() > 0;

        } catch (Exception e) {
        }
        return check;
    
    }
     public Customer getlastCust(String email, boolean status) {
        Customer cust = null;
        try {
            String sql = "SELECT TOP 1 * FROM  Customer where email = ? and [status] =?  ORDER BY customer_id DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setBoolean(2, status);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int customer_id = rs.getInt("customer_id");
                String customer_name = rs.getString("customer_name");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String email1 = rs.getString("email");

                cust = new Customer(customer_id, customer_name, address, phone, email1, status);
            }

        } catch (SQLException e) {
        }
        return cust;
    }
     
    
     public static void main(String[] args) {
         Account acc = new AccountDAO().getAcc("empt1");
         System.out.println( acc.toString());
    }

}
