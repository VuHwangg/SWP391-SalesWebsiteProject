<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Order" %>
<%@page import="java.sql.Date" %>
<%@page import="java.util.ArrayList" %>
<%@page  import="util.Helper"%>

<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <!--duy ngu-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Tra đơn</title>
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
                    <a href="ViewAllOrder">Đơn hàng của tôi</a>
                </div>

                <div class="row">
                    <div class="col-md-8 col-sm-7">
                        <h3 class="fw-bolder mb-4">DANH SÁCH ĐƠN HÀNG</h3>
                    </div>
                    <div class="col-md-4 col-sm-5 mb-4">
                        <form action="SearchOrder" method="post">
                            <div class="input-group" style="border: 2px solid #dc3545; border-radius: 24px; overflow: hidden;">
                                <input class="form-control border-end-0 border" type="text" name="search" placeholder="Tìm kiếm theo mã đơn hàng">
                                <span class="input-group-append">
                                    <button class="btn bg-danger" type="submit" style="border-radius: 0">
                                        <i class="bi bi-search" style="color: white"></i>
                                    </button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>

                <!--Order lookup-->
                <div class="order-lookup">
                    <!--Order status-->
                    <%
                                            ArrayList<Order> arr = (ArrayList<Order>) session.getAttribute("lst");
                                            String err="";
                                         
                                                      
                    %>
                    <div class="order-status-group row text-center ">
                        <a class="order-status col-md border border-2 p-0 fw-bold" href="ViewAllOrder">
                            <span><%=session.getAttribute("total") %></span>
                            <br>
                            <span>Tất cả</span>
                        </a>
                        <a class="order-status col-md border border-2 p-0 fw-bold" href="ViewOrder1">
                            <span><%=session.getAttribute("Preparing") %></span>
                            <br>
                            <span>Đang chuẩn bị</span>
                        </a>
                        <a class="order-status col-md border border-2 p-0 fw-bold" href="ViewOrder2">
                            <span><%=session.getAttribute("Shipping") %></span>
                            <br>
                            <span>Đang vận chuyển</span>
                        </a>
                        <a class="active order-status col-md border border-2 p-0 fw-bold" href="ViewOrder3">
                            <span><%=session.getAttribute("Success") %></span>
                            <br>
                            <span>Đã nhận hàng</span>
                        </a>
                        <a class="order-status col-md border border-2 p-0 fw-bold" href="ViewOrder4">
                            <span><%=session.getAttribute("Cancelled") %></span>
                            <br>
                            <span>Đơn đã bị hủy</span>
                        </a>
                    </div>


                    <!--Order and detail-->
                    <%
                                           arr = (ArrayList<Order>) session.getAttribute("lst");
                                          err="";
                                         
                                                      
                    %>
                    <table class="order-detail table text-center mt-5">
                        <tbody>
                            <tr class="row fw-bold">
                                <th class="col border border-1 border-white">Mã đơn hàng</th>
                                <th class="col border border-1 border-white">Ngày đặt hàng</th>
                                <th class="col border border-1 border-white">Trạng thái</th>
                                <th class="col border border-1 border-white">Xem chi tiết</th>
                                <th class="col border border-1 border-white">Tổng tiền</th>
                            </tr>
                            <%
                                   if (arr.isEmpty() == false){
                                       for (int i = 0; i < arr.size(); i++) {
                                       Helper helper = new Helper();
                                      String price= helper.convertBigNum(arr.get(i).getTotal_price());
                        
                            %>
                            <tr class="row">
                                <th class="col fw-normal"><%=arr.get(i).getOrder_id()%></th>
                                <th class="col fw-normal"><%=arr.get(i).getDate()%></th>
                                <th class="col fw-normal">Đã nhận hàng</th>
                                <th class="col fw-normal text-decoration-underline">
                                    <a href="ViewOrderDetail?id=<%=arr.get(i).getOrder_id()%>">Xem chi tiết</a>
                                </th>
                                <th class="col fw-normal text-end"><%=price%></th>
                            </tr>
                            
                        <%}
}
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--footer-->
            <%@include file="components/footer.jsp" %>
        </main>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"
        ></script>
        <%@include file="styles/js/script.jsp" %>
    </body>
</html>