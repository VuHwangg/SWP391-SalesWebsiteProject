/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller_Cust;

import dal.OrderDAO;
import dal.ProductDBContext;
import dal.VoteDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Product;

/**
 *
 * @author admin
 */
public class UserVoteController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String rawRating = request.getParameter("rating");
        int rating = 1;
        if(rawRating!=null){
            rating = Integer.parseInt(rawRating);
        }
        int productId = Integer.parseInt(request.getParameter("productId"));
        String comment = request.getParameter("comment");
        Account acc = (Account) request.getSession().getAttribute("acc");
        String username = acc.getUsername();
        VoteDBContext voteDB = new VoteDBContext();
        int x = voteDB.sendRate(username, productId, comment, rating);
        response.sendRedirect("product_detail?product_id="+productId);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
}
