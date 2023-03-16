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
        <title>Sản phẩm chưa bán</title>

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
                    <li class="breadcrumb-item active">Sản phẩm chưa bán</li>
                </ol>

                <!-- Icon Cards-->
                <div class="row">
                    <!-- CARD 1 -->
                    <div class="col-md-4 mb-3">
                        <div class="card card-r2 o-hidden h-100">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div class="mr-3">
                                        <div>
                                            <h4>Mặt hàng chưa bán</h4>
                                        </div>
                                        <span style="font-size: 17px">Số lượng: 
                                            <span class="text-danger" style="font-weight: 700; font-size: 18px">
                                                ${requestScope.totalAllProduct}&nbsp;mặt hàng
                                            </span>
                                        </span>
                                    </div>
                                    <div>
                                        <div class="icon-card-custom bg-danger text-white">
                                            <i class="bi bi-basket-fill"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--<a href="#" class="card-footer bg-danger text-white z-1">
                                    Xem chi tiết 
                            </a>-->
                        </div>
                    </div>

                    <!-- CARD 2 -->
                    <div class="col-md-4 mb-3">
                        <div class="card card-r2 o-hidden h-100">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div class="mr-3">
                                        <div>
                                            <h4>Điện thoại</h4>
                                        </div>
                                        <span style="font-size: 17px">Số lượng: 
                                            <span class="text-danger" style="font-weight: 700; font-size: 18px">
                                                ${requestScope.totalPhone}&nbsp;mặt hàng
                                            </span>
                                        </span>
                                    </div>
                                    <div>
                                        <div class="icon-card-custom bg-danger text-white">
                                            <i class="bi bi-phone-fill"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--<a href="#" class="card-footer bg-danger text-white z-1">
                                   Xem chi tiết 
                           </a>-->
                        </div>
                    </div>

                    <!-- CARD 3 -->
                    <div class="col-md-4 mb-3">
                        <div class="card card-r2 o-hidden h-100">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div class="mr-3">
                                        <div>
                                            <h4>Laptop</h4>
                                        </div>
                                        <span style="font-size: 17px">Số lượng: 
                                            <span class="text-danger" style="font-weight: 700; font-size: 18px">
                                                ${requestScope.totalComputer}&nbsp;mặt hàng
                                            </span>
                                        </span>
                                    </div>
                                    <div>
                                        <div class="icon-card-custom bg-danger text-white">
                                            <i class="bi bi-laptop-fill"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--<a href="#" class="card-footer bg-danger text-white z-1">
                                   Xem chi tiết 
                           </a>-->
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
                        <span style="line-height: 1.8"><i class="fa fa-table"></i>&nbsp;Danh sách sản phẩm </span>
                        <span class="text-danger" style="font-weight: 700; font-size: 18px; text-decoration: underline">chưa bán</span>
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
                                            <td>Xanh</td>
                                            <td>6<span>GB</span></td>
                                            <td>128<span>GB</span></td>
                                            <td class="text-right">${helper.convertBigNum(p.original_price)}&nbsp;&#8363;</td>
                                            <td class="text-right">${helper.convertBigNum(p.current_price)}&nbsp;&#8363;</td>
                                            <td>
                                                <div class="d-flex ">
                                                    <!--Nút "XEM" sẽ link đến trang product detail của sản phẩm-->
                                                    <a class="btn btn-secondary w-100" href="product_detail?product_id=${p.id}">Xem</a>&nbsp;
                                                    <!----------->
                                                    <a class="btn btn-warning w-100" href="EditProduct?product_id=${p.id}">Sửa</a>&nbsp;
                                                    <form action="ChangeProductStatus" method="POST">
                                                        <input type="text" value="${p.id}" name="product_id" hidden>
                                                        <input type="text" value="1" name="status" hidden>
                                                        <button type="submit" class="btn btn-success w-100">Đăng bán</button>
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
