/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller_Cust;

import static controller_Cust.LoginUser.mail;
import dal.AccountDAO;
import dal.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Customer;
import model.Order;
import util.Helper;

/**
 *
 * @author xuank
 */
public class ViewOrder3 extends HttpServlet{
        @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      //  super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
       AccountDAO adao = new AccountDAO();
        OrderDAO ord = new OrderDAO();
        Customer cust = adao.getCust(mail,true);
        int Preparing = 0;
        int Shipping = 0;
        int Success = 0;
        int Cancelled = 0;
        int total = 0;
        ArrayList<Order> arr = ord.getOrder(cust.getCustomerId());
        for (int i = 0; i < arr.size(); i++) {
            if (arr.get(i).getStatus() == 1) {
                Preparing++;
            } else {
                if (arr.get(i).getStatus() == 2) {
                    Shipping++;
                } else {
                    if (arr.get(i).getStatus() == 3) {
                        Success++;
                    } else if (arr.get(i).getStatus() == 4) {
                        Cancelled++;
                    }
                }
            }

        }
        Helper helper = new Helper();
        ArrayList<Order> arr1 = new ArrayList<>();
        for (int i = 0; i < arr.size(); i++) {
            if (arr.get(i).getStatus()==3) arr1.add(arr.get(i));
            
        }
        total = Preparing + Shipping + Success + Cancelled;
        HttpSession session = req.getSession();
        session.setAttribute("Preparing", Preparing);
        session.setAttribute("Shipping", Shipping);
        session.setAttribute("Success", Success);
        session.setAttribute("Cancelled", Cancelled);

        session.setAttribute("total", total);
        session.setAttribute("lst", arr1);

        req.getRequestDispatcher("order-lookup-3.jsp").forward(req, resp);
    }
}
