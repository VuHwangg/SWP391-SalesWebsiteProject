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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.UserVote;
import model.Vote;

/**
 *
 * @author admin
 */
public class VoteDBContext extends DBContext {

    public ArrayList<Vote> listByID(int product_id) {
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
            stm.close();
            rs.close();
            return votes;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int sendRate(String username, int productId, String comment, int rating) {
        try {
            String sql = "INSERT INTO [Vote_Of_User](username,product_id,comment,num_of_star,confirm)\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, username);
            ps.setInt(2, productId);
            ps.setString(3, comment);
            ps.setInt(4, rating);
            ps.setInt(5, 0);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ArrayList<UserVote> listByProductId(int product_id) {
        ArrayList<UserVote> userVotes = new ArrayList<>();
        try {
            String sql = "SELECT [vote_of_user_id]\n"
                    + "      ,[num_of_star]\n"
                    + "      ,[comment]\n"
                    + "      ,[username]\n"
                    + "  FROM [Vote_Of_User] WHERE product_id = ? AND [confirm] = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, product_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                UserVote uv = new UserVote();
                AccountDAO accDB = new AccountDAO();
                uv.setId(rs.getInt("vote_of_user_id"));
                uv.setRating(rs.getInt("num_of_star"));
                uv.setComment(rs.getString("comment"));
                uv.setAcc(accDB.getAcc(rs.getString("username")));
                userVotes.add(uv);
            }
            stm.close();
            rs.close();
            return userVotes;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
