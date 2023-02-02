/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.ProductDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Product;

/**
 *
 * @author admin
 */
public class SearchController extends HttpServlet{
    
       protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String textSearch = request.getParameter("txtSearch");
        String sort = request.getParameter("sort");
        ProductDBContext productList = new ProductDBContext();
        ArrayList<Product> searchList = productList.listProduct(textSearch,sort);
        request.setAttribute("searchList", searchList);
        if(searchList.isEmpty()){
            response.sendRedirect("list-search-no.jsp");
        }
        else{
            request.getRequestDispatcher("list-search-yes.jsp").forward(request, response);
        }
        
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