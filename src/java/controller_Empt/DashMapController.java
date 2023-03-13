/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller_Empt;

import dal.BrandDBContext;
import dal.OrderDAO;
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
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        java.sql.Date from = null;
        java.sql.Date to = null;
        BrandDBContext brdb = new BrandDBContext();
        ArrayList<Brand> phoneBrands = brdb.listByType(0);
        List<String> phoneBrandNames = new ArrayList<>();
        List<Integer> numOfPhones = new ArrayList<>();
        List<Double> totalPrice = new ArrayList<>();
        DateTimeHelper dateTime = new DateTimeHelper();
        OrderDAO orderDB = new OrderDAO();
        List<Date> dates;
        if (raw_from == null || raw_from.length() == 0) {
            java.util.Date today = new java.util.Date();
            int todayOfWeek = DateTimeHelper.getDayofWeek(today);
            java.util.Date e_from = DateTimeHelper.addDays(today, todayOfWeek - 8);
            java.util.Date e_to = DateTimeHelper.addDays(today, 2 - todayOfWeek);
            from = DateTimeHelper.toDateSql(e_from);
            to = DateTimeHelper.toDateSql(e_to);
        } else {
            from = java.sql.Date.valueOf(raw_from);
            to = java.sql.Date.valueOf(raw_to);           
        }
        dates = dateTime.getDateList(from, to);
        for(Brand br : phoneBrands){
            phoneBrandNames.add(br.getName());
            numOfPhones.add(orderDB.getTotalNumByBrand(from, to, br.getName(), 0));
        }
        List<String> dayMonthList = dateTime.getDayMonthList(dates);
        for (Date a : dates) {
            totalPrice.add(orderDB.getTotalPriceByDay(a));
        }
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("phoneBrandNames", phoneBrandNames);
        request.setAttribute("numOfPhones", numOfPhones);
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
