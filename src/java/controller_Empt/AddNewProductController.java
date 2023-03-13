/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_Empt;

import dal.ImageDBContext;
import dal.ProductDBContext;
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
import model.Product;
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
        String rawProductName = request.getParameter("productName");
        String rawOriginalPrice = request.getParameter("originalPrice");
        String rawSalePrice = request.getParameter("salePrice");
        String rawColor = request.getParameter("productColor");
        String rawType = request.getParameter("productType");
        String rawRam = request.getParameter("productRam");
        String rawRom = request.getParameter("productRom");
        String rawOs = request.getParameter("productOs");
        String rawSzie = request.getParameter("productSize");
        String rawCpu = request.getParameter("productCpu");
        String rawGpu = request.getParameter("productGpu");
        String rawDescription = request.getParameter("productDescription");

        int type = Integer.parseInt(rawType);
        double originalPrice = Double.parseDouble(rawOriginalPrice);
        double salePrice = Double.parseDouble(rawSalePrice);
        double discountPercent = 100 - ((salePrice / originalPrice) * 100);
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
        product.setRam(type);
        product.setRam(ram);
        product.setMemory(rom);
        product.setCpu(rawCpu);
        product.setGraphic_card(rawGpu);
        product.setSize(size);
        product.setDescription(rawDescription);
        product.setDiscount(discountPercent);
        product.setStatus(true);

        ProductDBContext pdb = new ProductDBContext();
        int productId = pdb.insertAndReturnId(product);
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
