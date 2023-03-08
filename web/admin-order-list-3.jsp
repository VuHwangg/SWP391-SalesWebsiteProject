<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <a href="admin-order-list-all.jsp">Quản lý đơn hàng</a>
                    </li> 
                    <li class="breadcrumb-item active">Danh sách đơn hàng đã hoàn thành</li>
                </ol>

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
                                    <span>Số đơn đang chuẩn bị</span>
                                </div>
                            </div>
                            <div class="card-footer text-white z-1">
                                <span class="mr-5">0</span>
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
                                    <span>Số đơn đang vận chuyển</span>
                                </div>
                            </div>
                            <div class="card-footer text-white z-1">
                                <span class="mr-5">0</span>
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
                                    <span>Số đơn đã hoàn thành</span>
                                </div>
                            </div>
                            <div class="card-footer text-white z-1">
                                <span class="mr-5">0</span>
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
                                    <span>Số đơn đã bị hủy</span>
                                </div>
                            </div>
                            <div class="card-footer text-white z-1">
                                <span class="mr-5">0</span>
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
                            <span class="text-success" style="text-decoration: underline; font-size: 18px; font-weight: 700;">
                                đã hoàn thành
                            </span>
                        </span>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table-striped table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead class="text-center bg-danger text-white">
                                    <tr>
                                        <th>Mã đơn hàng</th>
                                        <th>Ngày đặt hàng</th>
                                        <th style="width: 30%">Trạng thái</th>
                                        <th>Tổng tiền</th>
                                        <th>Xem chi tiết</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">

                                    <!-- Order-->
                                    <tr>
                                        <td>1</td>
                                        <td>19/2/1999</td>
                                        <td>Đã hoàn thành</td>
                                        <td>19.200.000&nbsp;&#8363;</td>
                                        <td>
                                            <div class="d-flex ">
                                                <a class="btn btn-secondary w-100" href="admin-order-detail.jsp">Xem chi tiết</a>
                                            </div>
                                        </td>
                                    </tr>

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
