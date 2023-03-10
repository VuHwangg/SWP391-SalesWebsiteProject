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
public class editEmpt extends HttpServlet {
    private String username;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        
        String name = req.getParameter("name");
        String pass = req.getParameter("password");
        int role = Integer.parseInt(req.getParameter("flexRadioDefault"));
        String url = req.getParameter("img");
        if(url == null) url ="";
        AccountDAO adao = new AccountDAO();
//        resp.getWriter().println(adao.updateAcc(name, username, pass, url));
//        resp.getWriter().println(username);
//        resp.getWriter().println(name);
//       resp.getWriter().println(pass);
//       resp.getWriter().println(role);
//       resp.getWriter().println(adao.updateRole_Acc(role, username));
        if (adao.updateAcc(name, username, pass, url) == true && adao.updateRole_Acc(role, username) == true) {

            req.getRequestDispatcher("controllerEmployee").forward(req, resp);
        } else {
            req.getRequestDispatcher("404-page.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        username = req.getParameter("id");
        AccountDAO adao = new AccountDAO();
        Account acc = adao.getAcc(username);
        HttpSession session = req.getSession();
        session.setAttribute("acc", acc);
        req.getRequestDispatcher("admin-employee-edit.jsp").forward(req, resp);
    }

}
