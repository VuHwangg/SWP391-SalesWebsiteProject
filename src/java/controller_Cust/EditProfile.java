/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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

/**
 *
 * @author xuank
 */
public class EditProfile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //   super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        String customer_name = req.getParameter("name");
        String address = req.getParameter("adress");
        String phone = req.getParameter("phone");
        String err = "1";
        AccountDAO adao = new AccountDAO();
        Customer cust = adao.getCust(mail,true); 
        Check check = new Check();
        if(check.CheckPhone(phone) == false){
            err = "Please input Phone Number again";
        }else {
            if (customer_name.equals(cust.getCustomerName())
                    && address.equals(cust.getAddress())
                    && phone.equals(cust.getPhone())){
                err = "The information is duplicate";
            }
        }
        HttpSession session = req.getSession();    
        if (err.equals("1") == false) {
            session.setAttribute("cust", cust);
            req.setAttribute("err", err);
            req.getRequestDispatcher("profile-edit.jsp").forward(req, resp);
        } else {
            if (adao.updateCust(customer_name, address, phone, mail)== true) {
                if (adao.updateAccName(customer_name, mail) == true) {
                    cust = adao.getCust(mail,true);
                    Account acc = adao.checkExistAcc(mail,true);
                    session.setAttribute("acc", acc);
                    session.setAttribute("cust", cust);
                    req.getRequestDispatcher("profile.jsp").forward(req, resp);
                }
            }
        }

    }

  

}
