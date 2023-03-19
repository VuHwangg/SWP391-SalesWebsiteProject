/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_Empt;

import dal.BrandDBContext;
import dal.ProductDBContext;
import dal.RequirementDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Brand;
import model.Product;
import model.Requirement;

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
        int totalAllProduct = p.totalProduct(1);
        int totalComputer = p.totalProduct(1, 1);
        int totalPhone = p.totalProduct(0, 1);
        List<Brand> brands = new BrandDBContext().getAllBrand();
        request.setAttribute("brands", brands);
        List<Requirement> requirements = new RequirementDBContext().getAllRequirement();
        request.setAttribute("requirements", requirements);
        List<String> os = new ProductDBContext().getAllOs();
        request.setAttribute("os", os);
        request.setAttribute("totalAllProduct", totalAllProduct);
        request.setAttribute("totalComputer", totalComputer);
        request.setAttribute("totalPhone", totalPhone);
        request.setAttribute("product", product);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String rawProductId = request.getParameter("productId");
        int productId = Integer.parseInt(rawProductId);
        
        String rawProductName = request.getParameter("productName").trim();
        //String rawOriginalPrice = request.getParameter("originalPrice");
        //String rawSalePrice = request.getParameter("salePrice");
        
        String rawBrandId = request.getParameter("brand");
        int brandId = Integer.parseInt(rawBrandId);
        if (brandId == -1 ) {
            String otherBrandName = request.getParameter("otherBrand").trim();
            brandId = new BrandDBContext().AddNewBrandAndReturnId(otherBrandName);
        }
        
        String rawRequirementId = request.getParameter("requirement");
        int requirementId = Integer.parseInt(rawRequirementId);
        if (requirementId == -1) {
            String otherRequirementName = request.getParameter("otherRequirement").trim();
            requirementId = new RequirementDBContext().AddNewRequirementAndReturnId(otherRequirementName);
        }
        
        String rawOriginalPrice = request.getParameter("originalPrice");
        double originalPrice = Double.parseDouble(rawOriginalPrice);
        
        String rawSalePrice = request.getParameter("salePrice");
        double salePrice = Double.parseDouble(rawSalePrice);
        
        double discount = 100 - (salePrice / originalPrice * 100);
        String rawColor = request.getParameter("productColor").trim();
        String rawType = request.getParameter("productType").trim();
        String rawRam = request.getParameter("productRam").trim();
        String rawRom = request.getParameter("productRom").trim();
        
        String rawOs = request.getParameter("productOs").trim();
        if (rawOs.equals("-1")) {
            rawOs = request.getParameter("otherOs").trim();
        }
        String rawSzie = request.getParameter("productSize").trim();
        String rawCpu = request.getParameter("productCpu").trim();
        String rawGpu = request.getParameter("productGpu").trim();
        String rawDescription = request.getParameter("productDescription");
        
        int type = Integer.parseInt(rawType);
        int ram = Integer.parseInt(rawRam);
        int rom = Integer.parseInt(rawRom);
        double size = Double.parseDouble(rawSzie);
        
        Product product = new Product();
        product.setName(rawProductName);
        product.setType(type);
        product.setOs(rawOs);
        product.setColor(rawColor);
        product.setOriginal_price(originalPrice);
        product.setCurrent_price(salePrice);
        product.setRam(ram);
        product.setMemory(rom);
        product.setCpu(rawCpu);
        product.setGraphic_card(rawGpu);
        product.setSize(size);
        product.setDescription(rawDescription);
        product.setDiscount(discount);
        product.setQty(0);
        product.setSold(0);
        product.setStatus(false);
        ProductDBContext pdb = new ProductDBContext();
        
        pdb.setProductBrand(productId, brandId);
        pdb.setProductRequirment(productId, requirementId);
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
