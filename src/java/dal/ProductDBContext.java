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
            if (type != -1) {
                sql = sql + "AND [type] = ?";
            }
            if (topSold == true || topSale == true) {
                sql = sql + " ORDER BY ";
            }

            if (topSold == true) {
                sql = sql + "[sold] DESC";
            }

            if (topSale == true) {
                if (topSold == true) {
                    sql = sql + ", ";
                }
                sql = sql + " [discount] DESC";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, num);
            if (type != -1) {
                stm.setInt(2, type);
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("product_id"));
                product.setName(rs.getString("name"));
                product.setType(rs.getInt("type"));
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
                RequirementDBContext reqdb = new RequirementDBContext();
                ImageDBContext imgdb = new ImageDBContext();
                product.setBrands(brdb.listByID(product.getId()));
                product.setRequirement(reqdb.listByID(product.getId()));
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
            if (sort.compareTo("none") == 0) {
                sql = sql + "\n ORDER BY [discount] DESC";
            }
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
                RequirementDBContext reqdb = new RequirementDBContext();
                ImageDBContext imgdb = new ImageDBContext();
                product.setBrands(brdb.listByID(product.getId()));
                product.setRequirement(reqdb.listByID(product.getId()));
                product.setImage(imgdb.listByID(product.getId()));
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> filterProduct(int type, String sort, double from, double to, String[] needs, String[] brands) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT pr.[product_id]\n"
                    + "      ,pr.[name]\n"
                    + "      ,pr.[type]\n"
                    + "      ,pr.[os]\n"
                    + "      ,pr.[feature_product]\n"
                    + "      ,pr.[color]\n"
                    + "      ,pr.[current_price]\n"
                    + "      ,pr.[original_price]\n"
                    + "      ,pr.[ram]\n"
                    + "      ,pr.[memory]\n"
                    + "      ,pr.[cpu]\n"
                    + "      ,pr.[graphics_card]\n"
                    + "      ,pr.[size]\n"
                    + "      ,pr.[description]\n"
                    + "      ,pr.[discount]\n"
                    + "      ,pr.[qty]\n"
                    + "      ,pr.[sold]\n"
                    + "      ,pr.[status]\n"
                    + "  FROM  [Product] pr "
                    + "  Inner Join [Product_Brand] prbr On pr.product_id = prbr.product_id\n"
                    + "  Inner Join [Brand] br on prbr.brand_id = br.brand_id\n"
                    + "  Inner Join [Product_Requirement] prre On pr.product_id = prre.product_id\n"
                    + "  Inner Join [Requirement] re on prre.requirement_id =re.requirement_id\n"
                    + "  where  pr.[status] = 1 AND pr.[current_price] >= ? AND pr.[current_price] <= ? AND pr.[type] = ?\n";
            if (needs != null) {
                if (needs[0].compareTo("all") != 0) {
                    sql = sql + " AND re.[requirement_name] in (";
                    for (String need : needs) {
                        sql = sql + "'" + need + "',";
                    }
                    sql = sql.substring(0, sql.length() - 1);
                    sql = sql + ")";
                }

            }

            if (brands != null) {
                if (brands[0].compareTo("all") != 0) {
                    sql = sql + " AND br.[brand_name] in (";
                    for (String brand : brands) {
                        sql = sql + "'" + brand + "',";
                    }
                    sql = sql.substring(0, sql.length() - 1);
                    sql = sql + ")";
                }

            }

//            if (sizes != null) {
//                if (sizes[0].compareTo("all")!=0) { 
//                    int i = 0;
//                    for (String size : sizes) {
//                        if(i==0){
//                            sql+=" AND ";
//                        }else{
//                            sql+=" OR ";
//                        }
//                        if(size.compareTo("size1")==0){
//                            sql = sql + "pr.[size] < 13";
//                        }
//                        if(size.compareTo("size2")==0){
//                            sql = sql + "pr.[size] >=14 AND pr.[size]<15";
//                        }
//                        if(size.compareTo("size3")==0){
//                            sql = sql + "pr.[size] >=15 AND pr.[size]<17";
//                        }
//                        if(size.compareTo("size4")==0){
//                            sql = sql + "pr.[size] >= 17";
//                        }
//                    }
//                }
//            }
            if (sort.compareTo("none") == 0) {
                sql = sql + "\n ORDER BY pr.[discount] DESC";
            }
            if (sort.compareTo("ASC") == 0) {
                sql = sql + "\n ORDER BY pr.[current_price] ASC";
            }
            if (sort.compareTo("DESC") == 0) {
                sql = sql + "\n ORDER BY pr.[current_price] DESC";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDouble(1, from);
            stm.setDouble(2, to);
            stm.setInt(3, type);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("product_id"));
                product.setName(rs.getString("name"));
                product.setType(rs.getInt("type"));
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
                RequirementDBContext reqdb = new RequirementDBContext();
                ImageDBContext imgdb = new ImageDBContext();
                product.setBrands(brdb.listByID(product.getId()));
                product.setRequirement(reqdb.listByID(product.getId()));
                product.setImage(imgdb.listByID(product.getId()));
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public String testString(int type, String sort, double from, double to, String[] needs, String[] brands) {
        String sql = "SELECT	pr.[product_id]\n"
                + "      ,pr.[name]\n"
                + "      ,pr.[type]\n"
                + "      ,pr.[os]\n"
                + "      ,pr.[feature_product]\n"
                + "      ,pr.[color]\n"
                + "      ,pr.[current_price]\n"
                + "      ,pr.[original_price]\n"
                + "      ,pr.[ram]\n"
                + "      ,pr.[memory]\n"
                + "      ,pr.[cpu]\n"
                + "      ,pr.[graphics_card]\n"
                + "      ,pr.[size]\n"
                + "      ,pr.[description]\n"
                + "      ,pr.[discount]\n"
                + "      ,pr.[qty]\n"
                + "      ,pr.[sold]\n"
                + "      ,pr.[status]\n"
                + "      ,br.brand_name\n"
                + "  FROM  [Product] pr "
                + "  Inner Join [Product_Brand] prbr On pr.product_id = prbr.product_id\n"
                + "  Inner Join [Brand] br on prbr.brand_id = br.brand_id\n"
                + "  where  pr.[status] = 1 AND pr.[current_price] >= ? AND pr.[current_price] <= ? AND pr.[type] = ?\n";
        if (needs != null && needs[0] != "all") {
            sql = sql + " AND pr.[requirement] in (";
            for (String need : needs) {
                sql = sql + "'" + need + "',";
            }
            sql = sql.substring(0, sql.length() - 1);
            sql = sql + ")";
        }

        if (brands != null && brands[0].compareTo("all") != 0) {
            sql = sql + " AND br.[brand_name] in (";
            for (String brand : brands) {
                sql = sql + "'" + brand + "',";
            }
            sql = sql.substring(0, sql.length() - 1);
            sql = sql + ")";
        }
        if (sort.compareTo("none") == 0) {
            sql = sql + "\n ORDER BY pr.[discount] DESC";
        }
        if (sort.compareTo("ASC") == 0) {
            sql = sql + "\n ORDER BY pr.[current_price] ASC";
        }
        if (sort.compareTo("DESC") == 0) {
            sql = sql + "\n ORDER BY pr.[current_price] DESC";
        }
        return sql;
    }
}
