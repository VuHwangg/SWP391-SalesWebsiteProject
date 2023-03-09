<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/admin-head.jsp" %>
        <%@include file="styles/css/admin-style.jsp" %>
        <title>Quản lý kho hàng</title>

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
                    <li class="breadcrumb-item active">Quản lý kho hàng</li>
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
                                <span class="mr-5">1</span>
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
                                <span class="mr-5">2</span>
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
                                <span class="mr-5">3</span>
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
                        <span style="line-height: 1.8"><i class="fa fa-table"></i>&nbsp;Danh sách sản phẩm trong kho</span>
                        <a class="add-btn btn btn-danger text-white" href="admin-product-add.jsp" style="float: right"><i class="fa fa-plus-circle"></i> Thêm sản phẩm</a>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table-wareh table-striped table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                                        <th>Số lượng</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">

                                    <!-- Sản phẩm-->
                                    <tr>
                                        <td>1</td>
                                        <td>Asus Gaming Rog Strix G15</td>
                                        <td>Laptop</td>
                                        <td>Gray</td>
                                        <td>16<span>GB</span></td>
                                        <td>512<span>GB</span></td>
                                        <td class="text-right">57,990,000&nbsp;&#8363;</td>
                                        <td class="text-right">45,990,000&nbsp;&#8363;</td>
                                        <td>
                                            <div class="change-order-status">
                                                <div class="edit-off">
                                                    <span class="text-center">5</span>
                                                    <a class="change-status-btn text-danger" href="" style="float: right" data-toggle="tooltip" data-placement="top" title="Thay đổi số lượng sản phẩm">
                                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                    </a>
                                                </div>
                                                <div class="edit-on disable">
                                                    <form>
                                                        <div class="d-flex quantity-input">
                                                            <input type="number" class="form-control quantity text-center" style="border: 3px solid #dc3536;" value="1" min="1" max="9999" />&nbsp;
                                                            <input type="submit" class="btn btn-danger" value="Lưu">
                                                        </div>
                                                    </form>
                                                </div>
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
