/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import static controller.LoginUser.mail;
import dal.AccountDAO;
import dal.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import model.Customer;
import model.Order;

/**
 *
 * @author xuank
 */
public class ViewAllOrder extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        AccountDAO adao = new AccountDAO();
        OrderDAO ord = new OrderDAO();
        Customer cust = adao.GetCust(mail);
        ArrayList<Order> arr = ord.GetOrder(cust.getCustomerId());
        HttpSession session = req.getSession();
     
        session.setAttribute("lst", arr);
    
        req.getRequestDispatcher("order-lookup.jsp").forward(req, resp);

    }

}
