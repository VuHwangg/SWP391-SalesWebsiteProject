/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Import_History;

/**
 *
 * @author admin
 */
public class ImportDBContext extends DBContext {

    public double getTotalCostByDay(Date date) {
        double totalCost = 0;
        try {
            // Sửa: Thêm ngoặc kép \"Import_History\"
            String sql = "SELECT num, cost FROM \"Import_History\" WHERE date = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, date);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                totalCost += rs.getDouble("cost") * rs.getInt("num");
            }
            stm.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ImportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalCost;
    }

    public ArrayList<Import_History> listHistoryByDay(Date from, Date to) {
        ArrayList<Import_History> listHistory = new ArrayList<>();
        ProductDBContext proDB = new ProductDBContext();
        AccountDAO accDB = new AccountDAO();

        try {
            // Sửa: Thêm ngoặc kép \"Import_History\"
            String sql = "SELECT import_id, num, date, note, username, cost, product_id "
                    + " FROM \"Import_History\" "
                    + " WHERE date BETWEEN ? AND ? "
                    + " ORDER BY date DESC";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, from);
            stm.setDate(2, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Import_History history = new Import_History();
                history.setId(rs.getInt("import_id"));
                history.setNum(rs.getInt("num"));
                history.setDate(rs.getDate("date"));
                history.setNote(rs.getString("note"));
                
                // Logic map object giữ nguyên
                history.setAccount(accDB.getAcc(rs.getString("username")));
                history.setCost(rs.getDouble("cost"));
                history.setProduct(proDB.getProductByIDWithOutStatus(rs.getInt("product_id")));
                
                listHistory.add(history);
            }
            stm.close();
            rs.close();
            return listHistory;
        } catch (SQLException ex) {
            Logger.getLogger(ImportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listHistory;
    }

    public int importProduct(Import_History ih) {
        int x = -1;
        try {
            // Sửa: Thêm ngoặc kép \"Import_History\"
            String sql = "INSERT INTO \"Import_History\" (num, date, username, cost, product_id) "
                    + " VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ih.getNum());
            
            // PostgreSQL tương thích tốt với java.sql.Date
            LocalDate ld = LocalDate.now();
            ps.setDate(2, Date.valueOf(ld));
            
            ps.setString(3, ih.getAccount().getUsername());
            ps.setDouble(4, ih.getCost());
            
            // Giữ nguyên logic cũ của bạn (ih.getId() ở đây đóng vai trò là product_id khi truyền vào)
            ps.setInt(5, ih.getId());
            
            x = ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ImportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
    }
}
