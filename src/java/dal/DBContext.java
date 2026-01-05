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
            // === CẤU HÌNH TỪ HÌNH ẢNH SUPABASE CỦA BẠN ===
            
            // 1. User: Lấy từ chuỗi kết nối trong ảnh (postgres.dlwedbkzfhfrnrhkmgkw)
            String user = "postgres.dlwedbkzfhfrnrhkmgkw";
            
            // 2. Password: Mật khẩu bạn đã cung cấp
            String pass = "30082002Xyz@";
            
            // 3. URL: Host lấy chính xác từ ảnh (aws-1-ap-south-1...) và Port 6543
            // Thêm ?sslmode=require để đảm bảo bảo mật
            String url = "jdbc:postgresql://aws-1-ap-south-1.pooler.supabase.com:6543/postgres?sslmode=require";

            // Load Driver
            Class.forName("org.postgresql.Driver");
            
            // Tạo kết nối
            connection = DriverManager.getConnection(url, user, pass);
            
            // Kiểm tra kết nối
            if (connection == null) {
                throw new SQLException("Connection is NULL after DriverManager.getConnection!");
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            // In lỗi ra log server (để bạn xem trên Render Dashboard)
            ex.printStackTrace();
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            
            // Ném lỗi ra màn hình trình duyệt (để bạn biết ngay nếu có biến)
            throw new RuntimeException("Lỗi kết nối Database (IPv4 Pooler): " + ex.getMessage());
        }
    }
    
    // Hàm main để test nhanh nếu chạy local
    public static void main(String[] args) {
        new DBContext();
        System.out.println("Kết nối thành công!");
    }
}
