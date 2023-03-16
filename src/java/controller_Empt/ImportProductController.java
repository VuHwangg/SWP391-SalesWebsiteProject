/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_Empt;

import dal.ImportDBContext;
import dal.ProductDBContext;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Import_History;
import model.Product;

/**
 *
 * @author Admin
 */
public class ImportProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rawProductId = request.getParameter("productId");
        String rawQuantity = request.getParameter("productQuantity");
        String rawPrice = request.getParameter("productPrice");
        int productId = Integer.parseInt(rawProductId);
        double price = Double.parseDouble(rawPrice);
        int quantity = Integer.parseInt(rawQuantity);

        Import_History ih = new Import_History();
        ih.setId(productId);
        ih.setNum(quantity);
        ih.setCost(price);

        Product p = new Product();
        p.setId(productId);
        ih.setProduct(p);

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc1");
        if (acc != null) {
            ih.setAccount(acc);

            ImportDBContext idb = new ImportDBContext();
            int flag = idb.importProduct(ih);
            if (flag != -1) {
                ProductDBContext pdb = new ProductDBContext();
                int oldQuantity = pdb.getProductQuantityById(productId);
                pdb.updateQuatityById(productId, oldQuantity + quantity);
            }
        }
        response.sendRedirect("WarehouseManagment");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
