<%-- 
    Document   : admin-feedback-management
    Created on : Mar 15, 2023, 4:20:13 PM
    Author     : bonne
--%>

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
        <title>Đánh giá sản phẩm</title>

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
                    <li class="breadcrumb-item active">Đánh giá sản phẩm</li>
                </ol>

                <div class="row">
                    <!-- CARD 1 -->
                    <div class="col-md-4 mb-3">
                        <div class="card card-r2 o-hidden h-100">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div class="mr-3">
                                        <div>
                                            <h4>Số đánh giá chưa duyệt</h4>
                                        </div>
                                        <span style="font-size: 17px">Số lượng: 
                                            <span class="text-danger" style="font-weight: 700; font-size: 18px">
                                                ${requestScope.unconfirmed}&nbsp;đánh giá
                                            </span>
                                        </span>
                                    </div>
                                    <div>
                                        <div class="icon-card-custom bg-danger text-white">
                                            <i class="bi bi-hourglass-split"></i>
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
                                            <h4>Số đánh giá đã duyệt</h4>
                                        </div>
                                        <span style="font-size: 17px">Số lượng: 
                                            <span class="text-danger" style="font-weight: 700; font-size: 18px">
                                                ${requestScope.confirmed}&nbsp;đánh giá
                                            </span>
                                        </span>
                                    </div>
                                    <div>
                                        <div class="icon-card-custom bg-danger text-white">
                                            <i class="bi bi-check-circle-fill"></i>
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
                                            <h4>Số đánh giá đã từ chối</h4>
                                        </div>
                                        <span style="font-size: 17px">Số lượng: 
                                            <span class="text-danger" style="font-weight: 700; font-size: 18px">
                                                ${requestScope.reject}&nbsp;đánh giá
                                            </span>
                                        </span>
                                    </div>
                                    <div>
                                        <div class="icon-card-custom bg-danger text-white">
                                            <i class="bi bi-x-circle-fill"></i>
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
                        <span style="line-height: 1.8"><i class="fa fa-table"></i>&nbsp;Danh sách đánh giá chưa duyệt</span>
                    </div>
                    <div class="card-body p-2">
                        <div class="table-responsive">
                            <table class="table-feedback table-striped table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead class="text-center bg-danger text-white">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Đánh giá</th>
                                        <th>Bình luận</th>
                                        <th>Người đánh giá</th>
                                        <th>Quản lý</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">

                                    <!-- Sản phẩm-->
                                    <c:forEach items="${requestScope.userVotes}" var="p">
                                        <tr>
                                            <td>${p.id}</td>
                                            <td>${p.product.name}</td>
                                            <td><div class="stars">
                                                    <c:forEach var = "i" begin = "1" end = "5">
                                                        <c:choose>
                                                            <c:when test="${i <= p.rating}">
                                                                <i class="bi bi-star-fill active"></i>
                                                            </c:when>    
                                                            <c:otherwise>
                                                                <i class="bi bi-star-fill"></i>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </div></td>
                                            <td>${p.comment}</td>
                                            <td>${p.acc.displayname}</td>
                                            <td>
                                                <form action="changecommentstatus" method="POST" class="d-flex ">
                                                    <input type="text" value="${p.id}" name="voteId" hidden>
                                                    <input type="text" value="${p.product.id}" name="productId" hidden>
                                                    <input type="text" value="${p.rating}" name="rating" hidden>
                                                    <button class="btn btn-success w-100" name="status" value="1" style="margin-right: 4px">
                                                        Xác nhận
                                                    </button>
                                                    <button class="btn btn-danger w-100" name="status" value="2">
                                                        Từ chối
                                                    </button>
                                                </form>
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
