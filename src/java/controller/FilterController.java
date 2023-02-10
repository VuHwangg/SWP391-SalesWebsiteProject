/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
public class FilterController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String rawSort = request.getParameter("sort");
        String rawFrom = request.getParameter("from");
        String rawTo = request.getParameter("to");
        String[] brands = request.getParameterValues("brand");
        String[] needs = request.getParameterValues("needs");
        String[] sizes = request.getParameterValues("size-screen");
        int type = Integer.parseInt(request.getParameter("type"));
        String sort;
        double from, to;
        if (rawSort != null) {
            sort = rawSort;
        } else {
            sort = "none";
        }
        if (rawFrom != null) {
            from = Double.parseDouble(rawFrom);
        } else {
            from = 0;
        }
        if (rawTo != null) {
            to = Double.parseDouble(rawTo);
        } else {
            to = 999999999;
        }
        ProductDBContext productList = new ProductDBContext();
        ArrayList<Product> filterList = productList.filterProduct(type, sort, from, to, needs, brands, sizes);
        request.setAttribute("filterList", filterList);
        request.getRequestDispatcher("list-laptop.jsp").forward(request, response);
//        response.getWriter().print(productList.testString(type, sort, from, to, needs, brands));

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
