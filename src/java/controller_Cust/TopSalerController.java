/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller_Cust;

import dal.OrderDAO;
import dal.ProductDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Product;

/**
 *
 * @author admin
 */
public class TopSalerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String rawNumOfPage = request.getParameter("page");
        String rawSort = request.getParameter("sort");
        String sort;
        if (rawSort != null) {
            if (rawSort.length() == 0) {
                sort = "none";
            }else  
            sort = rawSort;
        } else {
            sort = "none";
        }
        int numOfPage;
        if (rawNumOfPage != null) {
            if (rawNumOfPage.length() == 0) {
                numOfPage = 1;
            } else {
                numOfPage = Integer.parseInt(request.getParameter("page"));
            }
        } else {
            numOfPage = 1;
        }
        OrderDAO orderDB = new OrderDAO();
        List<Integer> topSaler = orderDB.getTopSaler(24);
        ProductDBContext productList = new ProductDBContext();
        ArrayList<Product> topSoldListToSort = new ArrayList<>();
        ArrayList<Product> topSoldList = new ArrayList<>();
        int i = 1;
        for (int x : topSaler) {
            topSoldListToSort.add(productList.getProductByID(x));
        }
        if(sort.compareTo("none")==0){
            Collections.sort(topSoldListToSort, new ProductPriceComparatorNone());
        }
        if(sort.compareTo("ASC")==0){
            Collections.sort(topSoldListToSort, new ProductPriceComparatorASC());
        }
        if(sort.compareTo("DESC")==0){
            Collections.sort(topSoldListToSort, new ProductPriceComparatorDESC());
        }
        
        for (Product x : topSoldListToSort) {
            if (i > 12 * (numOfPage - 1) && i <= 12 * numOfPage) {
                topSoldList.add(x);
            }
            i++;
        }
        double totalPage = 24;
        totalPage = Math.ceil(totalPage / 12);
        request.setAttribute("namePage", 0);
        request.setAttribute("page", numOfPage);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("topList", topSoldList);
        request.getRequestDispatcher("list-topsaler.jsp").forward(request, response);
//            response.getWriter().print(topSaler);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    public class ProductPriceComparatorASC implements Comparator<Product> {

        @Override
        public int compare(Product p1, Product p2) {
            return Double.compare(p1.getCurrent_price(), p2.getCurrent_price());
        }
    }

    public class ProductPriceComparatorDESC implements Comparator<Product> {

        @Override
        public int compare(Product p1, Product p2) {
            return Double.compare(p2.getCurrent_price(), p1.getCurrent_price());
        }
    }

    public class ProductPriceComparatorNone implements Comparator<Product> {

        @Override
        public int compare(Product p1, Product p2) {
            return Double.compare(p2.getDiscount(), p1.getDiscount());
        }
    }
}
