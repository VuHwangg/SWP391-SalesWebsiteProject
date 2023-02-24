/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

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


        // Get carts from session
        HttpSession session = req.getSession();
        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");

        // if carts dosen't exist creat new one
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        // When product is exist in cart update quantity
        if (carts.containsKey(productId)) {
            int oldQuantity = carts.get(productId).getQuantity();
            carts.get(productId).setQuantity(oldQuantity + productQuantity);

            // When product is not exist in cart insert new product
        } else {
            Product product = new ProductDBContext().getProductByID(productId);

            Customer customer = new Customer();
            customer.setCustomerName("NVA");
            Cart cart = new Cart();
            cart.setProduct(product);
            cart.setCustomer(customer);
            cart.setQuantity(productQuantity);
            carts.put(productId, cart);
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


        // Get carts from session
        HttpSession session = req.getSession();
        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");

        // if carts dosen't exist creat new one
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        // When product is exist in cart update quantity
        if (carts.containsKey(productId)) {
            int oldQuantity = carts.get(productId).getQuantity();
            carts.get(productId).setQuantity(oldQuantity + productQuantity);

            // When product is not exist in cart insert new product
        } else {
            Product product = new ProductDBContext().getProductByID(productId);

            Customer customer = new Customer();
            customer.setCustomerName("NVA");
            Cart cart = new Cart();
            cart.setProduct(product);
            cart.setCustomer(customer);
            cart.setQuantity(productQuantity);
            carts.put(productId, cart);
        }
        // Save cart in session
        session.setAttribute("carts", carts);

        resp.sendRedirect("cart");
    }

}
