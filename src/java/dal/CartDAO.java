/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
            String sql = "INSERT INTO [dbo].[Cart]\n"
                    + "           ([product_id]\n"
                    + "           ,[customer_id]\n"
                    + "           ,[num])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?)";
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
            String sql = "UPDATE [dbo].[Cart]\n"
                    + "   SET [product_id] = ?\n"
                    + "      ,[customer_id] = ?\n"
                    + "      ,[num] = ?\n"
                    + " WHERE product_id = ? And customer_id = ?";
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

    public static void main(String[] args) {
        CartDAO dao = new CartDAO();
        Cart cart = new Cart();

        Product p = new Product();
        p.setId(2);
        cart.setProduct(p);

        Customer c = new Customer();
        c.setCustomerId(1);
        cart.setCustomer(c);

        cart.setQuantity(1);
        dao.saveCartToDB(cart);
    }
}
