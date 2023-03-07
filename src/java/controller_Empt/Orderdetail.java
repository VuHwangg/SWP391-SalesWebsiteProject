/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller_Empt;

import dal.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Order;
import model.Order_Details;
import model.Product;

/**
 *
 * @author xuank
 */
public class Orderdetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        int order_id = Integer.parseInt(req.getParameter("id"));

        OrderDAO odao = new OrderDAO();
        Order or = odao.getOrder1(order_id);
        ArrayList<Order_Details> arrDetail = odao.getOrder_Details(order_id);

        ArrayList<Product> arrPro = new ArrayList<>();
        for (int i = 0; i < arrDetail.size(); i++) {
            arrPro.add(odao.getProduct(arrDetail.get(i).getProduct_id()));

        }
        HttpSession session = req.getSession();
        session.setAttribute("Order_Details", arrDetail);
        session.setAttribute("lstPro", arrPro);
        session.setAttribute("Order", or);
        req.getRequestDispatcher("admin-order-detail.jsp").forward(req, resp);

    }
}
