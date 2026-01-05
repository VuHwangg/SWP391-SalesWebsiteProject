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
import model.Requirement;

/**
 *
 * @author admin
 */
public class RequirementDBContext extends DBContext {

    public ArrayList<Requirement> listByID(int product_id) {
        ArrayList<Requirement> requirements = new ArrayList<>();
        try {
            // Loại bỏ dấu ngoặc vuông []
            String sql = "SELECT p.requirement_id, p.requirement_name, p.description "
                    + " FROM \"Requirement\" p "
                    + " INNER JOIN \"Product_Requirement\" pr ON pr.requirement_id = p.requirement_id "
                    + " WHERE pr.product_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, product_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Requirement requirement = new Requirement();
                requirement.setId(rs.getInt("requirement_id"));
                requirement.setName(rs.getString("requirement_name"));
                requirement.setDescription(rs.getString("description"));
                requirements.add(requirement);
            }
            stm.close();
            rs.close();
            return requirements;
        } catch (SQLException ex) {
            // Cập nhật Logger đúng tên class
            Logger.getLogger(RequirementDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Requirement> listByType(int type) {
        ArrayList<Requirement> requirements = new ArrayList<>();
        try {
            // Loại bỏ dấu ngoặc vuông []
            String sql = "SELECT DISTINCT p.requirement_id, p.requirement_name, p.description "
                    + " FROM \"Requirement\" p "
                    + " INNER JOIN \"Product_Requirement\" pr ON pr.requirement_id = p.requirement_id "
                    + " INNER JOIN \"Product\" prd ON prd.product_id = pr.product_id "
                    + " WHERE prd.type = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, type);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Requirement requirement = new Requirement();
                requirement.setId(rs.getInt("requirement_id"));
                requirement.setName(rs.getString("requirement_name"));
                requirement.setDescription(rs.getString("description"));
                requirements.add(requirement);
            }
            stm.close();
            rs.close();
            return requirements;
        } catch (SQLException ex) {
            Logger.getLogger(RequirementDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Requirement> getAllRequirement() {
        List<Requirement> requirements = new ArrayList<>();
        try {
            // Loại bỏ [dbo]. và []
            String sql = "SELECT requirement_id, requirement_name, description FROM \"Requirement\"";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Requirement requirement = new Requirement();
                requirement.setId(rs.getInt("requirement_id"));
                requirement.setName(rs.getString("requirement_name"));
                requirement.setDescription(rs.getString("description"));
                requirements.add(requirement);
            }
            stm.close();
            rs.close();
            return requirements;
        } catch (SQLException ex) {
            Logger.getLogger(RequirementDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int AddNewRequirementAndReturnId(String name) {
        try {
            // Loại bỏ [dbo]. và []
            String sql = "INSERT INTO \"Requirement\" (requirement_name) VALUES (?)";
            
            // PostgreSQL JDBC Driver hỗ trợ tốt RETURN_GENERATED_KEYS
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, name);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while (rs.next()) {                
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequirementDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
}
