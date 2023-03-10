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
        <title>Quản lý sản phẩm</title>

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
                    <li class="breadcrumb-item active">Quản lý sản phẩm</li>
                </ol>

                <!-- Icon Cards-->
                <div class="row">

                    <!-- CARD 1 -->
                    <div class="col-sm-4 mb-3">
                        <div class="card card-r1 text-white bg-danger o-hidden h-100">
                            <div class="card-body mr-5">
                                <div class="card-body-icon">
                                    <i class="fa fa-shopping-bag"></i>
                                </div>
                                <div>
                                    <span>Tổng số sản phẩm</span>
                                </div>
                            </div>
                            <a class="card-footer text-white z-1">
                                <span class="mr-5">${requestScope.totalAllProduct}</span>
                            </a>
                        </div>
                    </div>

                    <!-- CARD 2 -->
                    <div class="col-sm-4 mb-3">
                        <div class="card card-r1 text-white bg-primary o-hidden h-100">
                            <div class="card-body mr-5">
                                <div class="card-body-icon">
                                    <i class="fa fa-phone"></i>
                                </div>
                                <div>
                                    <span>Số điện thoại</span>
                                </div>
                            </div>
                            <a class="card-footer text-white z-1">
                                <span class="mr-5">${requestScope.totalPhone}</span>
                            </a>
                        </div>
                    </div>

                    <!-- CARD 3 -->
                    <div class="col-sm-4 mb-3">
                        <div class="card card-r1 text-white bg-success o-hidden h-100">
                            <div class="card-body mr-5">
                                <div class="card-body-icon">
                                    <i class="fa fa-laptop"></i>
                                </div>
                                <div>
                                    <span>Số máy tính</span>
                                </div>
                            </div>
                            <a class="card-footer text-white z-1">
                                <span class="mr-5">${requestScope.totalComputer}</span>
                            </a>
                        </div>
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
                        <span style="line-height: 1.8"><i class="fa fa-table"></i>&nbsp;Danh sách sản phẩm đang được bày bán</span>
                    </div>
                    <div class="card-body p-2">
                        <div class="table-responsive">
                            <table class="table-pro table-striped table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                                        <th>Quản lý</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">

                                    <!-- Sản phẩm-->
                                    <c:forEach items="${requestScope.products}" var="p">
                                        <tr>
                                            <td>${p.id}</td>
                                            <td class="text-left">${p.name}</td>
                                            <td>
                                                <c:if test="${p.type == 1}">
                                                    Laptop
                                                </c:if>
                                                <c:if test="${p.type == 0}">
                                                    Điện thoại
                                                </c:if>
                                            </td>
                                            <td>${p.color}</td>
                                            <td>${p.ram}<span>GB</span></td>
                                            <td>${p.memory}<span>GB</span></td>
                                            <td class="text-right">${helper.convertBigNum(p.original_price)}&nbsp;&#8363;</td>
                                            <td class="text-right">${helper.convertBigNum(p.current_price)}&nbsp;&#8363;</td>
                                            <td>
                                                <div class="d-flex ">
                                                    <!--Nút "XEM" sẽ link đến trang product detail của sản phẩm-->
                                                    <a class="btn btn-secondary w-100" href="product_detail?product_id=${p.id}">Xem</a>&nbsp;
                                                    <!----------->
                                                    <a class="btn btn-success w-100" href="EditProduct?product_id=${p.id}">Sửa</a>&nbsp;
                                                    <form action="EditProduct" method="POST">
                                                        <input type="text" value="${p.id}" name="product_id" hidden>
                                                        <button type="submit" class="btn btn-danger w-100">Dừng bán</button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
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
