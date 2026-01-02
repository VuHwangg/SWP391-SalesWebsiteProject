/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Customer;
import model.Product;

/**
 *
 * @author Admin
 */
public class CartDAO {

    public void saveCartToDB(Cart cart) {
        try {
            // Loại bỏ [dbo]. và các dấu ngoặc vuông []
            String sql = "INSERT INTO Cart (product_id, customer_id, num) VALUES (?, ?, ?)";
            Connection conn = new DBContext().connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cart.getProduct().getId());
            ps.setInt(2, cart.getCustomer().getCustomerId());
            ps.setInt(3, cart.getQuantity());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateQuantity(Cart cart) {
        try {
            // Loại bỏ [dbo]. và các dấu ngoặc vuông []
            String sql = "UPDATE Cart "
                    + " SET product_id = ?, customer_id = ?, num = ? "
                    + " WHERE product_id = ? AND customer_id = ?";
            Connection conn = new DBContext().connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cart.getProduct().getId());
            ps.setInt(2, cart.getCustomer().getCustomerId());
            ps.setInt(3, cart.getQuantity());
            ps.setInt(4, cart.getProduct().getId());
            ps.setInt(5, cart.getCustomer().getCustomerId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteProduct(int productId, int customerId) {
        try {
            // Loại bỏ [dbo]. và các dấu ngoặc vuông []
            String sql = "DELETE FROM Cart WHERE product_id = ? AND customer_id = ?";
            Connection conn = new DBContext().connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
            ps.setInt(2, customerId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAllProduct(int customerId) {
        try {
            // Loại bỏ [dbo]. và các dấu ngoặc vuông []
            String sql = "DELETE FROM Cart WHERE customer_id = ?";
            Connection conn = new DBContext().connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, customerId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Map<Integer, Cart> getCartsByCustomerId(int customerId) {
        Map<Integer, Cart> carts = new LinkedHashMap<>();
        try {
            // Câu lệnh này cơ bản đã đúng chuẩn, giữ nguyên để chạy trên PostgreSQL
            String sql = "SELECT cart_id, product_id, customer_id, num FROM Cart WHERE customer_id = ?";
            Connection conn = new DBContext().connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                Cart cart = new Cart();
                cart.setCartId(rs.getInt("cart_id"));
                
                Product p = new Product();
                p.setId(rs.getInt("product_id"));
                cart.setProduct(p);
                
                Customer c = new Customer();
                c.setCustomerId(customerId);
                cart.setCustomer(c);
                cart.setQuantity(rs.getInt("num"));
                
                carts.put(cart.getProduct().getId(), cart);
            }
            return carts;
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) {
        CartDAO dao = new CartDAO();
        Cart c = new Cart();
        Customer cus = new Customer();
        cus.setCustomerId(1);
        c.setCustomer(cus);
        Product p = new Product(1, "name", "vang");
        c.setProduct(p);
        c.setQuantity(222);
        dao.saveCartToDB(c);
    }
}
