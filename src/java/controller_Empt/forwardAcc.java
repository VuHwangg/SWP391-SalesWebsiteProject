/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller_Empt;

import dal.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;

/**
 *
 * @author xuank
 */
public class forwardAcc extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        String username = req.getParameter("id");
        AccountDAO acc = new AccountDAO();
        Account accout = acc.getAcc(username);
         HttpSession session = req.getSession();
        if (accout.getRole() == 1) {
            session.setAttribute("acc1", accout);
            req.getRequestDispatcher("dashmap").forward(req, resp);
        } else {
            if (accout.getRole() == 2) {
                accout = acc.getAcc(username);
                session.setAttribute("acc1", accout);
                req.getRequestDispatcher("ProductManagement").forward(req, resp);
            } else {
                accout = acc.getAcc(username);
                session.setAttribute("acc1", accout);
                req.getRequestDispatcher("WarehouseManagment").forward(req, resp);

            }
        }
    }
    }
