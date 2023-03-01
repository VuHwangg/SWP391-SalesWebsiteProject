
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <!-- <li class="breadcrumb-item">
                      <a href="#">Thống kê</a>
                    </li> -->
                    <li class="breadcrumb-item active">Quản lý nhân viên</li>
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

                <!-- DATA TABLE CARD-->
                <div class="card mb-3">
                    
                    <!--DO NOT TOUCH ON THIS SHIT BELOW-->
                    <canvas id="myAreaChart" width="100%" height="30" hidden></canvas>
                    <canvas id="myBarChart" width="100" height="70" hidden></canvas>
                    <canvas id="myPieChart" width="100%" height="100" hidden></canvas>
                    <!--DO NOT TOUCH ON THIS SHIT ABOVE-->
                    
                    <div class="card-header">
                        <span style="line-height: 1.8"><i class="fa fa-table"></i>&nbsp;Danh sách nhân viên</span>
                        <a href="admin-employee-edit.jsp" class="add-btn btn btn-danger text-white" style="float: right"><i class="fa fa-plus-circle"></i> Thêm nhân viên</a>
                    </div>
                    <div class="card-body p-3">
                        <div class="table-responsive">
                            <table class="table-emp table text-center border-white" border="1">
                                <tbody>
                                    <tr class="fw-bold bg-danger text-white">
                                        <th>Mã số</th>
                                        <th>Họ tên</th>
                                        <th>Tài khoản</th>
                                        <th>Mật khẩu</th>
                                        <th>Vai trò</th>
                                        <th>Quản lý</th>
                                    </tr>

                                    <!--Nhập dữ liệu vào đây-->
                                    <tr style="border-bottom: 2px solid #dee2e6" >
                                        <td>1</td>
                                        <td>Chu Thành Duy</td>
                                        <td>chuthanhduy</td>
                                        <td>
                                            <div class="password-input-group multi-input input-group">
                                                <input class="form-control password-toggle" type="password" name="password" placeholder="Mật khẩu" value="yeuanh123" required readonly>
                                                <div class="input-group-append">
                                                    <span class="input-group-text">
                                                        <a href="" class="toggle-password"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                                                    </span> 
                                                </div>
                                            </div>
                                        </td>
                                        <td>Quản kho</td>
                                        <td>
                                            <div>
                                                <a href="admin-employee-edit.jsp">Chỉnh sửa</a>&nbsp;<button>Nghỉ việc</button>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr style="border-bottom: 2px solid #dee2e6" >
                                        <td>2</td>
                                        <td>Chu Thành Duy</td>
                                        <td>chuthanhduy</td>
                                        <td>
                                            <div class="password-input-group multi-input input-group">
                                                <input class="form-control password-toggle" type="password" name="password" placeholder="Mật khẩu" value="yeuanh123" required readonly>
                                                <div class="input-group-append">
                                                    <span class="input-group-text">
                                                        <a href="" class="toggle-password"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                                                    </span> 
                                                </div>
                                            </div>
                                        </td>
                                        <td>Bán hàng</td>
                                        <td>
                                            <div>
                                                <a href="admin-employee-edit.jsp">Chỉnh sửa</a>&nbsp;<button>Nghỉ việc</button>
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
        <%@include file="styles/js/password-script.jsp" %>
        <%@include file="styles/js/admin-script.jsp" %>
    </body>
</html>
