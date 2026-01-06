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
import model.Brand;
import model.Product;

/**
 *
 * @author admin
 */
public class ProductDBContext extends DBContext {

    //for product detail(lấy sản phẩm theo id)
    public Product getProductByID(int id) {
        // Khởi tạo null. Nếu tìm thấy thì mới new Product(). 
        // Để tránh trường hợp không tìm thấy ID mà vẫn trả về object rỗng.
        Product product = null; 
        try {
            String sql = "SELECT product_id, name, type, os, color, current_price, original_price, "
                       + "ram, memory, cpu, graphics_card, size, description, discount, qty, status "
                       + "FROM \"Product\" WHERE status = true AND product_id = ?";
                       
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);

            ResultSet rs = stm.executeQuery();
            // Dùng if thay vì while vì ID là duy nhất
            if (rs.next()) {
                product = new Product();
                
                // --- 1. Lấy thông tin cơ bản ---
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
                product.setStatus(rs.getBoolean("status"));

                // --- 2. CÁCH LY LỖI (SAFE MODE) ---
                // Mỗi thằng con nằm trong 1 try-catch riêng biệt.
                // Thằng nào lỗi thì set mảng rỗng để JSP không bị NullPointerException khi duyệt mảng.

                // Lấy Vote
                try {
                    VoteDBContext vdb = new VoteDBContext();
                    product.setVotes(vdb.listByID(product.getId()));
                } catch (Exception e) {
                    product.setVotes(new ArrayList<>()); 
                }

                // Lấy Brand
                try {
                    BrandDBContext brdb = new BrandDBContext();
                    product.setBrands(brdb.listByID(product.getId()));
                } catch (Exception e) {
                    product.setBrands(new ArrayList<>());
                }

                // Lấy Requirement
                try {
                    RequirementDBContext reqdb = new RequirementDBContext();
                    product.setRequirement(reqdb.listByID(product.getId()));
                } catch (Exception e) {
                    product.setRequirement(new ArrayList<>());
                }

                // Lấy Image
                try {
                    ImageDBContext imgdb = new ImageDBContext();
                    product.setImage(imgdb.listByID(product.getId()));
                } catch (Exception e) {
                    product.setImage(new ArrayList<>());
                }
            }
            stm.close();
            rs.close();
            return product;
        } catch (SQLException ex) {
            ex.printStackTrace(); // Lỗi SQL bảng Product chính
        }
        return null;
    }

    public Product getProductByIDWithOutStatus(int id) {
        Product product = new Product();
        try {
            String sql = "SELECT   product_id\n"
                    + "		  ,name\n"
                    + "		  ,type\n"
                    + "		  ,os\n"
                    + "		  ,color\n"
                    + "		  ,current_price\n"
                    + "           ,original_price\n"
                    + "		  ,ram\n"
                    + "		  ,memory\n"
                    + "		  ,cpu\n"
                    + "		  ,graphics_card\n"
                    + "		  ,size\n"
                    + "		  ,description\n"
                    + "		  ,discount\n"
                    + "		  ,qty\n"
                    + "		  ,status\n"
                    + "	  FROM \"Product\" where product_id = ?";
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
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //lấy ra các sản phẩm có thuộc tính cụ thể
    public Product getProduct(String name, int ram, int memory, String cpu, String graphic_card) {
        Product product = new Product();
        try {
            // Thay TOP 1 bằng LIMIT 1 ở cuối
            String sql = "SELECT  product_id\n"
                    + "		  ,name\n"
                    + "		  ,type\n"
                    + "		  ,os\n"
                    + "		  ,color\n"
                    + "		  ,current_price\n"
                    + "           ,original_price\n"
                    + "		  ,ram\n"
                    + "		  ,memory\n"
                    + "		  ,cpu\n"
                    + "		  ,graphics_card\n"
                    + "		  ,size\n"
                    + "		  ,description\n"
                    + "		  ,discount\n"
                    + "		  ,qty\n"
                    + "		  ,status\n"
                    + "  FROM \"Product\"\n"
                    + "  where  status = true and name like ? \n"
                    + "and ram like ? and memory like ? and cpu like ? and graphics_card like ? LIMIT 1";
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
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //for home screen(lấy ra các sản phẩm theo phân loại, top sale, top sold)
    public ArrayList<Product> listProduct(int type, int num, boolean topSale) {
        ArrayList<Product> products = new ArrayList<>();
        
        // --- TỐI ƯU 1: KHỞI TẠO DAO RA NGOÀI VÒNG LẶP (QUAN TRỌNG NHẤT) ---
        // Việc này giúp bạn chỉ tốn 4 kết nối cho dù có load 1000 sản phẩm.
        // Code cũ: 1 sản phẩm tốn 4 kết nối -> 20 sản phẩm tốn 80 kết nối -> SẬP.
        VoteDBContext vdb = new VoteDBContext();
        BrandDBContext brdb = new BrandDBContext();
        RequirementDBContext reqdb = new RequirementDBContext();
        ImageDBContext imgdb = new ImageDBContext();

        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT product_id, name, type, os, color, current_price, original_price, "
                       + "ram, memory, cpu, graphics_card, size, description, discount, qty, status, feature_product "
                       + "FROM \"Product\" WHERE status = true AND qty > 0";
            
            if (type != -1) sql += " AND type = ?";
            
            // Logic sort
            if (topSale) {
                sql += " ORDER BY discount DESC, ";
            } else {
                sql += " ORDER BY ";
            }
            sql += "feature_product DESC LIMIT ?";

            stm = connection.prepareStatement(sql);
            int paramIndex = 1;
            if (type != -1) stm.setInt(paramIndex++, type);
            stm.setInt(paramIndex, num);

            rs = stm.executeQuery();
            
            while (rs.next()) {
                Product product = new Product();
                
                // --- 1. Map dữ liệu cơ bản ---
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
                product.setStatus(rs.getBoolean("status"));

                // --- 2. Lấy dữ liệu phụ (SỬ DỤNG DAO ĐÃ KHỞI TẠO BÊN TRÊN) ---
                
                // Lấy Vote
                try {
                    product.setVotes(vdb.listByID(product.getId()));
                } catch (Exception e) {
                    product.setVotes(new ArrayList<>());
                }

                // Lấy Brand
                try {
                    product.setBrands(brdb.listByID(product.getId()));
                } catch (Exception e) {
                    product.setBrands(new ArrayList<>());
                }

                // Lấy Requirement
                try {
                    product.setRequirement(reqdb.listByID(product.getId()));
                } catch (Exception e) {
                    product.setRequirement(new ArrayList<>());
                }

                // Lấy Image
                try {
                    product.setImage(imgdb.listByID(product.getId()));
                } catch (Exception e) {
                    product.setImage(new ArrayList<>());
                }

                products.add(product);
            }
            
            return products;

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            // --- TỐI ƯU 2: ĐÓNG KẾT NỐI (BẮT BUỘC) ---
            // Phải đóng kết nối của các DAO con thủ công để trả lại slot cho DB
            try {
                if (rs != null) rs.close();
                if (stm != null) stm.close();
                // Giả sử các class DBContext của bạn có biến 'connection' protected hoặc public
                if (vdb.connection != null) vdb.connection.close();
                if (brdb.connection != null) brdb.connection.close();
                if (reqdb.connection != null) reqdb.connection.close();
                if (imgdb.connection != null) imgdb.connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return new ArrayList<>(); // Trả về list rỗng thay vì null để tránh NullPointerException ở View
    }

    //count num of product
    public int countProductByType(int type, double from, double to, String[] needs, String[] brands, String[] sizes) {
        int count = 0;
        try {
            String sql = "SELECT pr.product_id\n"
                    + "  FROM  \"Product\" pr "
                    + "  Inner Join \"Product_Brand\" prbr On pr.product_id = prbr.product_id\n"
                    + "  Inner Join \"Brand\" br on prbr.brand_id = br.brand_id\n"
                    + "  Inner Join \"Product_Requirement\" prre On pr.product_id = prre.product_id\n"
                    + "  Inner Join \"Requirement\" re on prre.requirement_id =re.requirement_id\n"
                    + "  where  pr.status = true AND pr.current_price >= ? AND pr.current_price <= ? AND pr.type = ?\n";
            if (needs != null) {
                if (needs[0].compareTo("all") != 0) {
                    sql = sql + " AND re.requirement_name in (";
                    for (String need : needs) {
                        sql = sql + "'" + need + "',";
                    }
                    sql = sql.substring(0, sql.length() - 1);
                    sql = sql + ")";
                }

            }

            if (brands != null) {
                if (brands[0].compareTo("all") != 0) {
                    sql = sql + " AND br.brand_name in (";
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
                    sql = sql + " AND pr.product_id in (SELECT pr.product_id FROM Product pr where";
                    for (String size : sizes) {
                        if (i != 0) {
                            sql += " OR ";
                        }
                        if (size.compareTo("size1") == 0) {
                            sql = sql + " pr.size < 13";
                        }
                        if (size.compareTo("size2") == 0) {
                            sql = sql + " pr.size >=13 AND pr.size<15";
                        }
                        if (size.compareTo("size3") == 0) {
                            sql = sql + " pr.size >=15 AND pr.size<17";
                        }
                        if (size.compareTo("size4") == 0) {
                            sql = sql + " pr.size >= 17";
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
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int countProductKey(String rawTxtSearch) {
        int count = 0;
        String txtSearch = "%" + rawTxtSearch + "%";
        try {
            // Dùng ILIKE để tìm kiếm không phân biệt hoa thường trong Postgres
            String sql = "SELECT product_id\n"
                    + "  FROM   \"Product\" \n"
                    + "  WHERE name ILIKE ?\n"
                    + "   OR os ILIKE ?\n"
                    + "   OR color ILIKE ?\n"
                    + "   OR ram ILIKE ?\n"
                    + "   OR memory ILIKE ?\n"
                    + "   OR cpu ILIKE ?\n"
                    + "   OR graphics_card ILIKE ? AND status = true";
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
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int numOfItem() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) AS x FROM \"Product\"";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt("x");
            }
            stm.close();
            rs.close();
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int numOfProduct() {
        int count = 0;
        try {
            String sql = "SELECT SUM(qty) AS total FROM \"Product\"";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt("total");
            }
            stm.close();
            rs.close();
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    //for search screen(lấy sản phẩm theo một từ khóa)
    public ArrayList<Product> listProduct(String rawTxtSearch, String sort, int numOfPage) {
    ArrayList<Product> products = new ArrayList<>();
    int skip = (numOfPage - 1) * 12;
    String txtSearch = "%" + rawTxtSearch + "%";

    // --- 1. TỐI ƯU QUAN TRỌNG NHẤT: Khởi tạo DAO ra ngoài vòng lặp ---
    // Mở kết nối 1 lần, dùng chung cho cả 12 sản phẩm
    VoteDBContext vdb = new VoteDBContext();
    BrandDBContext brdb = new BrandDBContext();
    RequirementDBContext reqdb = new RequirementDBContext();
    ImageDBContext imgdb = new ImageDBContext();

    PreparedStatement stm = null;
    ResultSet rs = null;

    try {
        String sql = "SELECT pr.product_id, pr.name, pr.type, pr.os, pr.color, "
                   + "pr.current_price, pr.original_price, pr.ram, pr.memory, "
                   + "pr.cpu, pr.graphics_card, pr.size, pr.description, "
                   + "pr.discount, pr.qty, pr.status "
                   + "FROM \"Product\" pr "
                   // Lưu ý: INNER JOIN sẽ làm ẩn sản phẩm nếu thiếu Brand/Req. 
                   // Nếu muốn hiện cả sp thiếu thông tin thì nên đổi thành LEFT JOIN
                   + "INNER JOIN \"Product_Brand\" prbr ON pr.product_id = prbr.product_id "
                   + "INNER JOIN \"Brand\" br ON br.brand_id = prbr.brand_id "
                   + "INNER JOIN \"Product_Requirement\" prre ON pr.product_id = prre.product_id "
                   + "INNER JOIN \"Requirement\" re ON re.requirement_id = prre.requirement_id "
                   + "WHERE pr.status = true AND (pr.name ILIKE ? "
                   + "OR pr.os ILIKE ? "
                   + "OR pr.color ILIKE ? "
                   + "OR CAST(pr.ram AS TEXT) ILIKE ? "
                   + "OR CAST(pr.memory AS TEXT) ILIKE ? "
                   + "OR pr.cpu ILIKE ? "
                   + "OR pr.graphics_card ILIKE ? "
                   + "OR re.requirement_name ILIKE ? "
                   + "OR br.brand_name ILIKE ?) ";

        if ("none".equals(sort)) {
            sql += " ORDER BY discount DESC";
        } else if ("ASC".equals(sort)) {
            sql += " ORDER BY current_price ASC";
        } else if ("DESC".equals(sort)) {
            sql += " ORDER BY current_price DESC";
        }

        sql += " OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";

        stm = connection.prepareStatement(sql);
        
        // Set params
        for (int i = 1; i <= 9; i++) {
            stm.setString(i, txtSearch);
        }
        stm.setInt(10, skip);

        rs = stm.executeQuery();
        
        while (rs.next()) {
            Product product = new Product();
            // --- 2. Lấy thông tin cơ bản ---
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
            product.setStatus(rs.getBoolean("status"));

            // --- 3. SỬ DỤNG DAO ĐÃ KHỞI TẠO (Không new lại) ---
            
            // Lấy Vote
            try {
                product.setVotes(vdb.listByID(product.getId()));
            } catch (Exception e) {
                product.setVotes(new ArrayList<>());
            }

            // Lấy Brand
            try {
                product.setBrands(brdb.listByID(product.getId()));
            } catch (Exception e) {
                product.setBrands(new ArrayList<>());
            }

            // Lấy Requirement
            try {
                product.setRequirement(reqdb.listByID(product.getId()));
            } catch (Exception e) {
                product.setRequirement(new ArrayList<>());
            }

            // Lấy Image
            try {
                product.setImage(imgdb.listByID(product.getId()));
            } catch (Exception e) {
                product.setImage(new ArrayList<>());
            }

            products.add(product);
        }
        
        return products;

    } catch (SQLException ex) {
        ex.printStackTrace();
        Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        // --- 4. BẮT BUỘC: ĐÓNG KẾT NỐI ---
        try {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            // Đóng các kết nối phụ
            if (vdb.connection != null) vdb.connection.close();
            if (brdb.connection != null) brdb.connection.close();
            if (reqdb.connection != null) reqdb.connection.close();
            if (imgdb.connection != null) imgdb.connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return new ArrayList<>(); // Trả về list rỗng thay vì null để an toàn
}
    
    public ArrayList<Product> filterProduct(int type, String sort, double from, double to, String[] needs, String[] brands, String[] sizes, int numOfPage) {
    ArrayList<Product> products = new ArrayList<>();
    int skip = (numOfPage - 1) * 9;

    // --- 1. KHỞI TẠO DAO RA NGOÀI (Chống sập DB) ---
    BrandDBContext brdb = new BrandDBContext();
    RequirementDBContext reqdb = new RequirementDBContext();
    ImageDBContext imgdb = new ImageDBContext();
    VoteDBContext vdb = new VoteDBContext();

    PreparedStatement stm = null;
    ResultSet rs = null;

    try {
        // Sử dụng StringBuilder để nối chuỗi nhanh hơn và dễ đọc hơn
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT DISTINCT pr.product_id, pr.name, pr.type, pr.os, pr.feature_product, ");
        sql.append("pr.color, pr.current_price, pr.original_price, pr.ram, pr.memory, ");
        sql.append("pr.cpu, pr.graphics_card, pr.size, pr.description, pr.discount, pr.qty, pr.status ");
        sql.append("FROM \"Product\" pr ");
        sql.append("INNER JOIN \"Product_Brand\" prbr ON pr.product_id = prbr.product_id ");
        sql.append("INNER JOIN \"Brand\" br ON prbr.brand_id = br.brand_id ");
        sql.append("INNER JOIN \"Product_Requirement\" prre ON pr.product_id = prre.product_id ");
        sql.append("INNER JOIN \"Requirement\" re ON prre.requirement_id = re.requirement_id ");
        sql.append("WHERE pr.status = true AND pr.current_price >= ? AND pr.current_price <= ? AND pr.type = ? ");

        // --- Xử lý Needs (Nhu cầu) ---
        if (needs != null && needs.length > 0 && !"all".equals(needs[0])) {
            sql.append("AND re.requirement_name IN (");
            for (int i = 0; i < needs.length; i++) {
                sql.append("'").append(needs[i]).append("'"); // Lưu ý: Nên validate input để tránh SQL Injection
                if (i < needs.length - 1) sql.append(",");
            }
            sql.append(") ");
        }

        // --- Xử lý Brands (Thương hiệu) ---
        if (brands != null && brands.length > 0 && !"all".equals(brands[0])) {
            sql.append("AND br.brand_name IN (");
            for (int i = 0; i < brands.length; i++) {
                sql.append("'").append(brands[i]).append("'");
                if (i < brands.length - 1) sql.append(",");
            }
            sql.append(") ");
        }

        // --- Xử lý Sizes (Tối ưu logic bỏ sub-query) ---
        if (sizes != null && sizes.length > 0 && !"all".equals(sizes[0])) {
            sql.append("AND ("); // Mở ngoặc cho cụm điều kiện OR
            boolean first = true;
            for (String size : sizes) {
                if (!first) sql.append(" OR ");
                
                if ("size1".equals(size)) sql.append("pr.size < 13");
                else if ("size2".equals(size)) sql.append("(pr.size >= 13 AND pr.size < 15)");
                else if ("size3".equals(size)) sql.append("(pr.size >= 15 AND pr.size < 17)");
                else if ("size4".equals(size)) sql.append("pr.size >= 17");
                
                first = false;
            }
            sql.append(") "); // Đóng ngoặc
        }

        // --- Xử lý Sort ---
        if ("none".equals(sort)) {
            sql.append("ORDER BY pr.discount DESC ");
        } else if ("ASC".equals(sort)) {
            sql.append("ORDER BY pr.current_price ASC ");
        } else if ("DESC".equals(sort)) {
            sql.append("ORDER BY pr.current_price DESC ");
        }

        // --- Phân trang ---
        sql.append("OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY");

        stm = connection.prepareStatement(sql.toString());
        
        // Set params cố định
        stm.setDouble(1, from);
        stm.setDouble(2, to);
        stm.setInt(3, type);
        // Param cuối cùng là skip (OFFSET)
        stm.setInt(4, skip);

        rs = stm.executeQuery();
        
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
            product.setStatus(rs.getBoolean("status"));

            // --- TÁI SỬ DỤNG DAO (FIX LỖI CRASH) ---
            try { product.setVotes(vdb.listByID(product.getId())); } catch (Exception e) {}
            try { product.setBrands(brdb.listByID(product.getId())); } catch (Exception e) {}
            try { product.setRequirement(reqdb.listByID(product.getId())); } catch (Exception e) {}
            try { product.setImage(imgdb.listByID(product.getId())); } catch (Exception e) {}

            products.add(product);
        }
        return products;

    } catch (SQLException ex) {
        Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        // --- CLEAN UP TÀI NGUYÊN ---
        try {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (brdb.connection != null) brdb.connection.close();
            if (reqdb.connection != null) reqdb.connection.close();
            if (imgdb.connection != null) imgdb.connection.close();
            if (vdb.connection != null) vdb.connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return new ArrayList<>();
}

    public ArrayList<Product> listColor(String name, int ram, int memory, String cpu, String graphic_card) {
    ArrayList<Product> products = new ArrayList<>();
    
    // --- 1. TỐI ƯU KẾT NỐI: Đưa DAO ra ngoài vòng lặp ---
    BrandDBContext brdb = new BrandDBContext();
    RequirementDBContext reqdb = new RequirementDBContext();
    ImageDBContext imgdb = new ImageDBContext();
    VoteDBContext vdb = new VoteDBContext();

    PreparedStatement stm = null;
    ResultSet rs = null;

    try {
        // --- 2. TỐI ƯU SQL: Dùng '=' thay cho 'LIKE' với các chỉ số kỹ thuật ---
        // 'LIKE' không dùng cho số (RAM, Memory). 
        // Với CPU và Card, nếu muốn tìm chính xác cùng cấu hình thì dùng '=' sẽ nhanh hơn 'LIKE'.
        String sql = "SELECT pr.product_id, pr.name, pr.type, pr.os, pr.feature_product, "
                   + "pr.color, pr.current_price, pr.original_price, pr.ram, pr.memory, "
                   + "pr.cpu, pr.graphics_card, pr.size, pr.description, pr.discount, pr.qty, pr.status "
                   + "FROM \"Product\" pr "
                   + "WHERE pr.status = true "
                   + "AND pr.name = ? "             // Dùng = để chính xác tên dòng máy
                   + "AND pr.ram = ? "              // Dùng = cho số (QUAN TRỌNG)
                   + "AND pr.memory = ? "           // Dùng = cho số (QUAN TRỌNG)
                   + "AND pr.cpu = ? "              // Dùng = cho cấu hình
                   + "AND pr.graphics_card = ?";    // Dùng = cho cấu hình

        stm = connection.prepareStatement(sql);
        
        // Set params
        stm.setString(1, name);
        stm.setInt(2, ram);
        stm.setInt(3, memory);
        stm.setString(4, cpu);
        stm.setString(5, graphic_card);

        rs = stm.executeQuery();
        
        while (rs.next()) {
            Product product = new Product();
            // Map dữ liệu cơ bản
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
            product.setStatus(rs.getBoolean("status"));

            // --- 3. SỬ DỤNG DAO (SAFE MODE) ---
            try { product.setVotes(vdb.listByID(product.getId())); } catch (Exception e) {}
            try { product.setBrands(brdb.listByID(product.getId())); } catch (Exception e) {}
            try { product.setRequirement(reqdb.listByID(product.getId())); } catch (Exception e) {}
            try { product.setImage(imgdb.listByID(product.getId())); } catch (Exception e) {}

            products.add(product);
        }
        return products;

    } catch (SQLException ex) {
        Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        // --- 4. CLEAN UP RESOURCES ---
        try {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (brdb.connection != null) brdb.connection.close();
            if (reqdb.connection != null) reqdb.connection.close();
            if (imgdb.connection != null) imgdb.connection.close();
            if (vdb.connection != null) vdb.connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return new ArrayList<>(); // Trả về list rỗng để tránh lỗi NullPointer ở View
}

    // sản phẩm tương tự
    public ArrayList<Product> listSameProduct(int num, int ram, int memory, String cpu, String graphic_card, int productId) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            // Thay TOP (?) bằng LIMIT ? ở cuối
            String sql = "SELECT DISTINCT pr.product_id\n"
                    + "      ,pr.name\n"
                    + "      ,pr.type\n"
                    + "      ,pr.os\n"
                    + "      ,pr.feature_product\n"
                    + "      ,pr.color\n"
                    + "      ,pr.current_price\n"
                    + "      ,pr.original_price\n"
                    + "      ,pr.ram\n"
                    + "      ,pr.memory\n"
                    + "      ,pr.cpu\n"
                    + "      ,pr.graphics_card\n"
                    + "      ,pr.size\n"
                    + "      ,pr.description\n"
                    + "      ,pr.discount\n"
                    + "      ,pr.qty\n"
                    + "      ,pr.status\n"
                    + "  FROM \"Product\" pr \n"
                    + "  where  pr.status = true and product_id != ?\n"
                    + "and pr.ram like ? and pr.memory like ? and pr.cpu like ? and pr.graphics_card like ? ORDER BY feature_product DESC LIMIT ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            
            // Đảo thứ tự tham số để LIMIT ở cuối cùng
            stm.setInt(1, productId);
            stm.setInt(2, ram);
            stm.setInt(3, memory);
            stm.setString(4, cpu);
            stm.setString(5, graphic_card);
            stm.setInt(6, num);
            
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
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //buffer object(tạo các đối tượng giả để lấy các thuộc tính cần thiết)
    public ArrayList<Product> bufferObject(String name) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT \n"
                    + "      pr.name\n"
                    + "      ,pr.ram\n"
                    + "      ,pr.memory\n"
                    + "      ,pr.cpu\n"
                    + "      ,pr.graphics_card\n"
                    + "  FROM \"Product\" pr\n"
                    + "  where  pr.status = true and pr.name LIKE ?";
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
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> getAllProduct(int status) {
        ArrayList<Product> listProduct = new ArrayList<>();
        try {
            String sql = "SELECT product_id\n"
                    + "      ,name\n"
                    + "      ,type\n"
                    + "      ,os\n"
                    + "      ,feature_product\n"
                    + "      ,color\n"
                    + "      ,current_price\n"
                    + "      ,original_price\n"
                    + "      ,ram\n"
                    + "      ,memory\n"
                    + "      ,cpu\n"
                    + "      ,graphics_card\n"
                    + "      ,size\n"
                    + "      ,description\n"
                    + "      ,discount\n"
                    + "      ,qty\n"
                    + "      ,status\n"
                    + "  FROM \"Product\"\n"
                    + "  WHERE status = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
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

    public int totalProduct(int status) {
        int total = -1;
        try {
            String sql = "";
            if (status == 1 || status == 0) {
                // Sửa cú pháp alias [total] -> AS total
                sql = "SELECT COUNT(product_id) AS total FROM \"Product\" Where status = ?";
            } else {
                sql = "SELECT COUNT(product_id) AS total FROM \"Product\"";
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            if (status == 1 || status == 0) {
                ps.setInt(1, status);
            }
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
            String sql = "";
            if (status == 1 || status == 0) {
                // Sửa cú pháp alias
                sql = "SELECT COUNT(product_id) AS total FROM \"Product\" WHERE type = ? AND status = ?";
            } else {
                sql = "SELECT COUNT(product_id) AS total FROM \"Product\" WHERE type = ?";
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, type);
            if (status == 1 || status == 0) {
                ps.setInt(2, status);
            }
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
            String sql = "UPDATE \"Product\"\n"
                    + "   SET status = ?\n"
                    + " WHERE product_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBoolean(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean deleteNumberProduct(int product_id, int num) {
        boolean check = false;
        try {
            String sql = "Update \"Product\" set qty = ? where product_id= ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(2, product_id);
            ps.setInt(1, num);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                check = true;
            }

        } catch (SQLException e) {
        }
        return check;

    }

    public boolean updateSold(int product_id, int num) {
        boolean check = false;
        try {
            String sql = "Update \"Product\" set sold = ? where product_id= ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(2, product_id);
            ps.setInt(1, num);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                check = true;
            }

        } catch (SQLException e) {
        }
        return check;

    }

    public int insertAndReturnId(Product product) {
        try {
            String sql = "INSERT INTO \"Product\"\n"
                    + "           (name\n" //1
                    + "           ,type\n" //2
                    + "           ,os\n" //3
                    + "           ,feature_product\n" //4
                    + "           ,color\n" //5
                    + "           ,current_price\n" //6
                    + "           ,original_price\n" //7
                    + "           ,ram\n" //8
                    + "           ,memory\n" //9
                    + "           ,cpu\n" //10
                    + "           ,graphics_card\n" //11
                    + "           ,size\n" //12
                    + "           ,description\n" //13
                    + "           ,discount\n" //14
                    + "           ,qty\n" //15
                    + "           ,status)\n" //16
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, product.getName());
            ps.setInt(2, product.getType());
            ps.setString(3, product.getOs());
            ps.setBoolean(4, false);
            ps.setString(5, product.getColor());
            ps.setDouble(6, product.getCurrent_price());
            ps.setDouble(7, product.getOriginal_price());
            ps.setString(8, String.valueOf(product.getRam()));
            ps.setString(9, String.valueOf(product.getMemory()));
            ps.setString(10, product.getCpu());
            ps.setString(11, product.getGraphic_card());
            ps.setDouble(12, product.getSize());
            ps.setString(13, product.getDescription());
            ps.setDouble(14, product.getDiscount());
            ps.setInt(15, 0);
            ps.setBoolean(16, product.isStatus());
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

    public List<String> getAllOs() {
        List<String> list = new ArrayList<>();
        try {
            String sql = "SELECT distinct os FROM Product";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("os"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void setProductBrand(int productId, int brandId) {
        try {
            String sql = "INSERT INTO \"Product_Brand\" (brand_id, product_id) VALUES (?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, brandId);
            ps.setInt(2, productId);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void setProductRequirment(int productId, int reqId) {
        try {
            String sql = "INSERT INTO \"Product_Requirement\" (requirement_id, product_id) VALUES (?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, reqId);
            ps.setInt(2, productId);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Product> getAllProductAndBrand() {
        ArrayList<Product> listProduct = new ArrayList<>();
        try {
            String sql = "SELECT p.product_id\n"
                    + "      ,p.name\n"
                    + "      ,p.type\n"
                    + "      ,p.color\n"
                    + "      ,p.ram\n"
                    + "      ,p.memory\n"
                    + "      ,p.qty\n"
                    + "	  ,b.brand_id\n"
                    + "	  ,b.brand_name\n"
                    + "  FROM \"Product\" p\n"
                    + "  JOIN \"Product_Brand\" pb ON p.product_id = pb.product_id\n"
                    + "  JOIN \"Brand\" b ON pb.brand_id = b.brand_id";

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
                p.setQty(rs.getInt("qty"));
                Brand brand = new Brand();
                brand.setId(rs.getInt("brand_id"));
                brand.setName(rs.getString("brand_name"));
                p.setBrand(brand);
                listProduct.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProduct;
    }

    public int getProductQuantityById(int productId) {
        int quantity = 0;
        try {
            String sql = "SELECT qty FROM \"Product\" WHERE product_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                quantity = rs.getInt("qty");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return quantity;
    }

    public void updateQuatityById(int productId, int quantity) {
        try {
            String sql = "UPDATE \"Product\" SET qty = ? WHERE product_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateProduct(Product p) {
        try {
            String sql = "UPDATE \"Product\"\n"
                    + "   SET name = ?\n"
                    + "      ,type = ?\n"
                    + "      ,os = ?\n"
                    + "      ,color = ?\n"
                    + "      ,current_price = ?\n"
                    + "      ,original_price = ?\n"
                    + "      ,ram = ?\n"
                    + "      ,memory = ?\n"
                    + "      ,cpu = ?\n"
                    + "      ,graphics_card = ?\n"
                    + "      ,size = ?\n"
                    + "      ,description = ?\n"
                    + "      ,discount = ?\n"
                    + " WHERE product_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setInt(2, p.getType());
            ps.setString(3, p.getOs());
            ps.setString(4, p.getColor());
            ps.setDouble(5, p.getCurrent_price());
            ps.setDouble(6, p.getOriginal_price());
            ps.setString(7, String.valueOf(p.getRam()));
            ps.setString(8, String.valueOf(p.getMemory()));
            ps.setString(9, p.getCpu());
            ps.setString(10, p.getGraphic_card());
            ps.setDouble(11, p.getSize());
            ps.setString(12, p.getDescription());
            ps.setDouble(13, p.getDiscount());
            ps.setInt(14, p.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteOldProductBrand(int productId) {
        try {
            String sql = "DELETE FROM \"Product_Brand\" WHERE product_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteOldProductRequirment(int productId) {
        try {
            String sql = "DELETE FROM \"Product_Requirement\" WHERE product_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Product getForAllProductByID(int id) {
        Product product = new Product();
        try {
            String sql = "SELECT product_id\n"
                    + "		  ,name\n"
                    + "		  ,type\n"
                    + "		  ,os\n"
                    + "		  ,color\n"
                    + "		  ,current_price\n"
                    + "           ,original_price\n"
                    + "		  ,ram\n"
                    + "		  ,memory\n"
                    + "		  ,cpu\n"
                    + "		  ,graphics_card\n"
                    + "		  ,size\n"
                    + "		  ,description\n"
                    + "		  ,discount\n"
                    + "		  ,qty\n"
                    + "		  ,status\n"
                    + "	  FROM \"Product\" where product_id = ?";
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
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Integer> getTopDiscount(int num) {
        List<Integer> topDiscount = new ArrayList<>();
        try {
            // Thay TOP (?) bằng LIMIT ? ở cuối
            String sql = "SELECT product_id\n"
                    + "  FROM \"Product\" WHERE discount > 0 ORDER BY discount DESC LIMIT ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, num);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("product_id");
                topDiscount.add(id);
            }
            stm.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return topDiscount;
    }

    public static void main(String[] args) {
        ProductDBContext pdb = new ProductDBContext();
        int count = pdb.totalProduct(1, 2);
        System.out.println(count);
    }
}
