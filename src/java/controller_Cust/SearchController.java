/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller_Cust;

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
        String rawNumOfPage = request.getParameter("page");
        String sort = request.getParameter("sort");
        int numOfPage;
        if (rawNumOfPage != null) {
            if(rawNumOfPage.length() == 0){
                numOfPage = 1;
            }else
            numOfPage = Integer.parseInt(request.getParameter("page"));
        } else {
            numOfPage = 1;
        }
        ProductDBContext productList = new ProductDBContext();
        ArrayList<Product> searchList = productList.listProduct(textSearch,sort,numOfPage);
        double totalPage = productList.countProductKey(textSearch);
        totalPage= Math.ceil(totalPage/12);
        request.setAttribute("page", numOfPage);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("searchList", searchList);
        if(searchList.isEmpty()){
            response.sendRedirect("list-search-no.jsp");
        }
        else{
            request.getRequestDispatcher("list-search-yes.jsp").forward(request, response);
        }     
//            response.getWriter().print(productList.countProductKey(textSearch));
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