
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/admin-head.jsp" %>
        <%@include file="styles/css/admin-style.jsp" %>
        <title>Quản lý nhân viên</title>

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
                        <a href="admin-employee-list.jsp">Quản lý nhân viên</a>
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
                                    <i class="fa fa-fw fa-comments"></i>
                                </div>
                                <div>
                                    <span>Tổng số nhân viên</span>
                                </div>
                            </div>
                            <a class="card-footer text-white z-1">
                                <span class="mr-5">5</span>
                            </a>
                        </div>
                    </div>

                    <!-- CARD 2 -->
                    <div class="col-sm-4 mb-3">
                        <div class="card card-r1 text-white bg-primary o-hidden h-100">
                            <div class="card-body mr-5">
                                <div class="card-body-icon">
                                    <i class="fa fa-fw fa-list"></i>
                                </div>
                                <div>
                                    <span>Số quản kho</span>
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
                                    <i class="fa fa-fw fa-shopping-cart"></i>
                                </div>
                                <div>
                                    <span>Số bán hàng</span>
                                </div>
                            </div>
                            <a class="card-footer text-white z-1">
                                <span class="mr-5">3</span>
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
                        <i class="fa fa-pencil-square-o"></i>&nbsp;Chỉnh sửa nhân viên</div>
                    <div class="card-body p-3">
                        <form>
                            <div class="mb-3">
                                <input type="text" class="form-control" id="name" name="name" placeholder="Họ và tên" value="Chu Thành Duy" required>

                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" id="phone" name="username" placeholder="Tài khoản" value="chuthanhduy" required>

                            </div>
                            <div class="mb-3">
                                <div class="password-input-group input-group">
                                    <input class="form-control password-toggle" type="password" name="password" placeholder="Mật khẩu" value="yeuanh123" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <a href="" class="toggle-password" style="color: #dc3545;"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <h5 class="fw-bold">Vai Trò</h5>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-check">
                                        <input class="form-check-input" checked type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            Người quản kho
                                        </label>
                                    </div>
                                    <div class="form-check mt-2">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            Người bán hàng
                                        </label>
                                    </div>
                                </div>
                                <div class="col-sm-8 d-flex justify-content-end align-items-end">
                                    <a class="save-btn btn btn-danger" href="#">
                                        Lưu Lại Thay Đổi
                                    </a>
                                </div>
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
        <%@include file="styles/js/password-script.jsp" %>
        <%@include file="styles/js/admin-script.jsp" %>
    </body>
</html>
