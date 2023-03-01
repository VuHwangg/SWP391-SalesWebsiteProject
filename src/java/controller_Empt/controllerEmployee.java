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
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author xuank
 */
public class controllerEmployee extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      //  super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        AccountDAO adao = new AccountDAO();
        ArrayList<Account> arr = adao.arrAcc();
        HttpSession session = req.getSession();
        int mana =0;
        int empt = 0;
        for (int i = 0; i < arr.size(); i++) {
           if (arr.get(i).getRole() == 2) mana ++;
             if (arr.get(i).getRole() == 3) empt ++;
        }
        session.setAttribute("mana", mana);
        session.setAttribute("empt", empt);
        session.setAttribute("arrAcc", arr);
         req.getRequestDispatcher("admin-employee-list.jsp").forward(req, resp);
    }
    
}
