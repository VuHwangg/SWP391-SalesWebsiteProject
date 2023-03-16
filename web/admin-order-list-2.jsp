<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Order" %>
<%@page import="java.sql.Date" %>
<%@page import="java.util.ArrayList" %>
<%@page  import="util.Helper"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/admin-head.jsp" %>
        <%@include file="styles/css/admin-style.jsp" %>
        <title>Quản lý đơn hàng</title>

    </head>
    <body class="fixed-nav sticky-footer bg-danger" id="page-top">

        <!-- NAVIGATION BAR-->
        <%@include file="components/admin-navbar.jsp" %>

        <!-- CONTENT PART -->
        <div class="content-wrapper">
            <div class="container-fluid">

                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        Quản lý đơn hàng
                    </li> 
                    <li class="breadcrumb-item active">Danh sách đơn hàng đang vận chuyển</li>
                </ol>
                <%
                    ArrayList<Order> arr = (ArrayList<Order>) session.getAttribute("lst");
                    String err = "";


                %>
                <!-- Icon Cards-->
                <div class="row">

                    <!-- CARD 1 -->
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <a href="admin-order-list-1.jsp" class="card card-r1 text-white bg-primary o-hidden h-100">
                            <div class="card-body mr-5">
                                <div class="card-body-icon">
                                    <i class="fa fa-shopping-cart"></i>
                                </div>
                                <div>
                                    <span>Đơn đang chuẩn bị</span>
                                </div>
                            </div>
                            <div class="card-footer text-white z-1">
                                <span class="mr-5">Số lượng: <span style="font-size: 18px; font-weight: 700"><%=session.getAttribute("Preparing")%>&nbsp;đơn</span></span>
                            </div>
                        </a>
                    </div>

                    <!-- CARD 2 -->
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <a href="admin-order-list-2.jsp" class="card card-r1 text-white bg-warning o-hidden h-100">
                            <div class="card-body mr-5">
                                <div class="card-body-icon">
                                    <i class="fa fa-truck"></i>
                                </div>
                                <div>
                                    <span>Đơn đang vận chuyển</span>
                                </div>
                            </div>
                            <div class="card-footer text-white z-1">
                                <span class="mr-5">Số lượng: <span style="font-size: 18px; font-weight: 700"><%=session.getAttribute("Shipping")%>&nbsp;đơn</span></span>
                            </div>
                        </a>
                    </div>

                    <!-- CARD 3 -->
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <a href="admin-order-list-3.jsp" class="card card-r1 text-white bg-success o-hidden h-100">
                            <div class="card-body mr-5">
                                <div class="card-body-icon">
                                    <i class="fa fa-check"></i>
                                </div>
                                <div>
                                    <span>Đơn đã hoàn thành</span>
                                </div>
                            </div>
                            <div class="card-footer text-white z-1">
                                <span class="mr-5">Số lượng: <span style="font-size: 18px; font-weight: 700"><%=session.getAttribute("Success")%>&nbsp;đơn</span></span>
                            </div>
                        </a>
                    </div>

                    <!-- CARD 4 -->
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <a href="admin-order-list-4.jsp" class="card card-r1 text-white bg-danger o-hidden h-100">
                            <div class="card-body mr-5">
                                <div class="card-body-icon">
                                    <i class="fa fa-times"></i>
                                </div>
                                <div>
                                    <span>Đơn đã bị hủy</span>
                                </div>
                            </div>
                            <div class="card-footer text-white z-1">
                                <span class="mr-5">Số lượng: <span style="font-size: 18px; font-weight: 700"><%=session.getAttribute("Cancelled")%>&nbsp;đơn</span></span>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- DATA TABLE CARD-->
                <div class="card mb-3">

                    <!--DO NOT TOUCH ON THIS SHIT BELOW-->
                    <canvas id="myAreaChart" width="100%" height="30" hidden></canvas>
                    <canvas id="myBarChart" width="100" height="70" hidden></canvas>
                    <canvas id="myPieChart" width="100%" height="100" hidden></canvas>
                    <!--DO NOT TOUCH ON THIS SHIT ABOVE-->

                    <div class="card-header">
                        <span style="line-height: 1.8"><i class="fa fa-table"></i>&nbsp;Danh sách đơn hàng
                            <span class="text-warning" style="text-decoration: underline; font-size: 18px; font-weight: 700;">
                                đang vận chuyển
                            </span>
                        </span>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table-striped table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead class="text-center bg-warning text-white">
                                    <tr>
                                        <th>Mã đơn hàng</th>
                                        <th>Ngày đặt hàng</th>
                                        <th style="width: 30%">Trạng thái</th>
                                        <th>Tổng tiền</th>
                                        <th>Xem chi tiết</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">
 <%
                                        if (arr.isEmpty() == false) {
                                            for (int i = 0; i < arr.size(); i++) {
                                                Helper helper = new Helper();
                                                String price = helper.convertBigNum(arr.get(i).getTotal_price());
                                                if (arr.get(i).getStatus() == 2) {

                                    %>
                                    <!-- Order-->
                                    <tr>
                                        <td><%=arr.get(i).getOrder_id()%></td>
                                        <td><%=arr.get(i).getDate()%></td>
                                        <td>
                                            <div class="change-order-status">
                                                <div class="edit-off">
                                                    <!--Trạng thái của đơn hàng-->
                                                    <span class="text-center">Đang vận chuyển</span>
                                                    <a class="change-status-btn text-danger" href="" style="float: right" data-toggle="tooltip" data-placement="top" title="Thay đổi trạng thái đơn hàng">
                                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                    </a>
                                                </div>
                                                <div class="edit-on disable">
                                                    <form class="d-flex" method="post" action="ChangestatusOrder">
                                                        <select class="custom-select" name="status">
                                                             <%session.setAttribute("Odid", arr.get(i).getOrder_id());%>
                                                            <option value="2">Đang vận chuyển</option>
                                                            <option value="3">Hoàn thành</option>
                                                            <option value="4">Bị hủy</option>
                                                        </select>&nbsp;
                                                        <input type="submit" class="btn btn-success" value="Lưu">
                                                    </form>
                                                </div>
                                            </div>
                                        </td>
                                        <td><%=price%>&nbsp;&#8363;</td>
                                        <td>
                                            <div class="d-flex ">
                                                <a class="btn btn-secondary w-100" href="Orderdetail?id=<%=arr.get(i).getOrder_id()%>">Xem chi tiết</a>
                                            </div>
                                        </td>
                                    </tr>

                                      <%}
                                            }
                                        }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
                </div>
            </div>
            <!-- /.container-fluid-->
            <!-- /.content-wrapper-->
            <%@include file="components/admin-footer.jsp" %>
        </div>
        <%@include file="components/admin-footer-link.jsp" %>
        <%@include file="styles/js/admin-script.jsp" %>
    </body>
</html>
