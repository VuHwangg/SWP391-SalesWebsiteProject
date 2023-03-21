/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller_Empt;

import dal.BrandDBContext;
import dal.OrderDAO;
import dal.ProductDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import util.DateTimeHelper;

/**
 *
 * @author admin
 */
public class DashMapController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        OrderDAO orderDB = new OrderDAO();
        ProductDBContext proDB = new ProductDBContext();
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        java.sql.Date from = null;
        java.sql.Date to = null;
        BrandDBContext brdb = new BrandDBContext();
        List<Brand> brands = brdb.getAllBrand();
        List<String> brandNames = new ArrayList<>();
        List<String> status = orderDB.getStatusName();
        List<Integer> numOfPhones = new ArrayList<>();
        int numOfItem = proDB.numOfItem();
        int numOfProduct= proDB.numOfProduct();
        List<Integer> numOfOrderByStatus= new ArrayList<>();
        List<Integer> numOfLaps = new ArrayList<>();
        List<Double> totalPrice = new ArrayList<>();
        DateTimeHelper dateTime = new DateTimeHelper(); 
        if (raw_from == null || raw_from.length() == 0) {
            java.util.Date today = new java.util.Date();
            int todayOfWeek = DateTimeHelper.getDayofWeek(today);
            java.util.Date e_from = DateTimeHelper.addDays(today, -6);
            java.util.Date e_to = DateTimeHelper.addDays(today, 0);
            from = DateTimeHelper.toDateSql(e_from);
            to = DateTimeHelper.toDateSql(e_to);
        } else {
            from = java.sql.Date.valueOf(raw_from);
            to = java.sql.Date.valueOf(raw_to);           
        }
        double totalPriceInOnePeriod = orderDB.getTotalPriceInOnePeriod(from, to);
        List<Date> dates = dateTime.getDateList(from, to);
        for(Brand br : brands){
            brandNames.add(br.getName());
            numOfPhones.add(orderDB.getTotalNumByBrand(from, to, br.getName(), 0));
            numOfLaps.add(orderDB.getTotalNumByBrand(from, to, br.getName(), 1));
        }
        List<String> dayMonthList = dateTime.getDayMonthList(dates);
        for (Date a : dates) {
            totalPrice.add(orderDB.getTotalPriceByDay(a));
        }
        for(String sta : status){
            numOfOrderByStatus.add(orderDB.numOfOrderByStatus(sta));
//            response.getWriter().print(sta + ": "+orderDB.numOfOrderByStatus(sta));
        }
        request.setAttribute("totalPriceInOnePeriod", totalPriceInOnePeriod);
        request.setAttribute("numOfItem", numOfItem);
        request.setAttribute("numOfProduct", numOfProduct);
        request.setAttribute("status", status);
        request.setAttribute("numOfOrderByStatus", numOfOrderByStatus);
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("brandNames", brandNames);
        request.setAttribute("numOfPhones", numOfPhones);
        request.setAttribute("numOfLaps", numOfLaps);
        request.setAttribute("dayMonthList", dayMonthList);
        request.setAttribute("totalPrice", totalPrice);
        request.getRequestDispatcher("admin-dashmap.jsp").forward(request, response);
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
