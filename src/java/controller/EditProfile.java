/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import static controller.LoginUser.mail;
import dal.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Customer;
import util.Check;

/**
 *
 * @author xuank
 */
public class EditProfile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //   super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        String customer_name = req.getParameter("name");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String err = "1";
        AccountDAO adao = new AccountDAO();
        Customer cust = adao.GetCust(mail);

       

        if (cust.getCustomerName().equalsIgnoreCase(customer_name) == true
                && cust.getAddress().equalsIgnoreCase(address) == true
                && cust.getPhone().equalsIgnoreCase(phone) == true) {
            err = "The information you change matches the information available";
        }

        if (err.equals("1") == false) {
            req.setAttribute("err", err);
            req.getRequestDispatcher("user-info.jsp").forward(req, resp);
        } else {
            if (adao.UpdateCust(customer_name, address, phone, mail)) {
                if (adao.UpdateAccName(customer_name, mail)) {
                    req.getRequestDispatcher("home").forward(req, resp);
                }
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

}
