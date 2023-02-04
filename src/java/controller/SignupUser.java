package controller;

import static controller.LoginUser.mail;
import dal.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import util.Check;


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

        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String place = req.getParameter("place");
        String email = mail;
        String err = "1";
        Check ch = new Check();
        if (name.isEmpty()) {
            err = " Please input the your name";

        } else {
            if (phone.isEmpty()) {
                err = "Please input the your phone";

            } else {
                if (place.isEmpty()) {
                    err = "Please input the your place";
                   
                    if (ch.CheckPhone(phone)== false){
                        err = "Your phone is not correct format";
                    }
                } 
            }
        }
        if (err.equals("1") == false) {
            req.setAttribute("err", err);
            req.getRequestDispatcher("register-user.jsp").forward(req, resp);
        } else {
            AccountDAO acc = new AccountDAO();
            if(acc.AddAcount(mail,"!!", name) && acc.AddCust(name,place , phone, email)){
                if(acc.AddRole(4, mail)){
                    req.getRequestDispatcher("home").forward(req, resp);
                }
            }else {req.getRequestDispatcher("register-user.jsp").forward(req, resp);}
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

}
