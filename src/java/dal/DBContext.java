public class DBContext {
    protected Connection connection;
    public DBContext()
    {
        try {
            String user = "postgres";
            String pass = "30082002Xyz@";
            // Thêm ?sslmode=require để chắc chắn Supabase cho phép kết nối
            String url = "jdbc:postgresql://db.dlwedbkzfhfrnrhmgkw.supabase.co:5432/postgres?sslmode=require";

            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url, user, pass);
            
            // Test thử xem connection có null không
            if (connection == null) {
                throw new SQLException("Connection is NULL after DriverManager.getConnection!");
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            // === SỬA ĐOẠN NÀY ===
            // In lỗi ra console server
            ex.printStackTrace(); 
            // Ném lỗi RuntimeException để hiện lên màn hình trình duyệt (giúp bạn debug)
            throw new RuntimeException("Lỗi kết nối Database: " + ex.getMessage());
        }
    }
    // ...
}
