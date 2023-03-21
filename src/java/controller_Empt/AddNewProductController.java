/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_Empt;

import dal.BrandDBContext;
import dal.ImageDBContext;
import dal.ProductDBContext;
import dal.RequirementDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;
import java.util.List;
import model.Brand;
import model.Product;
import model.Requirement;
import org.apache.tomcat.jakartaee.commons.compress.utils.IOUtils;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Admin
 */
public class AddNewProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        List<Brand> brands = new BrandDBContext().getAllBrand();
        request.setAttribute("brands", brands);
        
        List<Requirement> requirements = new RequirementDBContext().getAllRequirement();
        request.setAttribute("requirements", requirements);
        
        List<String> os = new ProductDBContext().getAllOs();
        request.setAttribute("os", os);
        request.getRequestDispatcher("admin-product-add.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Collection<Part> parts = request.getParts();
        List<String> base64Images = new ArrayList<>();
        for (Part filePart : parts) {
            if (filePart != null && filePart.getContentType() != null && filePart.getContentType().startsWith("image/")) {
                InputStream fileContent = filePart.getInputStream();
                byte[] bytes = IOUtils.toByteArray(fileContent);
                String base64 = Base64.getEncoder().encodeToString(bytes);
                base64Images.add(base64);
            }
        }
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
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
        product.setOriginal_price(0);
        product.setCurrent_price(0);
        product.setRam(ram);
        product.setMemory(rom);
        product.setCpu(rawCpu);
        product.setGraphic_card(rawGpu);
        product.setSize(size);
        product.setDescription(rawDescription);
        product.setDiscount(0);
        product.setQty(0);
      
        product.setStatus(false);

        ProductDBContext pdb = new ProductDBContext();
        int productId = pdb.insertAndReturnId(product);
        pdb.setProductBrand(productId, brandId);
        pdb.setProductRequirment(productId, requirementId);
        ImageDBContext dao = new ImageDBContext();
        int count = 0;
        for (String base64Image : base64Images) {
            if (count == 0 ) {
                dao.saveImageToDatabase(base64Image, productId, true);
            }
            dao.saveImageToDatabase(base64Image, productId, false);
            count++;
        }

        request.getRequestDispatcher("admin-product-add.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
