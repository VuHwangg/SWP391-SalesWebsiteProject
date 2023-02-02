package controller;


import static controller.LoginUser.mail;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import module.GooglePojo;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author xuank
 */
public class SignupUser extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     
       String name = req.getParameter("name");
       String phone = req.getParameter("phone");
       String place = req.getParameter("place");
       String email = mail;
       String err = "1" ;
       if(name.isEmpty()){
           err = " Please input the your name";
           
       } 
       if(phone.isEmpty()){
           err = "Please input the your phone";
           
       }
       if(place.isEmpty()){
           err = "Please input the your place";
           
       }
      try{
          int test =Integer.parseInt("phone");
      }catch(Exception ex){
          err = "Please input Phone again ";
      }
       if (err.equals("1")== false){
           req.setAttribute("err", err);
           req.getRequestDispatcher("register-user.jsp").forward(req, resp);
       }else {
           
       }
       
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }
    
}
