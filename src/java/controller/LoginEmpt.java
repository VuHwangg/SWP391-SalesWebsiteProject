/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;

/**
 *
 * @author xuank
 */
public class LoginEmpt extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        String email = req.getParameter("email");
        String password = req.getParameter("pass");
        String err = "1";
        if (email.isEmpty()) {
            err = " Please input the your Username";

        } else {
            if (password.isEmpty()) {
                err = "Please input the your Password";

            }

        }
       
        
        if (err.equals("1") == false) {
            req.setAttribute("err", err);
            req.getRequestDispatcher("login-admin.jsp").forward(req, resp);
        } else {
            AccountDAO acc = new AccountDAO();
            Account accout = acc.checkLoginCus(email, password);
            
            if (accout == null) {
                req.setAttribute("err", "Username is not exist");
                req.getRequestDispatcher("login-admin.jsp").forward(req, resp);
            }else{
                req.getRequestDispatcher("#").forward(req, resp);
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

}
