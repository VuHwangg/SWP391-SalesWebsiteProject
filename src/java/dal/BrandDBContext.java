/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;

/**
 *
 * @author admin
 */
public class BrandDBContext extends DBContext {

    public ArrayList<Brand> listByID(int product_id) {
        ArrayList<Brand> brands = new ArrayList<>();
        try {
            // Sửa: Thêm ngoặc kép cho tên bảng \"Brand\" và \"Product_Brand\"
            String sql = "SELECT b.brand_id, b.brand_name, b.description "
                    + " FROM \"Brand\" b "
                    + " INNER JOIN \"Product_Brand\" pb ON pb.brand_id = b.brand_id "
                    + " WHERE pb.product_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, product_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand();
                brand.setId(rs.getInt("brand_id"));
                brand.setName(rs.getString("brand_name"));
                brand.setDescription(rs.getString("description"));
                brands.add(brand);
            }
            stm.close();
            rs.close();
            return brands;
        } catch (SQLException ex) {
            Logger.getLogger(BrandDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Brand> listByType(int type) {
        ArrayList<Brand> brands = new ArrayList<>();
        try {
            // Sửa: Thêm ngoặc kép cho \"Brand\", \"Product_Brand\", \"Product\"
            String sql = "SELECT DISTINCT b.brand_id, b.brand_name, b.description "
                    + " FROM \"Brand\" b "
                    + " INNER JOIN \"Product_Brand\" pb ON pb.brand_id = b.brand_id "
                    + " INNER JOIN \"Product\" pr ON pr.product_id = pb.product_id "
                    + " WHERE pr.type = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, type);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand();
                brand.setId(rs.getInt("brand_id"));
                brand.setName(rs.getString("brand_name"));
                brand.setDescription(rs.getString("description"));
                brands.add(brand);
            }
            stm.close();
            rs.close();
            return brands;
        } catch (SQLException ex) {
            Logger.getLogger(BrandDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Brand> getAllBrand() {
        List<Brand> brands = new ArrayList<>();
        try {
            // Sửa: Thêm ngoặc kép \"Brand\"
            String sql = "SELECT brand_id, brand_name, description FROM \"Brand\"";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand();
                brand.setId(rs.getInt("brand_id"));
                brand.setName(rs.getString("brand_name"));
                brand.setDescription(rs.getString("description"));
                brands.add(brand);
            }
            stm.close();
            rs.close();
            return brands;
        } catch (SQLException ex) {
            Logger.getLogger(BrandDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int AddNewBrandAndReturnId(String brandName) {
        try {
            // Sửa: Thêm ngoặc kép \"Brand\"
            String sql = "INSERT INTO \"Brand\" (brand_name) VALUES (?)";
            
            // PostgreSQL hỗ trợ Statement.RETURN_GENERATED_KEYS thông qua JDBC driver rất tốt
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, brandName);
            ps.executeUpdate();
            
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {                
                // Cột trả về mặc định của Postgres thường là cột đầu tiên hoặc cột ID
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
}
