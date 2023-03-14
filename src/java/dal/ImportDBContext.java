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
import model.Import_History;

/**
 *
 * @author admin
 */
public class ImportDBContext extends DBContext {

    public double getTotalCostByDay(Date date) {
        double totalCost = 0;
        try {
            String sql = "SELECT [num]\n"
                    + "      ,[cost]\n"
                    + "  FROM [Import_History] WHERE [date] = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, date);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                totalCost += rs.getDouble("cost") * rs.getInt("num");
            }
            stm.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalCost;
    }

    public 
        ArrayList<Import_History>
          listHistory() {
        ArrayList<Import_History> listHistory = new ArrayList<>();
        ProductDBContext proDB = new ProductDBContext();
        AccountDAO accDB = new AccountDAO();

        try {
            String sql = "SELECT TOP (50) [import_id]\n"
                    + "      ,[num]\n"
                    + "      ,[date]\n"
                    + "      ,[note]\n"
                    + "      ,[username]\n"
                    + "      ,[cost]\n"
                    + "      ,[product_id]\n"
                    + "  FROM [Import_History]";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Import_History history = new Import_History();
                history.setId(rs.getInt("import_id"));
                //System.out.println(rs.getInt("import_id"));
                history.setNum(rs.getInt("num"));
              //  System.out.println(rs.getInt("num"));
                history.setDate(rs.getDate("date"));
               // System.out.println(rs.getDate("date"));
                history.setNote(rs.getString("note"));
                //System.out.println(rs.getString("note"));
                history.setAccount(accDB.getAcc(rs.getString("username")));
                //System.out.println(accDB.getAcc(rs.getString("username")).toString());
                //System.out.println(rs.getString("username"));
                history.setCost(rs.getDouble("cost"));
                //System.out.println(rs.getDouble("cost"));
                history.setProduct(proDB.getProductByID(rs.getInt("product_id")));
               // System.out.println(rs.getInt("product_id"));
                listHistory.add(history);
            }
            stm.close();
            rs.close();
            return listHistory;
//           System.out.println(listHistory.size());
//            for (int i = 0; i < listHistory.size(); i++) {
//                System.out.println( listHistory.get(i).toString());
//                
//            }
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listHistory;
    }

    public static void main(String[] args) {
        
                
       
            
        
    }
}
