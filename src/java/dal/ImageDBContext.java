/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Image;
import model.Order;

/**
 *
 * @author admin
 */
public class ImageDBContext extends DBContext {

    public ArrayList<Image> listByID(int product_id) {
        ArrayList<Image> images = new ArrayList<>();
        try {
            // Sửa: Thêm ngoặc kép \"Image\"
            String sql = "SELECT image_id, url "
                    + " FROM \"Image\" WHERE product_id = ? "
                    + " ORDER BY thumbnail DESC";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, product_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Image image = new Image();
                image.setId(rs.getInt("image_id"));
                image.setUrl(rs.getString("url"));
                images.add(image);
            }
            stm.close();
            rs.close();
            return images;
        } catch (SQLException ex) {
            Logger.getLogger(ImageDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public String getImageUrl(int Proid) throws SQLException {
        String url = "";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // Sửa: Thêm ngoặc kép \"Image\"
            String sql = "SELECT url FROM \"Image\" WHERE product_id = ? ";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, Proid);

            rs = stm.executeQuery();
            if (rs.next()) {
                // Đã fix lỗi logic nhỏ như ghi chú cũ
                url = rs.getString("url"); 
            }

        } catch (SQLException ex) {
            Logger.getLogger(ImageDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) stm.close();
            if (rs != null) rs.close();
        }
        return url;
    }

    public void saveImageToDatabase(String image, int id, boolean thumbnail) {
        Runnable task = () -> {
            try {
                // Sửa: Thêm ngoặc kép \"Image\"
                String sql = "INSERT INTO \"Image\" (product_id, thumbnail, url) VALUES (?, ?, ?)";
                
                // Lưu ý: Connection trong Thread này có thể bị đóng nếu DBContext cha bị hủy.
                // Tuy nhiên, logic này giữ nguyên theo code gốc của bạn.
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, id);
                
                // Nếu cột thumbnail trong DB là INT, hãy đổi dòng dưới thành: 
                // ps.setInt(2, thumbnail ? 1 : 0);
                ps.setBoolean(2, thumbnail); 
                
                ps.setString(3, image);
                ps.executeUpdate();
                ps.close(); 
            } catch (SQLException ex) {
                Logger.getLogger(ImageDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        };
        new Thread(task).start();
    }
}
