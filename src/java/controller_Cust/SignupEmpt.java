/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller_Cust;

import dal.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author xuank
 */
public class SignupEmpt extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //  super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String user = req.getParameter("email");
        String name = req.getParameter("name");
        String pass = req.getParameter("pass");

        int role = Integer.parseInt(req.getParameter("role"));
        AccountDAO acc = new AccountDAO();
        if (acc.checkExistAcc(user, true) != null)  {
            resp.getWriter().write("error");
        }else {
            if (acc.addAcount(user, pass, name, true)) {
                if (acc.addRole(role, user)) {
                    req.getRequestDispatcher("controllerEmployee").forward(req, resp);
                }
            }
        }
        }

        @Override
        protected void doGet
        (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        }
        
        public boolean checkName(String name) {
            if (name.trim() == null || name.isEmpty())
                return false;
            return true;
        }

    }
