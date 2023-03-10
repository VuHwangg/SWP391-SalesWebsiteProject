/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_Cust;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.AccountDAO;
import dal.CartDAO;
import dal.OrderDAO;
import dal.ProductDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Map;
import model.Account;
import model.Cart;
import model.Constants;
import model.Customer;
import model.GooglePojo;
import model.Product;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author tient
 */
public class LoginUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static String mail;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //request -> gg -> send form login
        //gg -> respond cho servlet (gmail)
        //check gmail
        //chua co tk -> dki tk
        //home
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        GooglePojo user = getUserInfo(accessToken);
        mail = user.getEmail();
        AccountDAO adao = new AccountDAO();
        OrderDAO odao = new OrderDAO();
        HttpSession session = request.getSession();
        Account acc = adao.checkExistAcc(mail,true);
        Customer cust = adao.getCust(mail, true);
        int role = adao.getRole(mail);
//        if (odao.checkExist(cust.getCustomerId())){
//            session.invalidate();
//        }
// response.getWriter().print(mail);
       
        if (adao.loginGoogle(mail,true)) {
            CartDAO cartDAO = new CartDAO();
            Map<Integer, Cart> carts = cartDAO.getCartsByCustomerId(cust.getCustomerId());
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                int key = entry.getKey();
                Cart val = entry.getValue();
                Product product = new ProductDBContext().getProductByID(key);
                val.setProduct(product);
                val.setCustomer(cust);
            }
            session.setAttribute("carts", carts);
            session.setAttribute("cust", cust);
            session.setAttribute("acc", acc);
            session.setAttribute("role", role);
            request.getRequestDispatcher("home").forward(request, response);
        } else {
            request.getRequestDispatcher("register-user.jsp").forward(request, response);
        }
//        

    }

    //phi??n d???ch m?? t??? respond c???a gg
    //m?? -> gg
    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    //gg -> info
    public static GooglePojo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        GooglePojo googlePojo = new Gson().fromJson(response, GooglePojo.class);

        return googlePojo;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        processRequest(request, response);
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
