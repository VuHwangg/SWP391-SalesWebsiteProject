/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.mysql.cj.Messages;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Order;
import model.Order_Details;
import model.Product;

/**
 *
 * @author xuank
 */
public class OrderDAO extends DBContext {

    public boolean addOrder(int status, int cusId, String date, String note, float totalPrice) {
        boolean check = false;
        try {
            // "Order" là từ khóa trong SQL, cần đặt trong ngoặc kép
            String sql = "INSERT INTO \"Order\" "
                    + "(status, customer_id, date, note, total_price) VALUES (?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, cusId);
            // PostgreSQL xử lý tốt định dạng ngày chuẩn yyyy-mm-dd. 
            // Nếu biến 'date' của bạn không chuẩn, có thể cần parse sang java.sql.Date
            ps.setString(3, date); 
            ps.setString(4, note);
            ps.setFloat(5, totalPrice);

            check = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public List<String> getStatusName() {
        List<String> status = new ArrayList<>();
        try {
            // Loại bỏ dấu ngoặc vuông []
            String sql = "SELECT status_name FROM Status";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String sta = rs.getString("status_name");
                status.add(sta);
            }
            stm.close();
            rs.close();
            return status;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int numOfOrderByStatus(String statusName) {
        int count = 0;
        try {
            // "Order" cần ngoặc kép, loại bỏ các ngoặc vuông khác
            String sql = "SELECT COUNT(ord.status) AS c "
                    + "FROM \"Order\" ord "
                    + "INNER JOIN Status sta ON sta.status_id = ord.status "
                    + "WHERE sta.status_name = ? "
                    + "GROUP BY ord.status ORDER BY ord.status ASC";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, statusName);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt("c");
            }
            stm.close();
            rs.close();
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public boolean addOrder_Detail(int order_id, int product_id, int num, float price) {
        boolean check = false;
        try {
            String sql = "INSERT INTO Order_Details "
                    + "(order_id, product_id, num, price) VALUES (?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, order_id);
            ps.setInt(2, product_id);
            ps.setInt(3, num);
            ps.setFloat(4, price);

            check = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public int getLastOrderId() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // Thay TOP 1 bằng LIMIT 1 ở cuối
            String sql = "SELECT order_id FROM \"Order\" ORDER BY order_id DESC LIMIT 1";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("order_id");
            }

        } catch (Exception ex) {
            return 1;
        }
        return 1;
    }

    public ArrayList<Order> getOrder(int Custid) {
        ArrayList<Order> arr = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM \"Order\" WHERE customer_id = ? ";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, Custid);

            rs = stm.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int status = rs.getInt("status");
                int customer_id = rs.getInt("customer_id");
                Date date = rs.getDate("date");
                String note = rs.getString("note");
                float total_price = rs.getFloat("total_price");
                arr.add(new Order(order_id, status, customer_id, date, total_price));
            }

        } catch (Exception ex) {
             ex.printStackTrace();
        }
        return arr;
    }

    public ArrayList<Order_Details> getOrder_Details(int order_id) {
        ArrayList<Order_Details> arr = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM Order_Details WHERE order_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, order_id);

            rs = stm.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                int num = rs.getInt("num");
                float price = rs.getFloat("price");
                arr.add(new Order_Details(order_id, product_id, num, price));
            }

        } catch (Exception ex) {
             ex.printStackTrace();
        }
        return arr;
    }

    public Product getProduct(int product_id) {
        Product pro = new Product();
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            // Loại bỏ dấu ngoặc vuông
            String sql = "SELECT name, color FROM Product WHERE product_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, product_id);

            rs = stm.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String color = rs.getString("color");
                pro = new Product(product_id, name, color);
            }

        } catch (Exception ex) {
             ex.printStackTrace();
        }
        return pro;
    }

    public Order getOrder1(int order_id) {
        Order arr = new Order();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM \"Order\" WHERE order_id = ? ";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, order_id);

            rs = stm.executeQuery();
            if (rs.next()) {
                int status = rs.getInt("status");
                int customer_id = rs.getInt("customer_id");
                Date date = rs.getDate("date");
                String note = rs.getString("note");
                float total_price = rs.getFloat("total_price");
                arr = new Order(order_id, status, customer_id, date, total_price);
            }

        } catch (Exception ex) {
             ex.printStackTrace();
        }
        return arr;
    }

    public Order getOrder2(int order_id, int customer_id) {
        Order arr = new Order();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM \"Order\" WHERE order_id = ? AND customer_id = ? ";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, order_id);
            stm.setInt(2, customer_id);
            rs = stm.executeQuery();
            if (rs.next()) {
                int status = rs.getInt("status");
                Date date = rs.getDate("date");
                String note = rs.getString("note");
                float total_price = rs.getFloat("total_price");
                arr = new Order(order_id, status, customer_id, date, total_price);
            }

        } catch (Exception ex) {
             ex.printStackTrace();
        }
        return arr;
    }

    public boolean updateStatusOrder(int order_id, int status) {
        boolean check = false;
        try {
            String sql = "UPDATE \"Order\" SET status = ? WHERE order_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, order_id);

            check = ps.executeUpdate() > 0;

        } catch (Exception e) {
             e.printStackTrace();
        }
        return check;
    }

    public boolean checkExist(int cust_id) {
        boolean check = false;
        PreparedStatement stm = null;
        ResultSet rs = null;
        // Logic mảng int[] arr = null; int a=0; ở code cũ rất dễ gây lỗi NullPointerException
        // Tuy nhiên tôi giữ nguyên logic kiểm tra tồn tại của bạn
        try {
            String sql = "SELECT cart_id FROM Cart WHERE customer_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cust_id);

            rs = stm.executeQuery();
            if (rs.next()) {
                // Chỉ cần có kết quả là check = true, không cần logic mảng phức tạp
                check = true; 
            }
        } catch (Exception ex) {
             ex.printStackTrace();
        }
        return check;
    }

    public boolean deleteCart(int cart_id) {
        boolean check = false;
        try {
            String sql = "DELETE FROM Cart WHERE cart_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cart_id);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                check = true;
            }

        } catch (SQLException e) {
             e.printStackTrace();
        }
        return check;

    }

    public ArrayList<Order> getallOrder() {
        ArrayList<Order> arr = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM \"Order\" ";
            stm = connection.prepareStatement(sql);

            rs = stm.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int status = rs.getInt("status");
                int customer_id = rs.getInt("customer_id");
                Date date = rs.getDate("date");
                String note = rs.getString("note");
                float total_price = rs.getFloat("total_price");
                arr.add(new Order(order_id, status, customer_id, date, total_price));
            }

        } catch (Exception ex) {
             ex.printStackTrace();
        }
        return arr;
    }

    public double getTotalPriceByDay(Date date) {
        double totalPrice = 0;
        try {
            String sql = "SELECT SUM(total_price) as total "
                    + " FROM \"Order\" WHERE date = ? GROUP BY date";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, date);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                totalPrice = rs.getDouble("total");
            }
            stm.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalPrice;
    }

    public double getTotalPriceInOnePeriod(Date from, Date to) {
        double totalPrice = 0;
        try {
            String sql = "SELECT SUM(total_price) as total "
                    + " FROM \"Order\" WHERE date BETWEEN ? AND ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, from);
            stm.setDate(2, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                totalPrice = rs.getDouble("total");
            }
            stm.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalPrice;
    }

    public int getTotalNumByBrand(Date from, Date to, String brand, int type) {
        int totalNum = 0;
        try {
            String sql = "SELECT SUM(orddet.num) as total_num "
                    + " FROM Order_Details orddet "
                    + " INNER JOIN \"Order\" ord ON orddet.order_id = ord.order_id "
                    + " INNER JOIN Product pr ON pr.product_id = orddet.product_id "
                    + " INNER JOIN Product_Brand prbr ON pr.product_id = prbr.product_id "
                    + " INNER JOIN Brand br ON prbr.brand_id = br.brand_id "
                    + " WHERE br.brand_name = ? AND pr.type = ? AND ord.date BETWEEN ? AND ? "
                    + " GROUP BY br.brand_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, brand);
            stm.setInt(2, type);
            stm.setDate(3, from);
            stm.setDate(4, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                totalNum = rs.getInt("total_num");
            }
            stm.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalNum;
    }

    public List<Integer> getTopSaler(int num) {
        List<Integer> topSaler = new ArrayList<>();
        try {
            // Thay TOP (?) bằng LIMIT ? ở cuối
            String sql = "SELECT pro.product_id, COUNT(od.product_id) as num "
                    + " FROM Product pro "
                    + " LEFT JOIN Order_Details od ON pro.product_id = od.product_id "
                    + " WHERE pro.status = 1 " // hoặc true nếu đã đổi DB
                    + " GROUP BY pro.product_id "
                    + " ORDER BY num DESC LIMIT ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, num);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("product_id");
                topSaler.add(id);
            }
            stm.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return topSaler;
    }
}
