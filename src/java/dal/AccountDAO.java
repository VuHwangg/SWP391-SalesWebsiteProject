package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Account;
import model.Customer;

public class AccountDAO extends DBContext {

    // --- LOGIC QUAN TRỌNG VỀ STATUS ---
    // Status trong Java là boolean (true/false)
    // Status trong DB là int (0: Block, 1: Active, >1: Cũng coi là Active cho các data cũ)
    
    public boolean loginGoogle(String email, boolean status) {
        try {
            String sql = "SELECT customer_id, customer_name, address, phone, email, status "
                    + " FROM \"Customer\" "
                    + " WHERE email = ? AND status = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setInt(2, status ? 1 : 0); // Convert boolean -> int
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
        try {
            // Lấy tất cả user khớp user/pass, không lọc cứng status = 1 ở câu lệnh SQL
            // Để code Java tự xử lý logic status 1, 2, 3
            String sql = "SELECT * FROM \"Account\" WHERE username = ? AND password = ?";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            
            if (rs.next()) {
                String name = rs.getString("username");
                String pass = rs.getString("password");
                String displayname = rs.getString("displayname");
                
                // LOGIC QUAN TRỌNG:
                // Lấy status gốc từ DB (có thể là 1, 2, 3)
                int dbStatus = rs.getInt("status");
                
                // Quy ước: Bất kỳ số nào > 0 đều là Active (true)
                // 0 hoặc null là Block (false)
                boolean isActive = (dbStatus > 0);

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
            
            // Khi tạo mới, nếu true thì lưu là 1 (Chuẩn hóa data về 1)
            ps.setInt(4, status ? 1 : 0);
            
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
            ps.setInt(5, status ? 1 : 0);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean addRole(int roleid, String username) {
        boolean check = false;
        try {
            // Đây mới là nơi lưu quyền (1: Admin, 2: Empt, ...)
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

    public Account checkExistAcc(String username, boolean status) {
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
                int dbStatus = rs.getInt("status");
                // Logic: > 0 là tồn tại/active
                acc = new Account(name, pass, displayname, dbStatus > 0);
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

    public Customer getCust(String email, boolean status) {
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
                int dbStatus = rs.getInt("status");
                
                // Nếu cần check status đúng status truyền vào
                // int reqStatus = status ? 1 : 0;
                // if (dbStatus == reqStatus) { ... }
                // Nhưng để an toàn, ta chỉ cần check > 0 là active
                
                cust = new Customer(customer_id, customer_name, address, phone, email1, dbStatus > 0);
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
            // Join Account với Role_Account để lấy đúng Role
            String sql = "SELECT * FROM \"Account\" "
                    + " INNER JOIN \"Role_Account\" ON \"Account\".username = \"Role_Account\".username "
                    + " WHERE (\"Role_Account\".role_id = 2 OR \"Role_Account\".role_id = 3)";
            
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String name = rs.getString("username");
                String pass = rs.getString("password");
                String displayname = rs.getString("displayname");
                int dbStatus = rs.getInt("status");
                int role_id = rs.getInt("role_id");
                
                // Chỉ thêm vào list nếu status > 0 (Active)
                if (dbStatus > 0) {
                    arr.add(new Account(name, pass, displayname, true, role_id));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }

    public boolean updateStatusAccount(String username) {
        boolean check = false;
        try {
            // Block user -> set status = 0
            String sql = "UPDATE \"Account\" SET status = 0 WHERE username = ?";
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
                int dbStatus = rs.getInt("status");
                int role = rs.getInt("role_id");
                
                // Chỉ trả về nếu status > 0
                if (dbStatus > 0) {
                    acc = new Account(uname, pass, displayname, true, role);
                } else {
                     return null; // Tài khoản bị block
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return acc;
    }

    // Các hàm khác giữ nguyên logic tương tự...
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

    public Customer getlastCust(String email, boolean status) {
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
                int dbStatus = rs.getInt("status");
                cust = new Customer(customer_id, customer_name, address, phone, email1, dbStatus > 0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cust;
    }
}
