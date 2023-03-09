<jsp:useBean id="helper" class="util.Helper"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/admin-head.jsp" %>
        <%@include file="styles/css/admin-style.jsp" %>
        <title>Tra cứu lịch sử nhập hàng</title>

    </head>
    <body class="fixed-nav sticky-footer bg-danger" id="page-top">

        <!-- NAVIGATION BAR-->
        <%@include file="components/admin-navbar.jsp" %>

        <!-- CONTENT PART -->
        <div class="content-wrapper">
            <div class="container-fluid">

                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <!-- <li class="breadcrumb-item">
                      <a href="#">Thống kê</a>
                    </li> -->
                    <li class="breadcrumb-item active">Tra cứu lịch sử nhập hàng</li>
                </ol>

                <!-- AREA CHART CARD -->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-area-chart"></i>&nbsp;Biểu đồ thống kê lịch sử nhập hàng theo ngày</div>
                    <div class="card-body">

                        <!-- Nhập số liệu vào bảng ở bên file "admin-script.js" phần "AREA CHART DATA" -->
                        
                        <canvas id="myAreaChart" width="100%" height="30" ></canvas>
                    </div>
                    <!-- <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
                </div>

                <!-- DATA TABLE CARD-->
                <div class="card mb-3">

                    <!--DO NOT TOUCH ON THIS SHIT BELOW-->
                    <canvas id="myBarChart" width="100" height="70" hidden></canvas>
                    <canvas id="myPieChart" width="100%" height="100" hidden></canvas>
                    <!--DO NOT TOUCH ON THIS SHIT ABOVE-->

                    <div class="card-header">
                        <span style="line-height: 1.8"><i class="fa fa-table"></i>&nbsp;Danh sách lịch sử nhập hàng</span>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table-history table-striped table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead class="text-center bg-danger text-white">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Phân loại</th>
                                        <th>Màu sắc</th>
                                        <th>RAM</th>
                                        <th>ROM</th>
                                        <th>Giá gốc</th>
                                        <th>Giá bán</th>
                                        <th>Ngày nhập</th>
                                        <th>Người nhập</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">

                                    <!-- Sản phẩm-->
                                    <tr>
                                        <td>1</td>
                                        <td>Iphone 15</td>
                                        <td>Điện thoại</td>
                                        <td>Trắng</td>
                                        <td>4<span>GB</span></td>
                                        <td>128<span>GB</span></td>
                                        <td class="text-right">29,990,000&nbsp;&#8363;</td>
                                        <td class="text-right">27,900,000&nbsp;&#8363;</td>
                                        <td>3/10/2023</td>
                                        <td>Vũ đẹp zai</td>
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
        <%@include file="styles/js/admin-script-additional.jsp" %>
    </body>
</html>
