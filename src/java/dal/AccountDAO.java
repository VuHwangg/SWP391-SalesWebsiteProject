package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Account;
import model.Customer;

public class AccountDAO extends DBContext {

    public boolean loginGoogle(String email, boolean status) {
        try {
            // Loại bỏ [dbo] và []
            String sql = "SELECT customer_id, customer_name, address, phone, email, status "
                    + " FROM Customer "
                    + " WHERE email = ? AND status = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setBoolean(2, status);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Account checkLoginCus(String username, String password, boolean status) {
        Account acc = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // Loại bỏ [] quanh status
            String sql = "SELECT * "
                    + " FROM Account "
                    + " WHERE username = ? AND password = ? AND status = 1";
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
            ex.printStackTrace();
        }
        return acc;
    }

    public boolean addAcount(String username, String password, String displayname, boolean status) {
        boolean check = false;
        try {
            String sql = "INSERT INTO Account (username, password, displayname, status) VALUES (?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, displayname);
            ps.setBoolean(4, status);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean addCust(String customer_name, String address, String phone, String email, boolean status) {
        boolean check = false;
        try {
            String sql = "INSERT INTO Customer (customer_name, address, phone, email, status) VALUES (?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customer_name);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, email);
            ps.setBoolean(5, status);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean addRole(int roleid, String username) {
        boolean check = false;
        try {
            String sql = "INSERT INTO Role_Account (role_id, username) VALUES (?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, roleid);
            ps.setString(2, username);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public Account checkExistAcc(String username, boolean status) {
        Account acc = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM Account WHERE username = ? AND status = 1";
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
            ex.printStackTrace();
        }
        return acc;
    }

    public int getRole(String username) {
        int role = 0;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT role_id FROM Role_Account WHERE username = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            rs = stm.executeQuery();
            if (rs.next()) {
                role = rs.getInt("role_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return role;
    }

    public Customer getCust(String email, boolean status) {
        Customer cust = null;
        try {
            String sql = "SELECT customer_id, customer_name, address, phone, email, status "
                    + " FROM Customer "
                    + " WHERE email = ? AND status = ?";
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
            e.printStackTrace();
        }
        return cust;
    }

    public boolean updateCust(String name, String adress, String phone, String mail) {
        boolean check = false;
        try {
            String sql = "UPDATE Customer SET customer_name = ?, address = ?, phone = ? WHERE email = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, adress);
            ps.setString(3, phone);
            ps.setString(4, mail);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateAccName(String name, String mail) {
        boolean check = false;
        try {
            String sql = "UPDATE Account SET displayname = ? WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, mail);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public ArrayList<Account> arrAcc() {
        ArrayList<Account> arr = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Account "
                    + " INNER JOIN Role_Account ON Account.username = Role_Account.username "
                    + " WHERE (Role_Account.role_id = 2 OR Role_Account.role_id = 3) AND Account.status = 1";
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
            e.printStackTrace();
        }
        return arr;
    }

    public boolean updateStatusAccount(String username) {
        boolean check = false;
        try {
            String sql = "UPDATE Account SET status = 0 WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public Account getAcc(String username) {
        Account acc = new Account();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM Account "
                    + " INNER JOIN Role_Account ON Account.username = Role_Account.username "
                    + " WHERE Account.username = ? AND Account.status = 1";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            rs = stm.executeQuery();
            if (rs.next()) {
                String uname = rs.getString("username");
                String pass = rs.getString("password");
                String displayname = rs.getString("displayname");
                boolean status = rs.getBoolean("status");
                int role = rs.getInt("role_id");
                acc = new Account(uname, pass, displayname, status, role);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return acc;
    }

    public boolean updateAcc(String name, String username, String pass) {
        boolean check = false;
        try {
            String sql = "UPDATE Account SET password = ?, displayname = ? WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, name);
            ps.setString(3, username);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateRole_Acc(int role_id, String username) {
        boolean check = false;
        try {
            String sql = "UPDATE Role_Account SET role_id = ? WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, role_id);
            ps.setString(2, username);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public Customer getlastCust(String email, boolean status) {
        Customer cust = null;
        try {
            // Đổi TOP 1 thành LIMIT 1 ở cuối câu lệnh
            String sql = "SELECT * FROM Customer "
                    + " WHERE email = ? AND status = ? "
                    + " ORDER BY customer_id DESC LIMIT 1";
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
            e.printStackTrace();
        }
        return cust;
    }

    public static void main(String[] args) {
        Account acc = new AccountDAO().getAcc("empt1");
        System.out.println(acc.toString());
    }
}
