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
public class HomeController extends HttpServlet{

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductDBContext productList = new ProductDBContext();
        ArrayList<Product> laptopList = productList.listProduct(1, 8, false);
        ArrayList<Product> phoneList = productList.listProduct(0, 8, false);
        ArrayList<Product> onSaleList = productList.listProduct(-1, 8, true);
        request.setAttribute("laptopList", laptopList);
        request.setAttribute("phoneList", phoneList);
        request.setAttribute("onSaleList", onSaleList);
        request.getRequestDispatcher("index.jsp").forward(request, response);
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

