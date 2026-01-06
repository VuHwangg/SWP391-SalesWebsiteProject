package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Account;
import model.Customer;

public class AccountDAO extends DBContext {

    // --- LOGIC MỚI: STATUS LÀ BOOLEAN TỪ JAVA XUỐNG DB ---
    
    public boolean loginGoogle(String email, boolean status) {
        try {
            String sql = "SELECT customer_id, customer_name, address, phone, email, status "
                    + " FROM \"Customer\" "
                    + " WHERE email = ? AND status = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            // DB là boolean nên set thẳng boolean
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

    public Account checkLoginCus(String username, String password) {
        Account acc = null;
        try {
            String sql = "SELECT * FROM \"Account\" WHERE username = ? AND password = ?";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            
            if (rs.next()) {
                String name = rs.getString("username");
                String pass = rs.getString("password");
                String displayname = rs.getString("displayname");
                
                // Lấy thẳng boolean từ DB
                boolean isActive = rs.getBoolean("status");

                acc = new Account(name, pass, displayname, isActive);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return acc;
    }

    public boolean addAcount(String username, String password, String displayname, boolean status) {
        boolean check = false;
        try {
            String sql = "INSERT INTO \"Account\" (username, password, displayname, status) VALUES (?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, displayname);
            
            // Set thẳng giá trị boolean vào câu lệnh insert
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
            String sql = "INSERT INTO \"Customer\" (customer_name, address, phone, email, status) VALUES (?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customer_name);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, email);
            
            // Set thẳng giá trị boolean
            ps.setBoolean(5, status);
            
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    // Role không liên quan status, giữ nguyên logic
    public boolean addRole(int roleid, String username) {
        boolean check = false;
        try {
            String sql = "INSERT INTO \"Role_Account\" (role_id, username) VALUES (?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, roleid);
            ps.setString(2, username);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public Account checkExistAcc(String username) {
        Account acc = null;
        try {
            String sql = "SELECT * FROM \"Account\" WHERE username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                String name = rs.getString("username");
                String pass = rs.getString("password");
                String displayname = rs.getString("displayname");
                
                // Lấy boolean trực tiếp
                boolean isActive = rs.getBoolean("status");
                
                acc = new Account(name, pass, displayname, isActive);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return acc;
    }

    public int getRole(String username) {
        int role = 0;
        try {
            String sql = "SELECT role_id FROM \"Role_Account\" WHERE username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                role = rs.getInt("role_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return role;
    }

    public Customer getCust(String email) {
        Customer cust = null;
        try {
            String sql = "SELECT * FROM \"Customer\" WHERE email = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int customer_id = rs.getInt("customer_id");
                String customer_name = rs.getString("customer_name");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String email1 = rs.getString("email");
                
                // Lấy boolean trực tiếp
                boolean isActive = rs.getBoolean("status");
                
                cust = new Customer(customer_id, customer_name, address, phone, email1, isActive);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cust;
    }

    public boolean updateCust(String name, String adress, String phone, String mail) {
        boolean check = false;
        try {
            String sql = "UPDATE \"Customer\" SET customer_name = ?, address = ?, phone = ? WHERE email = ?";
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
            String sql = "UPDATE \"Account\" SET displayname = ? WHERE username = ?";
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
            String sql = "SELECT * FROM \"Account\" "
                    + " INNER JOIN \"Role_Account\" ON \"Account\".username = \"Role_Account\".username "
                    + " WHERE (\"Role_Account\".role_id = 2 OR \"Role_Account\".role_id = 3)";
            
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String name = rs.getString("username");
                String pass = rs.getString("password");
                String displayname = rs.getString("displayname");
                int role_id = rs.getInt("role_id");
                
                // Lấy status kiểu boolean
                boolean isActive = rs.getBoolean("status");
                
                // Vẫn giữ logic chỉ add Active vào list (nếu bạn muốn lấy hết thì bỏ if)
                if (isActive) {
                    arr.add(new Account(name, pass, displayname, isActive, role_id));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }

    // Sửa hàm này nhận thêm tham số boolean status để linh hoạt (Block hay Active đều dùng đc)
    public boolean updateStatusAccount(String username, boolean status) {
        boolean check = false;
        try {
            String sql = "UPDATE \"Account\" SET status = ? WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            
            // Set boolean trực tiếp
            ps.setBoolean(1, status);
            ps.setString(2, username);
            
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public Account getAcc(String username) {
        Account acc = null; 
        try {
            String sql = "SELECT * FROM \"Account\" "
                    + " INNER JOIN \"Role_Account\" ON \"Account\".username = \"Role_Account\".username "
                    + " WHERE \"Account\".username = ?";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                String uname = rs.getString("username");
                String pass = rs.getString("password");
                String displayname = rs.getString("displayname");
                int role = rs.getInt("role_id");
                
                // Lấy boolean
                boolean isActive = rs.getBoolean("status");
                
                if (isActive) {
                    acc = new Account(uname, pass, displayname, isActive, role);
                } else {
                    return null; // Tài khoản bị block (false)
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return acc;
    }

    public boolean updateAcc(String name, String username, String pass) {
        boolean check = false;
        try {
            String sql = "UPDATE \"Account\" SET password = ?, displayname = ? WHERE username = ?";
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
            String sql = "UPDATE \"Role_Account\" SET role_id = ? WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, role_id);
            ps.setString(2, username);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public Customer getlastCust(String email) {
        Customer cust = null;
        try {
            String sql = "SELECT * FROM \"Customer\" "
                    + " WHERE email = ? "
                    + " ORDER BY customer_id DESC LIMIT 1";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int customer_id = rs.getInt("customer_id");
                String customer_name = rs.getString("customer_name");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String email1 = rs.getString("email");
                
                // Lấy boolean
                boolean isActive = rs.getBoolean("status");
                
                cust = new Customer(customer_id, customer_name, address, phone, email1, isActive);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cust;
    }
}
