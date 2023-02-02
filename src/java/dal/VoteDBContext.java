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
import model.Vote;

/**
 *
 * @author admin
 */
public class VoteDBContext extends DBContext{
    public ArrayList<Vote> list(int product_id) {
        ArrayList<Vote> votes = new ArrayList<>();
        try {
            String sql = "SELECT  [vote_id]\n"
                    + "      ,[num]\n"
                    + "      ,[num_of_vote]\n"
                    + "      FROM [Vote] WHERE product_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, product_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Vote vote = new Vote();
                vote.setId(rs.getInt("vote_id"));
                vote.setNum(rs.getInt("num"));
                vote.setNum_of_vote(rs.getInt("num_of_vote"));
                votes.add(vote);
            }
            return votes;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
