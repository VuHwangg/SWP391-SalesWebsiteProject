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
import model.Requirement;

/**
 *
 * @author admin
 */
public class RequirementDBContext extends DBContext {

    public ArrayList<Requirement> listByID(int product_id) {
        ArrayList<Requirement> requirements = new ArrayList<>();
        try {
            String sql = "SELECT p.[requirement_id]\n"
                    + "      ,p.[requirement_name]\n"
                    + "      ,p.[description]\n"
                    + "  FROM [Requirement] p INNER JOIN Product_Requirement pr ON pr.requirement_id = p.requirement_name\n"
                    + "  WHERE pr.product_id = ?";
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
            return requirements;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Requirement> listByType(int type) {
        ArrayList<Requirement> requirements = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT p.[requirement_id]\n"
                    + "      ,p.[requirement_name]\n"
                    + "      ,p.[description]\n"
                    + "      FROM [Requirement] p\n"
                    + "      INNER JOIN Product_Requirement pr ON pr.requirement_id = p.requirement_id\n"
                    + "      INNER JOIN Product prd ON prd.product_id = pr.product_id\n"
                    + "      WHERE prd.[type] = ?";
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
            return requirements;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
