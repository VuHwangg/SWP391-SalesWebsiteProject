<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/admin-head.jsp" %>
        <%@include file="styles/css/admin-style.jsp" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Tạo tài khoản cho nhân viên</title>

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
                        <a href="controllerEmployee">Quản lý nhân viên</a>
                    </li> 
                    <li class="breadcrumb-item active">Tạo tài khoản cho nhân viên</li>
                </ol>

                <!-- Icon Cards-->
                <div class="card mb-3">

                    <!--DO NOT TOUCH ON THIS SHIT BELOW-->
                    <canvas id="myAreaChart" width="100%" height="30" hidden></canvas>
                    <canvas id="myBarChart" width="100" height="70" hidden></canvas>
                    <canvas id="myPieChart" width="100%" height="100" hidden></canvas>
                    <!--DO NOT TOUCH ON THIS SHIT ABOVE-->

                    <div class="card-header">
                        <i class="fa fa-pencil-square-o"></i>&nbsp;Tạo tài khoản cho nhân viên 
                    </div>
                    <div class="card-body p-3">
                        <form action="SignupEmpt" method="post" id="admin-register-form" class="needs-validation" novalidate oninput='repass.setCustomValidity(repass.value != pass.value ? "Passwords do not match." : "")'>
                            <!--Tên đăng nhập-->
                            <div class="mb-3">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text input-label-box-1" for="username">Tên đăng nhập</label>
                                    </div>
                                    <input type="text" class="form-control" id="username" name="email" placeholder="Tên dùng để đăng nhập (có độ dài từ 3 đến 50 ký tự, không bao gồm dấu cách)" oninput="this.value = this.value.replace(/[^a-zA-Z0-9]/g, '').substring(0, 50)" minlength="3" maxlength="50" required>
                                    <div class="invalid-feedback" style="padding-left: 170px">
                                        Tên đăng nhập phải có tối thiểu 3 ký tự, tối đa 50 ký tự, và không chứa dấu cách 
                                    </div>
                                </div>
                            </div>
                            <!--Họ và tên-->
                            <div class="mb-3">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text input-label-box-1" for="name">Họ và tên</label>
                                    </div>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Họ và tên đầy đủ của nhân viên (có độ dài từ 3 đến 100 ký tự)" minlength="3" maxlength="100" required>
                                    <div class="invalid-feedback" style="padding-left: 170px">
                                        Họ và tên phải có tối thiểu 3 ký tự, tối đa 100 ký tự
                                    </div>
                                </div>
                            </div>
                            <div class="input-group mb-3" hidden>
                                <!--Thêm ảnh 1 ảnh-->
                                <input type="file" class="form-control" id="img" accept="image/png, image/jpeg"  name="img" value ="">
                                <div class="input-group-append" >
                                    <label class="input-group-text input-label-box-1" style="cursor: pointer" for="img">Tải ảnh lên</label>
                                </div>
                            </div>
                            <!--Mật khẩu-->
                            <div class="mb-3">
                                <div class="password-input-group input-group">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text input-label-box-1" for="password">Mật khẩu</label>
                                    </div>
                                    <input type="password" class="form-control password-toggle" id="password" name="pass" placeholder="Mật khẩu (có độ dài từ 5 đến 30 ký tự)" minlength="5" maxlength="30" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-danger">
                                            <a href="" class="toggle-password" style="color: #fff;"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                                        </span>
                                    </div>
                                    <div class="invalid-feedback" style="padding-left: 170px">
                                        Mật khẩu phải có tối thiểu 5 ký tự, tối đa 30 ký tự 
                                    </div>
                                </div>
                            </div>
                            <!--Nhập lại mật khẩu-->
                            <div class="mb-3">
                                <div class="password-input-group input-group">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text input-label-box-1" for="re-password">Nhập lại mật khẩu</label>
                                    </div>
                                    <input type="password" class="form-control password-toggle" id="re-password" name="repass" placeholder="Mật khẩu (có độ dài từ 5 đến 30 ký tự)" minlength="5" maxlength="30" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-danger">
                                            <a href="" class="toggle-password" style="color: #fff;"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                                        </span>
                                    </div>
                                    <div class="invalid-feedback" style="padding-left: 170px">
                                        Mật khẩu chưa khớp
                                    </div>
                                </div>
                            </div>

                            <div>
                                <h5 class="fw-bold">Vai Trò</h5>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" checked type="radio" name="role" id="flexRadioDefault1" value="2">
                                        <label class="form-check-label" for="flexRadioDefault1" >
                                            Quản lý kho hàng
                                        </label>
                                    </div>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="radio" name="role" id="flexRadioDefault2" value="3">
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            Nhân viên bán hàng
                                        </label>
                                    </div>
                                </div>
                                <div class="col-sm-8 d-flex justify-content-end align-items-end">
                                    <input type="submit" class="save-btn btn btn-danger m-1" value="Đăng ký">
                                    <a class="save-btn btn btn-secondary text-white m-1" onclick="history.back(-1)">
                                        Quay Lại
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
        <%@include file="styles/js/admin-validate-script.jsp" %>
        <%@include file="styles/js/popup-register-admin.jsp" %>

    </body>
</html>
