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
            // Thông tin đăng nhập
            String user = "postgres";
            String pass = "30082002Xyz@";
            
            // ĐÃ SỬA: Thêm chữ 'k' vào địa chỉ host (dlwedbkzfhfrnrhkmgkw)
            // Thêm ?sslmode=require để đảm bảo kết nối bảo mật với Supabase
            String url = "jdbc:postgresql://db.dlwedbkzfhfrnrhkmgkw.supabase.co:5432/postgres?sslmode=require";

            // Load Driver PostgreSQL
            Class.forName("org.postgresql.Driver");
            
            // Tạo kết nối
            connection = DriverManager.getConnection(url, user, pass);
            
            // Kiểm tra nếu kết nối null thì báo lỗi ngay
            if (connection == null) {
                throw new SQLException("Connection is NULL after DriverManager.getConnection!");
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            // In chi tiết lỗi ra server log để debug
            ex.printStackTrace();
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            
            // Quan trọng: Ném lỗi ra ngoài để hiện lên màn hình web (Lỗi 500 sẽ hiện kèm message này)
            // Giúp bạn biết ngay lập tức nếu sai mật khẩu hoặc sai host
            throw new RuntimeException("Lỗi kết nối Database: " + ex.getMessage());
        }
    }
    
    // Hàm main để test nhanh (chạy file này bằng chuột phải -> Run File)
    public static void main(String[] args) {
        try {
            System.out.println("Đang thử kết nối...");
            DBContext db = new DBContext();
            if (db.connection != null) {
                System.out.println("Kết nối thành công!");
            } else {
                System.out.println("Kết nối thất bại (Connection is null)");
            }
        } catch (Exception e) {
            System.out.println("Lỗi main: " + e.getMessage());
        }
    }
}
