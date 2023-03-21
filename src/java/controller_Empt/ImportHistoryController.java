/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller_Empt;

import dal.ImportDBContext;
import dal.ProductDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import model.Import_History;
import model.Product;
import util.DateTimeHelper;

/**
 *
 * @author admin
 */
public class ImportHistoryController extends HttpServlet{

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        java.sql.Date from = null;
        java.sql.Date to = null;
        List<Double> totalCost = new ArrayList<>();
        DateTimeHelper dateTime = new DateTimeHelper();
        if (raw_from == null || raw_from.length() == 0) {
            java.util.Date today = new java.util.Date();
            java.util.Date e_from = DateTimeHelper.addDays(today, -6);
            java.util.Date e_to = DateTimeHelper.addDays(today, 0);
            from = DateTimeHelper.toDateSql(e_from);
            to = DateTimeHelper.toDateSql(e_to);
        } else {
            from = java.sql.Date.valueOf(raw_from);
            to = java.sql.Date.valueOf(raw_to);           
        }
        List<Date> dates = dateTime.getDateList(from, to);
        ImportDBContext importHistoryDB = new ImportDBContext();
        for (Date a : dates) {
            totalCost.add(importHistoryDB.getTotalCostByDay(a));
        }
        List<String> dayMonthList = dateTime.getDayMonthList(dates);
        ArrayList<Import_History> historyList = importHistoryDB.listHistoryByDay(from, to);
        request.setAttribute("historyList", historyList);
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("dayMonthList", dayMonthList);
        request.setAttribute("totalCost", totalCost);
        request.getRequestDispatcher("admin-history-list.jsp").forward(request, response);
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

