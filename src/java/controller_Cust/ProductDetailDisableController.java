/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller_Cust;

import controller_Empt.*;
import dal.ProductDBContext;
import dal.VoteDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Product;
import model.UserVote;

/**
 *
 * @author admin
 */
public class ProductDetailDisableController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductDBContext productList = new ProductDBContext();
        VoteDBContext voteDB = new VoteDBContext();
        int id = Integer.parseInt(request.getParameter("product_id"));
        ArrayList<UserVote> userVotes = voteDB.listByProductId(id);
        Product product = productList.getProductByIDWithOutStatus(id);
        int maxQuantity = product.getQty();
        request.setAttribute("maxQuantity", maxQuantity);
        request.setAttribute("userVotes", userVotes);
        request.setAttribute("product", product);
        ArrayList<Product> colorList = new ArrayList<>();
        ArrayList<Product> sameList = productList.listSameProduct(4, product.getRam(), product.getMemory(), product.getCpu(), product.getGraphic_card());
        ArrayList<Product> bufferList = productList.bufferObject(product.getName());
        ArrayList<Product> optionList = new ArrayList<>();
        colorList.add(product);
        optionList.add(product);
        request.setAttribute("colorList", colorList);
        request.setAttribute("optionList", optionList);
        request.setAttribute("sameList", sameList);
        request.setAttribute("qty",0);
        request.getRequestDispatcher("product-detail.jsp").forward(request, response);
//        response.getWriter().print(bufferList.get(0).getRam());
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
