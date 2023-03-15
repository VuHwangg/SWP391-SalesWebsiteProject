<%@page import="java.util.ArrayList" %>
<%@page import="model.Account" %>
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
        <%
            ArrayList<Account> arr = (ArrayList<Account>) session.getAttribute("arrAcc");
            int mana = (int) session.getAttribute("mana");
            int empt = (int) session.getAttribute("empt");
            int total = mana + empt;
            String err = "";


        %>
        <div class="content-wrapper">
            <div class="container-fluid">

                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="controllerEmployee">Quản lý nhân viên</a>
                    </li> 
                    <li class="breadcrumb-item active">Chỉnh sửa</li>
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
                                            <h4 >Tổng số nhân viên</h4>
                                        </div>
                                        <span style="font-size: 17px">Số lượng: 
                                            <span class="text-danger" style="font-weight: 700; font-size: 18px">
                                                <%=total%>&nbsp;người
                                            </span>
                                        </span>
                                    </div>
                                    <div>
                                        <div class="icon-card-custom bg-danger text-white">
                                            <i class="fa fa-users"></i>
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
                                            <h4>Nhân viên quản kho</h4>
                                        </div>
                                        <span style="font-size: 17px">Số lượng: 
                                            <span class="text-danger" style="font-weight: 700; font-size: 18px">
                                                <%=mana%>&nbsp;người
                                            </span>
                                        </span>
                                    </div>
                                    <div>
                                        <div class="icon-card-custom bg-danger text-white">
                                            <i class="bi bi-box-seam-fill"></i>
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
                                            <h4>Nhân viên bán hàng</h4>
                                        </div>
                                        <span style="font-size: 17px">Số lượng: 
                                            <span class="text-danger" style="font-weight: 700; font-size: 18px">
                                                <%=empt%>&nbsp;người
                                            </span>
                                        </span>
                                    </div>
                                    <div>
                                        <div class="icon-card-custom bg-danger text-white">
                                            <i class="bi bi-cash-coin"></i>
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

                <% Account acc = (Account) session.getAttribute("acc");%>
                <!-- EDIT CARD-->
                <div class="card mb-3">

                    <!--DO NOT TOUCH ON THIS SHIT BELOW-->
                    <canvas id="myAreaChart" width="100%" height="30" hidden></canvas>
                    <canvas id="myBarChart" width="100" height="70" hidden></canvas>
                    <canvas id="myPieChart" width="100%" height="100" hidden></canvas>
                    <!--DO NOT TOUCH ON THIS SHIT ABOVE-->

                    <div class="card-header">
                        <i class="fa fa-pencil-square-o"></i>&nbsp;Chỉnh sửa nhân viên 
                        <!--Tên đăng nhập của nhân viên-->
                        <span class="text-danger" style="text-decoration: underline; font-size: 18px; font-weight: 700;">
                            @<%=acc.getUsername()%>
                        </span>
                    </div>
                    <div class="card-body p-3">
                        <form action="editEmpt" method="post" id="<%=acc.getUsername()%>">

                            <!--Họ và tên-->
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <label class="input-group-text" for="name">Họ và tên</label>
                                </div>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Họ và tên" value="<%=acc.getDisplayname()%>" required>
                            </div>

                            <!--Mật khẩu-->
                            <div class="mb-3">
                                <div class="password-input-group input-group">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="password">Mật khẩu</label>
                                    </div>
                                    <input type="password" class="form-control password-toggle" id="password" name="password" placeholder="Mật khẩu" value="<%=acc.getPassword()%>" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <a href="" class="toggle-password" style="color: #fff;"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group mb-3" hidden="">
                                <!--Thêm ảnh 1 ảnh-->
                                <input type="file" class="form-control" id="inputGroupFile01" accept="image/png, image/jpeg"  name="img" value ="">
                                <div class="input-group-append" >
                                    <label class="input-group-text" style="cursor: pointer" for="inputGroupFile01">Tải ảnh lên</label>
                                </div>
                            </div>
                            <div>
                                <h5 class="fw-bold">Vai Trò</h5>
                            </div>
                            <div class="row">
                                <%if (acc.getRole() == 2) {

                                %>
                                <div class="col-sm-4">
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" checked type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="2">
                                        <label class="form-check-label" for="flexRadioDefault1" >
                                            Quản lý kho hàng
                                        </label>
                                    </div>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="3">
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            Nhân viên bán hàng
                                        </label>
                                    </div>
                                </div>
                                <%} else {%>
                                <div class="col-sm-4">
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="2">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            Quản lý kho hàng
                                        </label>
                                    </div>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" checked type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="3">
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            Nhân viên bán hàng
                                        </label>
                                    </div>
                                </div>
                                <%}%>
                                <div class="col-sm-8 d-flex justify-content-end align-items-end">
                                    <input type="submit" class="save-btn btn btn-danger m-1" value="Lưu lại thay đổi">
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
    </body>
</html>
