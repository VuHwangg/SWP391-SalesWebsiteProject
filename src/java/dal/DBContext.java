package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {
    protected Connection connection;

    public DBContext() {
        try {
            // 1. Username (Lấy từ project ID của bạn)
            String user = "postgres.dlwedbkzfhfrnrhkmgkw";
            
            // 2. Password MỚI (Đã cập nhật)
            String pass = "2JqtnpBOpeYq3ttU";
            
            // 3. URL kết nối đến Pooler IPv4 (Port 6543)
            // Lưu ý: Không cần điền user/pass vào url nữa vì ta truyền riêng ở dưới cho an toàn
            String url = "jdbc:postgresql://aws-1-ap-south-1.pooler.supabase.com:6543/postgres?sslmode=require";

            // Load Driver Postgres
            Class.forName("org.postgresql.Driver");
            
            // Tạo kết nối
            connection = DriverManager.getConnection(url, user, pass);
            
            // Kiểm tra kết nối
            if (connection == null) {
                throw new SQLException("Connection is NULL!");
            } else {
                // Dòng này sẽ hiện trong log server nếu kết nối thành công
                System.out.println("Kết nối Supabase thành công!");
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            // In lỗi chi tiết ra Server Log
            ex.printStackTrace();
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            
            // Ném lỗi ra màn hình trình duyệt để bạn biết ngay
            throw new RuntimeException("Lỗi kết nối Database: " + ex.getMessage());
        }
    }
    
    // Hàm main để test nhanh (nếu chạy local)
    public static void main(String[] args) {
        new DBContext();
    }
}
