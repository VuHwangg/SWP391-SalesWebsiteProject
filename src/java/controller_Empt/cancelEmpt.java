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
import java.io.IOException;
import model.Account;

/**
 *
 * @author xuank
 */
public class cancelEmpt extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        String usname = req.getParameter("id");
        AccountDAO adao = new AccountDAO();
        if(adao.updateStatusAccount(usname)== true){
            req.getRequestDispatcher("controllerEmployee").forward(req, resp);
        }else req.getRequestDispatcher("404-page.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       // super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        String usname = req.getParameter("id");
        AccountDAO adao = new AccountDAO();
        if(adao.updateStatusAccount(usname)== true){
            req.getRequestDispatcher("controllerEmployee").forward(req, resp);
        }else req.getRequestDispatcher("404-page.jsp").forward(req, resp);
    }

  
    
    
}
