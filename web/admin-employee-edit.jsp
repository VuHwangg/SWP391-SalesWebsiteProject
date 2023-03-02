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
                                             int empt =(int) session.getAttribute("empt");
                                             int total = mana + empt;
                                             String err ="";
                                         
                                                      
                    %>
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
                                    <i class="fa fa-users"></i>
                                </div>
                                <div>
                                    <span>Tổng số nhân viên</span>
                                </div>
                            </div>
                            <a class="card-footer text-white z-1">
                                <span class="mr-5"><%=total%></span>
                            </a>
                        </div>
                    </div>

                    <!-- CARD 2 -->
                    <div class="col-sm-4 mb-3">
                        <div class="card card-r1 text-white bg-primary o-hidden h-100">
                            <div class="card-body mr-5">
                                <div class="card-body-icon">
                                    <i class="fa fa-archive"></i>
                                </div>
                                <div>
                                    <span>Số quản kho</span>
                                </div>
                            </div>
                            <a class="card-footer text-white z-1">
                                <span class="mr-5"><%=mana%></span>
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
                                <span class="mr-5"><%=empt%></span>
                            </a>
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
                        <i class="fa fa-pencil-square-o"></i>&nbsp;Chỉnh sửa nhân viên <%=acc.getUsername()%>
                     
                    </div>
                    <div class="card-body p-3">
                        <form action="editEmpt" method="post" id="<%=acc.getUsername()%>">
                            <div class="mb-3">

                                <input type="text" class="form-control" id="name" name="name" placeholder="Họ và tên" value="<%=acc.getDisplayname()%>" required>

                            </div>
                         
                            <div class="mb-3">
                                <!--Mật khẩu-->
                                <div class="password-input-group input-group">
                                    <input class="form-control password-toggle" type="password" name="password" placeholder="Mật khẩu" value="<%=acc.getPassword()%>" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <a href="" class="toggle-password" style="color: #dc3545;"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <!--Thêm ảnh 1 ảnh-->
                                <input type="file" class="form-control" id="inputGroupFile01" accept="image/png, image/jpeg"  name="img">
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
                                            Người quản kho
                                        </label>
                                    </div>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="3">
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            Người bán hàng
                                        </label>
                                    </div>
                                </div>
                                <%}else{%>
                                 <div class="col-sm-4">
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="2">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            Người quản kho
                                        </label>
                                    </div>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" checked type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="3">
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            Người bán hàng
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
