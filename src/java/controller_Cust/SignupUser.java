package controller_Cust;

import static controller_Cust.LoginUser.mail;
import dal.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;
import model.Customer;
import util.Check;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author xuank
 */
public class SignupUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String place = req.getParameter("place");
        String email = mail;
        AccountDAO acc = new AccountDAO();

        if (acc.addAcount(mail, "!!", name, true) && acc.addCust(name, place, phone, email, true)) {
            if (acc.addRole(4, mail)) {
                Account acc1 = acc.checkExistAcc(mail, true);
                Customer cust1 = acc.getCust(mail, true);
//                    resp.getWriter().print(acc1.getDisplayname());
//                    resp.getWriter().print(cust1.getCustomerName());
                HttpSession session = req.getSession();
                session.setAttribute("cust", cust1);
                session.setAttribute("acc", acc1);
                try {
                    TimeUnit.SECONDS.sleep(2);
                } catch (InterruptedException ex) {
                    Logger.getLogger(SignupUser.class.getName()).log(Level.SEVERE, null, ex);
                }
                req.getRequestDispatcher("home").forward(req, resp);
            }
        } else {
            req.getRequestDispatcher("register-user.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

}