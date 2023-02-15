/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

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
public class SearchOrder extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       // super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        String search = req.getParameter("search");
        OrderDAO odao = new OrderDAO();
        String err = "";
        HttpSession session = req.getSession();
        try {
            int order_id = Integer.parseInt(search);
            Order or = new Order();
            or =odao.GetOrder1(order_id);
            if (or.getOrder_id() == 0) {
                err = "Không có kết quả bạn cần tìm";

            } else {

                ArrayList<Order_Details> arrDetail = odao.GetOrder_Details(order_id);

                ArrayList<Product> arrPro = new ArrayList<>();
                for (int i = 0; i < arrDetail.size(); i++) {
                    arrPro.add(odao.GetProduct(arrDetail.get(i).getProduct_id()));

                }
                
                session.setAttribute("Order_Details", arrDetail);
                session.setAttribute("lstPro", arrPro);
                session.setAttribute("Order", or);

            }
        } catch (Exception e) {
            err = "Không có kết quả bạn cần tìm";

        }
        session.setAttribute("err", err);
      
        req.getRequestDispatcher("order-detail.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

}
