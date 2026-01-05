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
            // Loại bỏ dấu ngoặc vuông []
            String sql = "SELECT vote_id, num, num_of_vote "
                    + " FROM \"Vote\" WHERE product_id = ?";
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
            // Loại bỏ dấu ngoặc vuông []
            String sql = "INSERT INTO \"Vote_Of_User\" (username, product_id, comment, num_of_star, confirm) "
                    + " VALUES (?, ?, ?, ?, ?)";
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
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ArrayList<UserVote> listByProductId(int product_id) {
        ArrayList<UserVote> userVotes = new ArrayList<>();
        try {
            // Loại bỏ dấu ngoặc vuông []
            String sql = "SELECT vote_of_user_id, num_of_star, comment, username "
                    + " FROM \"Vote_Of_User\" WHERE product_id = ? AND confirm = 1";
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

    public ArrayList<UserVote> listAllUnconfimred() {
        ArrayList<UserVote> userVotes = new ArrayList<>();
        try {
            // Loại bỏ dấu ngoặc vuông []
            String sql = "SELECT vote_of_user_id, num_of_star, product_id, comment, username "
                    + " FROM \"Vote_Of_User\" WHERE confirm = 0";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                UserVote uv = new UserVote();
                AccountDAO accDB = new AccountDAO();
                ProductDBContext proDB = new ProductDBContext();
                uv.setId(rs.getInt("vote_of_user_id"));
                uv.setRating(rs.getInt("num_of_star"));
                uv.setComment(rs.getString("comment"));
                uv.setAcc(accDB.getAcc(rs.getString("username")));
                uv.setProduct(proDB.getProductByIDWithOutStatus(rs.getInt("product_id")));
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

    public int updateStatus(int id, int status) {
        try {
            // Loại bỏ dấu ngoặc vuông []
            String sql = "UPDATE \"Vote_Of_User\" SET confirm = ? WHERE vote_of_user_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int getByProductIdAndRating(int product_id, int rating) {
        int id = 0;
        try {
            // Loại bỏ dấu ngoặc vuông []
            String sql = "SELECT vote_id FROM \"Vote\" WHERE product_id = ? AND num = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, product_id);
            stm.setInt(2, rating);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                id = rs.getInt("vote_id");
            }
            stm.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public int getNumOfVoteByID(int voteID) {
        int num = 0;
        try {
            // Loại bỏ dấu ngoặc vuông []
            String sql = "SELECT num_of_vote FROM \"Vote\" WHERE vote_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, voteID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                num = rs.getInt("num_of_vote");
            }
            stm.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

    public int insertVote(int productId, int rating) {
        try {
            // Loại bỏ dấu ngoặc vuông []
            String sql = "INSERT INTO \"Vote\" (product_id, num, num_of_vote) VALUES (?, ?, 1)";
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, productId);
            ps.setInt(2, rating);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int updateVote(int voteId, int numOfVote) {
        numOfVote++;
        try {
            // Loại bỏ dấu ngoặc vuông []
            String sql = "UPDATE \"Vote\" SET num_of_vote = ? WHERE vote_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, numOfVote);
            ps.setInt(2, voteId);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int getNumOfVoteByStatus(int status) {
        int num = 0;
        try {
            // Loại bỏ dấu ngoặc vuông []
            String sql = "SELECT COUNT(vote_of_user_id) AS num "
                    + " FROM \"Vote_Of_User\" WHERE confirm = ? GROUP BY confirm";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                num = rs.getInt("num");
            }
            stm.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

}
