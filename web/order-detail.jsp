<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page  import="util.Helper"%>
<%@page import="model.Product" %>
<%@page import="model.Order_Details" %>
<%@page import="model.Order" %>
<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <!--duy ngu-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Chi tiết đơn hàng</title>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        <main>
            <!--navigation bar-->
            <%@include file="components/navbar.jsp" %>

            <div class="py-5"></div>
            <div class="container min-vh-100">
                <!-- Breadcrumb -->
                <div class="breadcrumb" style="padding-top: 20px">
                    <a href="home">Trang chủ</a>
                    <span>&nbsp;/&nbsp;</span>
                    <a href="order-lookup.jsp">Tra đơn</a>
                    <span>&nbsp;/&nbsp;</span>
                    <a href="#">Chi tiết đơn hàng</a>
                </div>

                <%
                    ArrayList<Order_Details> arrOr = (ArrayList<Order_Details>) session.getAttribute("Order_Details");
                    ArrayList<Product> arrPro = (ArrayList<Product>) session.getAttribute("lstPro");


                %>
                <div>
                    <h3 class="fw-bolder mb-4">CHI TIẾT ĐƠN HÀNG <span class="text-decoration-underline"><%=arrOr.get(0).getOrder_id()%></span></h3>
                </div>


                <!--Product List-->
                <table class="order-detail-table table text-center">
                    <%
                        arrOr = (ArrayList<Order_Details>) session.getAttribute("Order_Details");
                        arrPro = (ArrayList<Product>) session.getAttribute("lstPro");
                    %>
                    <tbody>
                        <tr class="row fw-bold">
                            <th class="col-4 border border-1 border-white">Tên sản phẩm</th>
                            <th class="col-2 border border-1 border-white">Màu sắc</th>
                            <th class="col-1 border border-1 border-white">Số lượng</th>
                            <th class="col-2 border border-1 border-white">Chi tiết</th>
                            <th class="col-3 border border-1 border-white">Giá tiền</th>
                        </tr>

                        <%                            
                            Helper helper = new Helper();
                            String err = "";
                            for (int i = 0; i < arrOr.size(); i++) {
                                String price = helper.convertBigNum(arrOr.get(i).getPrice());
                                for (int j = 0; j < arrPro.size(); j++) {
                                    if ((int) arrPro.get(j).getId() == (int) arrOr.get(i).getProduct_id()) {


                        %>
                        <tr class="row py-2">
                            <th class="col-4 fw-normal text-start"><%=arrPro.get(j).getName()%></th>
                            <th class="col-2 fw-normal"><%=arrPro.get(j).getColor()%></th>
                            <th class="col-1 fw-normal"><%=arrOr.get(i).getNum()%></th>
                            <th class="col-2 fw-normal text-decoration-underline"><a href="product_detail?product_id=<%=arrPro.get(j).getId()%>"> Xem chi tiết</a></th>
                            <th class="col-3 fw-normal text-end"><%=price%> &#8363;</th>
                        </tr>
                        <%}
                                }
                            }%>
                    </tbody>
                </table>

                <!---->
                <div class="row border-top border-dark border-3"></div>
                <div>
                    <div class="row py-2 fs-6">
                        <div class="col-6 text-start fw-bolder">
                            <span>Phí vận chuyển</span>
                        </div>
                        <div class="col-6 text-end">
                            <span>0 VNĐ</span>
                        </div>
                    </div>
                    <% Order order = (Order) session.getAttribute("Order");
                        String price1 = helper.convertBigNum(order.getTotal_price());
                    %>
                    <div class="row py-3 fs-5 fw-bolder bg-danger text-white">
                        <div class="col-6 text-start">
                            <span>Tổng cộng</span>
                        </div>
                        <div class="col-6 text-end">
                            <span><%=price1%> VNĐ</span>
                        </div>
                    </div>
                </div>

                <!---->
                <div class="mt-3">
                    <div class="row py-3  fs-5">
                        <div class="col-md-6 text-start fs-5 fst-italic text-decoration-underline">
                        </div>
                        <% if (session.getAttribute("acc") != null) {%>
                        <%if (order.getStatus() == 1) {%>
                        <div class="col-md-6 text-end">
                            <a href="CancelOrder?id=<%=order.getOrder_id()%>"> <button type="button" class="btn btn-secondary w-50 h-100 p-3 fs-4 fw-bolder">HỦY ĐƠN HÀNG</button></a>
                        </div>
                        <%}%>
                    </div>
                    <%}%>
                </div>

            </div>
            <!--footer-->
            
        </main>
                <%@include file="components/footer.jsp" %>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"
        ></script>
        <%@include file="styles/js/script.jsp" %>
    </body>
</html>
