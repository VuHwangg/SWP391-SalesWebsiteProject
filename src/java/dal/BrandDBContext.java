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
            String sql = "SELECT b.[brand_id]\n"
                    + "      ,b.[brand_name]\n"
                    + "      ,b.[description]\n"
                    + "      FROM [Brand] b\n"
                    + "      INNER JOIN Product_Brand pb ON pb.brand_id = b.brand_id\n"
                    + "      WHERE pb.product_id = ?";
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
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Brand> listByType(int type) {
        ArrayList<Brand> brands = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT b.[brand_id]\n"
                    + "      ,b.[brand_name]\n"
                    + "      ,b.[description]\n"
                    + "      FROM [Brand] b\n"
                    + "      INNER JOIN Product_Brand pb ON pb.brand_id = b.brand_id\n"
                    + "      INNER JOIN Product pr ON pr.product_id = pb.product_id\n"
                    + "      WHERE pr.[type] = ?";
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
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Brand> getAllBrand() {
        List<Brand> brands = new ArrayList<>();
        try {
            String sql = "SELECT [brand_id]\n"
                    + "      ,[brand_name]\n"
                    + "      ,[description]\n"
                    + "  FROM [Brand]";
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
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int AddNewBrandAndReturnId(String brandName) {
        try {
            String sql = "INSERT INTO [dbo].[Brand]\n"
                    + "           ([brand_name])\n"
                    + "     VALUES\n"
                    + "           (?)";
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, brandName);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while (rs.next()) {                
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
}
