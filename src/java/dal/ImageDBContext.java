/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Image;

/**
 *
 * @author admin
 */
public class ImageDBContext extends DBContext{
    public ArrayList<Image> listByID(int product_id) {
        ArrayList<Image> images = new ArrayList<>();
        try {
            String sql = "SELECT [image_id]\n"
                    + "      ,[url]\n"
                    + "  FROM [Image] WHERE product_id = ?\n"
                    + "  ORDER BY thumbnail DESC";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, product_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Image image = new Image();
                image.setId(rs.getInt("image_id"));
                image.setUrl(rs.getString("url"));
                images.add(image);
            }
            return images;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
