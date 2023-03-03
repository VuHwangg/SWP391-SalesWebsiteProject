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

    //for product detail(lấy sản phẩm theo id)
    public Product getProductByID(int id) {
        Product product = new Product();
        try {
            String sql = "SELECT   [product_id]\n"
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
                    + "	  FROM [Product] where  [status] = 1 AND [product_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
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
                VoteDBContext vdb = new VoteDBContext();
                product.setVotes(vdb.listByID(product.getId()));
                product.setBrands(brdb.listByID(product.getId()));
                product.setRequirement(reqdb.listByID(product.getId()));
                product.setImage(imgdb.listByID(product.getId()));
            }
            stm.close();
            rs.close();
            return product;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //lấy ra các sản phẩm có thuộc tính cụ thể
    public Product getProduct(String name, int ram, int memory, String cpu, String graphic_card) {
        Product product = new Product();
        try {
            String sql = "SELECT TOP (1)  [product_id]\n"
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
                    + "  FROM [Product]\n"
                    + "  where  [status] = 1 and [name] like ? \n"
                    + "and [ram] like ? and [memory] like ? and [cpu] like ? and [graphics_card] like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setInt(2, ram);
            stm.setInt(3, memory);
            stm.setString(4, cpu);
            stm.setString(5, graphic_card);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
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
                VoteDBContext vdb = new VoteDBContext();
                product.setVotes(vdb.listByID(product.getId()));
                product.setBrands(brdb.listByID(product.getId()));
                product.setRequirement(reqdb.listByID(product.getId()));
                product.setImage(imgdb.listByID(product.getId()));
            }
            stm.close();
            rs.close();
            return product;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //for home screen(lấy ra các sản phẩm theo phân loại, top sale, top sold)
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
                VoteDBContext vdb = new VoteDBContext();
                product.setVotes(vdb.listByID(product.getId()));
                product.setBrands(brdb.listByID(product.getId()));
                product.setRequirement(reqdb.listByID(product.getId()));
                product.setImage(imgdb.listByID(product.getId()));
                products.add(product);
            }
            stm.close();
            rs.close();
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //count num of product
    public int countProductByType(int type, double from, double to, String[] needs, String[] brands, String[] sizes) {
        int count = 0;
        try {
            String sql = "SELECT pr.[product_id]\n"
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

            if (sizes != null) {
                if (sizes[0].compareTo("all") != 0) {
                    int i = 0;
                    sql = sql + " AND pr.product_id in (SELECT pr.[product_id] FROM [Product] pr where";
                    for (String size : sizes) {
                        if (i != 0) {
                            sql += " OR ";
                        }
                        if (size.compareTo("size1") == 0) {
                            sql = sql + " pr.[size] < 13";
                        }
                        if (size.compareTo("size2") == 0) {
                            sql = sql + " pr.[size] >=13 AND pr.[size]<15";
                        }
                        if (size.compareTo("size3") == 0) {
                            sql = sql + " pr.[size] >=15 AND pr.[size]<17";
                        }
                        if (size.compareTo("size4") == 0) {
                            sql = sql + " pr.[size] >= 17";
                        }
                        i++;
                    }
                    sql = sql + ")";
                }
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDouble(1, from);
            stm.setDouble(2, to);
            stm.setInt(3, type);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count++;
            }
            stm.close();
            rs.close();
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int countProductKey(String rawTxtSearch) {
        int count = 0;
        String txtSearch = "%" + rawTxtSearch + "%";
        try {
            String sql = "SELECT [product_id]\n"
                    + "  FROM   [Product] \n"
                    + "  WHERE [name] LIKE ?\n"
                    + "   OR [os] LIKE ?\n"
                    + "   OR [color] LIKE ?\n"
                    + "   OR [ram] LIKE ?\n"
                    + "   OR [memory] LIKE ?\n"
                    + "   OR [cpu] LIKE ?\n"
                    + "   OR [graphics_card] LIKE ? AND [status] = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, txtSearch);
            stm.setString(2, txtSearch);
            stm.setString(3, txtSearch);
            stm.setString(4, txtSearch);
            stm.setString(5, txtSearch);
            stm.setString(6, txtSearch);
            stm.setString(7, txtSearch);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count++;
            }
            stm.close();
            rs.close();
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
//for search screen(lấy sản phẩm theo một từ khóa)

    public ArrayList<Product> listProduct(String rawTxtSearch, String sort, int numOfPage) {
        ArrayList<Product> products = new ArrayList<>();
        int skip = (numOfPage - 1) * 12;
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
            sql = sql + " OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, txtSearch);
            stm.setString(2, txtSearch);
            stm.setString(3, txtSearch);
            stm.setString(4, txtSearch);
            stm.setString(5, txtSearch);
            stm.setString(6, txtSearch);
            stm.setString(7, txtSearch);
            stm.setInt(8, skip);
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
                VoteDBContext vdb = new VoteDBContext();
                product.setVotes(vdb.listByID(product.getId()));
                product.setBrands(brdb.listByID(product.getId()));
                product.setRequirement(reqdb.listByID(product.getId()));
                product.setImage(imgdb.listByID(product.getId()));
                products.add(product);
            }
            stm.close();
            rs.close();
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
//for type screen(lấy sản phẩm theo bộ lọc cho trước)

    public ArrayList<Product> filterProduct(int type, String sort, double from, double to, String[] needs, String[] brands, String[] sizes, int numOfPage) {
        int skip = (numOfPage - 1) * 9;
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

            if (sizes != null) {
                if (sizes[0].compareTo("all") != 0) {
                    int i = 0;
                    sql = sql + " AND pr.product_id in (SELECT pr.[product_id] FROM [Product] pr where";
                    for (String size : sizes) {
                        if (i != 0) {
                            sql += " OR ";
                        }
                        if (size.compareTo("size1") == 0) {
                            sql = sql + " pr.[size] < 13";
                        }
                        if (size.compareTo("size2") == 0) {
                            sql = sql + " pr.[size] >=13 AND pr.[size]<15";
                        }
                        if (size.compareTo("size3") == 0) {
                            sql = sql + " pr.[size] >=15 AND pr.[size]<17";
                        }
                        if (size.compareTo("size4") == 0) {
                            sql = sql + " pr.[size] >= 17";
                        }
                        i++;
                    }
                    sql = sql + ")";
                }
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
            sql = sql + " OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDouble(1, from);
            stm.setDouble(2, to);
            stm.setInt(3, type);
            stm.setInt(4, skip);
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
                VoteDBContext vdb = new VoteDBContext();
                product.setVotes(vdb.listByID(product.getId()));
                product.setBrands(brdb.listByID(product.getId()));
                product.setRequirement(reqdb.listByID(product.getId()));
                product.setImage(imgdb.listByID(product.getId()));
                products.add(product);
            }
            stm.close();
            rs.close();
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //for product detail(lấy các sản phẩm cùng loại khác màu)
    public ArrayList<Product> listColor(String name, int ram, int memory, String cpu, String graphic_card) {
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
                    + "  FROM [Product] pr\n"
                    + "  where  pr.[status] = 1  and pr.[name] LIKE ?\n"
                    + "and pr.[ram] like ? and pr.[memory] like ? and pr.[cpu] like ? and pr.[graphics_card] like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setInt(2, ram);
            stm.setInt(3, memory);
            stm.setString(4, cpu);
            stm.setString(5, graphic_card);
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
                VoteDBContext vdb = new VoteDBContext();
                product.setVotes(vdb.listByID(product.getId()));
                product.setBrands(brdb.listByID(product.getId()));
                product.setRequirement(reqdb.listByID(product.getId()));
                product.setImage(imgdb.listByID(product.getId()));
                products.add(product);
            }
            stm.close();
            rs.close();
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // sản phẩm tương tự
    public ArrayList<Product> listSameProduct(int num, int ram, int memory, String cpu, String graphic_card) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT TOP (?) pr.[product_id]\n"
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
                    + "  FROM [Product] pr\n"
                    + "  where  pr.[status] = 1\n"
                    + "and pr.[ram] like ? and pr.[memory] like ? and pr.[cpu] like ? and pr.[graphics_card] like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, num);
            stm.setInt(2, ram);
            stm.setInt(3, memory);
            stm.setString(4, cpu);
            stm.setString(5, graphic_card);
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
                VoteDBContext vdb = new VoteDBContext();
                product.setVotes(vdb.listByID(product.getId()));
                product.setBrands(brdb.listByID(product.getId()));
                product.setRequirement(reqdb.listByID(product.getId()));
                product.setImage(imgdb.listByID(product.getId()));
                products.add(product);
            }
            stm.close();
            rs.close();
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //buffer object(tạo các đối tượng giả để lấy các thuộc tính cần thiết)
    public ArrayList<Product> bufferObject(String name) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT \n"
                    + "      pr.[name]\n"
                    + "      ,pr.[ram]\n"
                    + "      ,pr.[memory]\n"
                    + "      ,pr.[cpu]\n"
                    + "      ,pr.[graphics_card]\n"
                    + "  FROM [Product] pr\n"
                    + "  where  pr.[status] = 1 and pr.[name] LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setName(rs.getString("name"));
                product.setRam(rs.getInt("ram"));
                product.setMemory(rs.getInt("memory"));
                product.setCpu(rs.getString("cpu"));
                product.setGraphic_card(rs.getString("graphics_card"));
                products.add(product);
            }
            stm.close();
            rs.close();
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(VoteDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> listProduct = new ArrayList<>();
        try {
            String sql = "SELECT [product_id]\n"
                    + "      ,[name]\n"
                    + "      ,[type]\n"
                    + "      ,[color]\n"
                    + "      ,[current_price]\n"
                    + "      ,[original_price]\n"
                    + "      ,[ram]\n"
                    + "      ,[memory]\n"
                    + "  FROM [dbo].[Product] Where [status] = 'true'";

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setType(rs.getInt("type"));
                p.setColor(rs.getString("color"));
                p.setRam(rs.getInt("ram"));
                p.setMemory(rs.getInt("memory"));
                p.setOriginal_price(rs.getDouble("original_price"));
                p.setCurrent_price(rs.getDouble("current_price"));
                listProduct.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProduct;
    }

    public int totalProduct() {
        int total = -1;
        try {
            String sql = "SELECT COUNT(product_id)[total] FROM Product Where [status] = 'true'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public int totalProduct(int type, int status) {
        int total = -1;
        try {
            String sql = "SELECT COUNT(product_id)[total] FROM Product WHERE [type] = ? AND [status] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, type);
            ps.setInt(2, status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public void changeProductStatus(int id, boolean status) {
        try {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "   SET [status] = ?\n"
                    + " WHERE product_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBoolean(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        ProductDBContext p = new ProductDBContext();
        p.changeProductStatus(1, true);
        p.changeProductStatus(2, true);
    }

//test query cái này bỏ qua
//    public String testString(int type, String sort, double from, double to, String[] needs, String[] brands, String[] sizes) {
//        String sql = "SELECT DISTINCT pr.[product_id]\n"
//                + "      ,pr.[name]\n"
//                + "      ,pr.[type]\n"
//                + "      ,pr.[os]\n"
//                + "      ,pr.[feature_product]\n"
//                + "      ,pr.[color]\n"
//                + "      ,pr.[current_price]\n"
//                + "      ,pr.[original_price]\n"
//                + "      ,pr.[ram]\n"
//                + "      ,pr.[memory]\n"
//                + "      ,pr.[cpu]\n"
//                + "      ,pr.[graphics_card]\n"
//                + "      ,pr.[size]\n"
//                + "      ,pr.[description]\n"
//                + "      ,pr.[discount]\n"
//                + "      ,pr.[qty]\n"
//                + "      ,pr.[sold]\n"
//                + "      ,pr.[status]\n"
//                + "  FROM  [Product] pr "
//                + "  Inner Join [Product_Brand] prbr On pr.product_id = prbr.product_id\n"
//                + "  Inner Join [Brand] br on prbr.brand_id = br.brand_id\n"
//                + "  Inner Join [Product_Requirement] prre On pr.product_id = prre.product_id\n"
//                + "  Inner Join [Requirement] re on prre.requirement_id =re.requirement_id\n"
//                + "  where  pr.[status] = 1 AND pr.[current_price] >= ? AND pr.[current_price] <= ? AND pr.[type] = ?\n";
//        if (needs != null) {
//            if (needs[0].compareTo("all") != 0) {
//                sql = sql + " AND re.[requirement_name] in (";
//                for (String need : needs) {
//                    sql = sql + "'" + need + "',";
//                }
//                sql = sql.substring(0, sql.length() - 1);
//                sql = sql + ")";
//            }
//
//        }
//
//        if (brands != null) {
//            if (brands[0].compareTo("all") != 0) {
//                sql = sql + " AND br.[brand_name] in (";
//                for (String brand : brands) {
//                    sql = sql + "'" + brand + "',";
//                }
//                sql = sql.substring(0, sql.length() - 1);
//                sql = sql + ")";
//            }
//
//        }
//
//        if (sizes != null) {
//            if (sizes[0].compareTo("all") != 0) {
//                int i = 0;
//                sql = sql + " AND pr.product_id in (SELECT pr.[product_id] FROM [Product] pr where";
//                for (String size : sizes) {
//                    if (i != 0) {
//                        sql += " OR ";
//                    }
//                    if (size.compareTo("size1") == 0) {
//                        sql = sql + " pr.[size] < 13";
//                    }
//                    if (size.compareTo("size2") == 0) {
//                        sql = sql + " pr.[size] >=14 AND pr.[size]<15";
//                    }
//                    if (size.compareTo("size3") == 0) {
//                        sql = sql + " pr.[size] >=15 AND pr.[size]<17";
//                    }
//                    if (size.compareTo("size4") == 0) {
//                        sql = sql + " pr.[size] >= 17";
//                    }
//                    i++;
//                }
//                sql = sql + ")";
//            }
//        }
//        if (sort.compareTo("none") == 0) {
//            sql = sql + "\n ORDER BY pr.[discount] DESC";
//        }
//        if (sort.compareTo("ASC") == 0) {
//            sql = sql + "\n ORDER BY pr.[current_price] ASC";
//        }
//        if (sort.compareTo("DESC") == 0) {
//            sql = sql + "\n ORDER BY pr.[current_price] DESC";
//        }
//        return sql;
//    }
        public boolean deleteNumberProduct(int product_id,int num) {
        boolean check = false;
        try {
            String sql = "Update Product set qty = ? where product_id= ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, product_id);
            ps.setInt(2, num);

            int rowsAffected = ps.executeUpdate();
            if(rowsAffected > 0) check = true;

        } catch (SQLException e) {
        }
        return check;

    } 
}
