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
import model.Product;

/**
 *
 * @author admin
 */
public class ProductDBContext extends DBContext {

    public ArrayList<Product> listProduct(int type, int num, boolean topSale, boolean topSold) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT TOP (?) [product_id]\n"
                    + "		  ,[name]\n"
                    + "		  ,[type]\n"
                    + "		  ,[requirement]\n"
                    + "		  ,[os]\n"
                    + "		  ,[color]\n"
                    + "		  ,[current_price]\n"
                    + "           ,[original_price]\n"
                    + "		  ,[ram]\n"
                    + "		  ,[memory]\n"
                    + "		  ,[cpu]\n"
                    + "		  ,[graphics_card]\n"
                    + "		  ,[size]\n"
                    + "		  ,[description]\n"
                    + "		  ,[discount]\n"
                    + "		  ,[qty]\n"
                    + "		  ,[sold]\n"
                    + "		  ,[status]\n"
                    + "	  FROM [Product] where  [status] = 1";
            if(type != -1){
                sql= sql+"AND [type] = ?"; 
            }
            if(topSold == true || topSale == true){
                sql= sql+" ORDER BY "; 
            }
            
            if(topSold == true){
                sql= sql+"[sold] DESC"; 
            }
            
            if(topSale == true){
                if(topSold == true) sql = sql + ", ";
                sql= sql+" [discount] DESC"; 
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, num);
            if(type != -1){ 
                stm.setInt(2, type);
            }
            
            
            
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("product_id"));
                product.setName(rs.getString("name"));
                product.setType(rs.getInt("type"));
                product.setRequirement(rs.getString("requirement"));
                product.setOs(rs.getString("os"));
                product.setColor(rs.getString("color"));
                product.setOriginal_price(rs.getDouble("original_price"));
                product.setCurrent_price(rs.getDouble("current_price"));
                product.setRam(rs.getInt("ram"));
                product.setMemory(rs.getInt("memory"));
                product.setCpu(rs.getString("cpu"));
                product.setGraphic_card(rs.getString("graphics_card"));
                product.setSize(rs.getDouble("size"));
                product.setDescription(rs.getString("description"));
                product.setDiscount(rs.getDouble("discount"));
                product.setQty(rs.getInt("qty"));
                product.setSold(rs.getInt("sold"));
                product.setStatus(rs.getBoolean("status"));
                BrandDBContext brdb = new BrandDBContext();
                ImageDBContext imgdb = new ImageDBContext();
                product.setBrands(brdb.listByID(product.getId()));
                product.setImage(imgdb.listByID(product.getId()));
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> listProduct(String rawTxtSearch, String sort) {
        ArrayList<Product> products = new ArrayList<>();
        String txtSearch = "%" + rawTxtSearch + "%";
        try {
            String sql = "SELECT [product_id]\n"
                    + "		  ,[name]\n"
                    + "		  ,[type]\n"
                    + "		  ,[requirement]\n"
                    + "		  ,[os]\n"
                    + "		  ,[color]\n"
                    + "		  ,[current_price]\n"
                    + "           ,[original_price]\n"
                    + "		  ,[ram]\n"
                    + "		  ,[memory]\n"
                    + "		  ,[cpu]\n"
                    + "		  ,[graphics_card]\n"
                    + "		  ,[size]\n"
                    + "		  ,[description]\n"
                    + "		  ,[discount]\n"
                    + "		  ,[qty]\n"
                    + "		  ,[sold]\n"
                    + "		  ,[status]\n"
                    + "  FROM   [Product] \n"
                    + "  WHERE [name] LIKE ?\n"
                    + "   OR [requirement] LIKE ?\n"
                    + "   OR [os] LIKE ?\n"
                    + "   OR [color] LIKE ?\n"
                    + "   OR [ram] LIKE ?\n"
                    + "   OR [memory] LIKE ?\n"
                    + "   OR [cpu] LIKE ?\n"
                    + "   OR [graphics_card] LIKE ? AND [status] = 1";

            if (sort.compareTo("ASC") == 0) {
                sql = sql + "\n ORDER BY [current_price] ASC";
            }
            if (sort.compareTo("DESC") == 0) {
                sql = sql + "\n ORDER BY [current_price] DESC";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, txtSearch);
            stm.setString(2, txtSearch);
            stm.setString(3, txtSearch);
            stm.setString(4, txtSearch);
            stm.setString(5, txtSearch);
            stm.setString(6, txtSearch);
            stm.setString(7, txtSearch);
            stm.setString(8, txtSearch);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("product_id"));
                product.setName(rs.getString("name"));
                product.setType(rs.getInt("type"));
                product.setRequirement(rs.getString("requirement"));
                product.setOs(rs.getString("os"));
                product.setColor(rs.getString("color"));
                product.setOriginal_price(rs.getDouble("original_price"));
                product.setCurrent_price(rs.getDouble("current_price"));
                product.setRam(rs.getInt("ram"));
                product.setMemory(rs.getInt("memory"));
                product.setCpu(rs.getString("cpu"));
                product.setGraphic_card(rs.getString("graphics_card"));
                product.setSize(rs.getDouble("size"));
                product.setDescription(rs.getString("description"));
                product.setDiscount(rs.getDouble("discount"));
                product.setQty(rs.getInt("qty"));
                product.setSold(rs.getInt("sold"));
                product.setStatus(rs.getBoolean("status"));
                BrandDBContext brdb = new BrandDBContext();
                ImageDBContext imgdb = new ImageDBContext();
                product.setBrands(brdb.listByID(product.getId()));
                product.setImage(imgdb.listByID(product.getId()));
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
