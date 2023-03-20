/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_Cust;

import dal.AccountDAO;
import dal.OrderDAO;
import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import model.Cart;
import model.Customer;
import util.EmailConfig;

public class Payment2 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Payment2</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Payment2 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        HttpSession session = request.getSession();
        ProductDBContext pdo = new ProductDBContext();
        try {
            Customer cus = (Customer) session.getAttribute("cust");
            //send email
            EmailConfig Ec = new EmailConfig();
            String email = (String) request.getParameter("email");
            //create cus and add cus if guest
            if (cus == null) {
                AccountDAO ad = new AccountDAO();
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                ad.addCust(name, address, phone, email, false);

                session.setAttribute("cust", ad.getlastCust(email, false));

            }
            //add order  va orderdetail
            if (session.getAttribute("carts") != null) {
                OrderDAO od = new OrderDAO();
                cus = (Customer) session.getAttribute("cust");
                Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
                float total_price = 0;

                //loop qua map
                for (Map.Entry<Integer, Cart> cart : carts.entrySet()) {
                    total_price += Float.parseFloat(cart.getValue().getProduct().getCurrent_price() + "") * cart.getValue().getQuantity();

                }
                //add order, send email. lay order id vua add
                od.addOrder(1, cus.getCustomerId(), LocalDate.now().toString(), "", total_price);
//                response.getWriter().print( cus.getCustomerId());
//                response.getWriter().print(LocalDate.now().toString());
//                response.getWriter().print( total_price);

                int NewOrderId = od.getLastOrderId();

                for (Map.Entry<Integer, Cart> cart : carts.entrySet()) {
                    float price = Float.parseFloat(cart.getValue().getProduct().getCurrent_price() + "");
//                    response.getWriter().println(cart.getValue().getProduct().getId());
//                     response.getWriter().println((cart.getValue().getProduct().getQty()-cart.getValue().getQuantity()));

                    if (pdo.deleteNumberProduct(cart.getValue().getProduct().getId(), (cart.getValue().getProduct().getQty() - cart.getValue().getQuantity()))) {

                        if (od.addOrder_Detail(NewOrderId, cart.getKey(), cart.getValue().getQuantity(), price)) {

                            if (session.getAttribute("acc") != null) {



                                if (od.deleteCart(cart.getValue().getCartId())) {

                                } else {
//                                request.getRequestDispatcher("404-page.jsp").forward(request, response);
                                    response.getWriter().print(cart.getValue().getCartId());
                                }

                            }
                        } else {
                            request.getRequestDispatcher("cart-null.jsp").forward(request, response);
                        }

                    }
                }

                Ec.SendEmail(email, total_price, Ec.MessageProduct(carts), NewOrderId);
                session.setAttribute("Order", od.getOrder1(NewOrderId));
                session.setAttribute("OrderDetails", od.getOrder_Details(NewOrderId));

                session.setAttribute("carts", null);

                if (!cus.isStatus()) {
                    session.setAttribute("cus", null);
                }

            }
////        }catch(Exception ex){
////            
////        }

            request.getRequestDispatcher("home").forward(request, response);

        } catch (MessagingException ex) {
            response.getWriter().write("error");
            request.getRequestDispatcher("home").forward(request, response);
        } catch (SQLException ex) {
            response.getWriter().write("error");
            Logger.getLogger(Payment2.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
