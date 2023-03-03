/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_Empt;

import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author Admin
 */
public class EditProductController extends HttpServlet {

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
        String rawProductId = request.getParameter("product_id");
        int productID = Integer.parseInt(rawProductId);
        ProductDBContext p = new ProductDBContext();
        Product product = p.getProductByID(productID);
        int totalAllProduct = p.totalProduct();
        int totalComputer = p.totalProduct(1, 1);
        int totalPhone = p.totalProduct(0, 1);
        request.setAttribute("totalAllProduct", totalAllProduct);
        request.setAttribute("totalComputer", totalComputer);
        request.setAttribute("totalPhone", totalPhone);
        if (p != null) {
            request.setAttribute("product", product);
        }
        request.getRequestDispatcher("admin-product-edit.jsp").forward(request, response);
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
        String rawProductId = request.getParameter("product_id");
        int productID = Integer.parseInt(rawProductId);
        ProductDBContext p = new ProductDBContext();
        p.changeProductStatus(productID, false);
        response.sendRedirect("ProductManagement");
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
