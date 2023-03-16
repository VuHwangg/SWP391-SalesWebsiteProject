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
        String repass = req.getParameter("repass");
        String img = req.getParameter("img");
        int role = Integer.parseInt(req.getParameter("role"));
        String err = "1";
        AccountDAO acc = new AccountDAO();
        if (user.isEmpty()) {
            err = "Please input Username";
        }if(acc.checkExistAcc(user,true) != null){
            err = "The Username is Exist. Please input anothor username";
        } 
        else {
            if (pass.isEmpty()) {
                err = "Please input Password";

            } else {
                if (repass.isEmpty()) {
                    err = "Please input Repassword";
                } else if (repass.equals(pass) == false) {
                    err = "Confirmation passsword is not duplicate";
                }
            }
        }
        if (err.equals("1")== false){
            req.setAttribute("err", err);
             req.getRequestDispatcher("register-admin.jsp").forward(req, resp);
        }else{
            
            if(acc.addAcount(user, pass, name,img,true)){
                if(acc.addRole(role, user)){
                     req.getRequestDispatcher("controllerEmployee").forward(req, resp);
                }
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

}
