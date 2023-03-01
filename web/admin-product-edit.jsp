
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                    <li class="breadcrumb-item">
                        <a href="admin-product-list.jsp">Quản lý sản phẩm</a>
                    </li> 
                    <li class="breadcrumb-item active">Chỉnh sửa</li>
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
                                <span class="mr-5">50</span>
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
                                <span class="mr-5">30</span>
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
                                <span class="mr-5">20</span>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- EDIT CARD-->
                <div class="card mb-3">

                    <!--DO NOT TOUCH ON THIS SHIT BELOW-->
                    <canvas id="myAreaChart" width="100%" height="30" hidden></canvas>
                    <canvas id="myBarChart" width="100" height="70" hidden></canvas>
                    <canvas id="myPieChart" width="100%" height="100" hidden></canvas>
                    <!--DO NOT TOUCH ON THIS SHIT ABOVE-->

                    <div class="card-header">
                        <i class="fa fa-pencil-square-o"></i>&nbsp;Chỉnh sửa sản phẩm số
                        <!--ID của sản phẩm-->
                        <span class="text-danger" style="text-decoration: underline; font-size: 18px; font-weight: 700;">
                            #1
                        </span>
                    </div>
                    <div class="card-body p-3">
                        <form>
                            <div class="row">
                                <div class="col-sm-6 mb-3">
                                    <!--Tên sản phẩm-->
                                    <input type="text" class="form-control" placeholder="Tên sản phẩm" value="" required>
                                </div>
                                <div class="input-group col-sm-3 mb-3">
                                    <!--Giá gốc-->
                                    <input type="text" class="form-control" placeholder="Giá gốc" value="" required>
                                    <span class="input-group-text">VNĐ</span>
                                </div>
                                <div class="input-group col-sm-3 mb-3">
                                    <!--Giá sale-->
                                    <input type="text" class="form-control" placeholder="Giá sale" value="">
                                    <span class="input-group-text">VNĐ</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 mb-3">
                                    <!--Màu sắc-->
                                    <input type="text" class="form-control" placeholder="Màu sắc sản phẩm" value="" required>
                                </div>
                                <div class="col-sm-6 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="inputGroupSelect01">Loại sản phẩm</label>
                                    </div>
                                    <!--Loại sản phẩm-->
                                    <select class="custom-select" id="inputGroupSelect01">
                                        <option selected value="phone">Điện thoại</option>
                                        <option value="laptop">Laptop</option>
                                    </select>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <!--Thêm nhiều ảnh-->
                                <input type="file" class="form-control" id="inputGroupFile01" accept="image/png, image/jpeg" multiple required>
                                <div class="input-group-append" >
                                    <label class="input-group-text" style="cursor: pointer" for="inputGroupFile01">Tải ảnh lên (có thể chọn nhiều ảnh)</label>
                                </div>
                            </div>
                            <div class="mb-3">
                                <h5 class="fw-bold">Thông số kỹ thuật</h5>
                            </div>
                            <div class="row">
                                <div class="input-group col-sm-3 mb-3">
                                    <!--RAM-->
                                    <input type="text" class="form-control" placeholder="RAM" value="" required>
                                    <span class="input-group-text">GB</span>
                                </div>
                                <div class="input-group col-sm-3 mb-3">
                                    <!--ROM-->
                                    <input type="text" class="form-control" placeholder="ROM (bộ nhớ trong)" value="" required>
                                    <span class="input-group-text">GB</span>
                                </div>
                                <div class="col-sm-6 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="inputGroupSelect02">Hệ điều hành</label>
                                    </div>
                                    <!--Hệ điều hành-->
                                    <select class="custom-select" id="inputGroupSelect02">
                                        <option selected value="android">Android</option>
                                        <option value="ios">IOS</option>
                                        <option value="window">Windows</option>
                                        <option value="macos">MacOS</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-group col-sm-4 mb-3">
                                    <!--Kích thước màn hình-->
                                    <input type="text" class="form-control" placeholder="Kích thước màn hình" value="">
                                    <span class="input-group-text">Inchs</span>
                                </div>
                                <div class="col-sm-4 mb-3">
                                    <!--CPU-->
                                    <input type="text" class="form-control" placeholder="CPU (Chipset)" value="">
                                </div>
                                <div class="col-sm-4 mb-3">
                                    <!--GPU-->
                                    <input type="text" class="form-control" placeholder="GPU (Card đồ họa)" value="">
                                </div>
                            </div>
                            <div class="d-flex justify-content-end align-items-end">
                                <input type="submit" class="save-btn btn btn-danger m-1" value="Lưu Lại Thay Đổi">
                                <a class="save-btn btn btn-secondary text-white m-1" onclick="history.back(-1)">
                                    Quay Lại
                                </a>
                            </div>
                        </form>
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
