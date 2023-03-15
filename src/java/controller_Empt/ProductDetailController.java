/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller_Empt;

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
public class ProductDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductDBContext productList = new ProductDBContext();
        int id = Integer.parseInt(request.getParameter("product_id"));
        
        Product product = productList.getProductByID(id);
        int maxQuantity = product.getQty();
        request.setAttribute("maxQuantity", maxQuantity);
        request.setAttribute("product", product);
        ArrayList<Product> colorList = productList.listColor(product.getName(), product.getRam(), product.getMemory(), product.getCpu(), product.getGraphic_card());
        ArrayList<Product> sameList = productList.listSameProduct(4, product.getRam(), product.getMemory(), product.getCpu(), product.getGraphic_card());
        ArrayList<Product> bufferList = productList.bufferObject(product.getName());
        ArrayList<Product> optionList = new ArrayList<>();
        for(Product pro : bufferList){
            Product diffOption = productList.getProduct(pro.getName(), pro.getRam(), pro.getMemory(), pro.getCpu(), pro.getGraphic_card());
//            response.getWriter().print(diffOption.getName());
            optionList.add(diffOption);
        }
        request.setAttribute("colorList", colorList);
        request.setAttribute("optionList", optionList);
        request.setAttribute("sameList", sameList);
        request.setAttribute("qty",product.getQty());
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
