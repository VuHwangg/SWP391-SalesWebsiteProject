/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller_Cust;

import dal.CartDAO;
import dal.ProductDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import model.Cart;
import model.Customer;
import model.Product;

/**
 *
 * @author Admin
 */
public class AddToCartController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get product id from param
        String rawProductId = req.getParameter("product_id");
        int productId = Integer.parseInt(rawProductId);

        String rawQuantity = req.getParameter("quantity");
        int productQuantity = Integer.parseInt(rawQuantity);
        
        int maxQuantity = new ProductDBContext().getProductQuantityById(productId);

        // Get carts from session
        HttpSession session = req.getSession();
        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        Customer sessionCustomer = (Customer) session.getAttribute("cust");
        CartDAO cartDAO = new CartDAO();
        // if carts dosen't exist creat new one
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        // When product is exist in cart update quantity
        if (carts.containsKey(productId)) {
            int oldQuantity = carts.get(productId).getQuantity();
            if (oldQuantity + productQuantity >= maxQuantity) {
                carts.get(productId).setQuantity(maxQuantity);
            } else {
                carts.get(productId).setQuantity(oldQuantity + productQuantity);
            }
            if (sessionCustomer != null) {
                cartDAO.updateQuantity(carts.get(productId));
            }

            // When product is not exist in cart insert new product
        } else {
            Product product = new ProductDBContext().getProductByID(productId);
            Customer customer = sessionCustomer;
            Cart cart = new Cart();
            cart.setProduct(product);
            cart.setCustomer(customer);
            if (productQuantity >= maxQuantity) {
                cart.setQuantity(maxQuantity);
            } else {
                cart.setQuantity(productQuantity);
            }
            carts.put(productId, cart);
            // Save cart to DB
            if (sessionCustomer != null) {
                cartDAO.saveCartToDB(carts.get(productId));
            }
        }

        // Save cart in session
        session.setAttribute("carts", carts);

        resp.sendRedirect("product_detail?product_id=" + productId);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get product id from param
        String rawProductId = req.getParameter("product_id");
        int productId = Integer.parseInt(rawProductId);

        String rawQuantity = req.getParameter("quantity");
        int productQuantity = Integer.parseInt(rawQuantity);

        int maxQuantity = new ProductDBContext().getProductQuantityById(productId);

        // Get carts from session
        HttpSession session = req.getSession();
        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        Customer sessionCustomer = (Customer) session.getAttribute("cust");
        CartDAO cartDAO = new CartDAO();
        // if carts dosen't exist creat new one
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        // When product is exist in cart update quantity
        if (carts.containsKey(productId)) {
            int oldQuantity = carts.get(productId).getQuantity();
            if (oldQuantity + productQuantity >= maxQuantity) {
                carts.get(productId).setQuantity(maxQuantity);
            } else {
                carts.get(productId).setQuantity(oldQuantity + productQuantity);
            }
            if (sessionCustomer != null) {
                cartDAO.updateQuantity(carts.get(productId));
            }

            // When product is not exist in cart insert new product
        } else {
            Product product = new ProductDBContext().getProductByID(productId);
            Customer customer = sessionCustomer;
            Cart cart = new Cart();
            cart.setProduct(product);
            cart.setCustomer(customer);
            if (productQuantity >= maxQuantity) {
                cart.setQuantity(maxQuantity);
            } else {
                cart.setQuantity(productQuantity);
            }

            carts.put(productId, cart);
            // Save cart to DB
            if (sessionCustomer != null) {
                cartDAO.saveCartToDB(carts.get(productId));
            }
        }
        // Save cart in session
        session.setAttribute("carts", carts);

        resp.sendRedirect("cart");
    }

}
