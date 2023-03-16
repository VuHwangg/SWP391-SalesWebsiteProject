<%@page import="java.util.ArrayList" %>
<%@page import="model.Account" %>

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
                    <!-- <li class="breadcrumb-item">
                      <a href="#">Thống kê</a>
                    </li> -->
                    <li class="breadcrumb-item active">Quản lý nhân viên</li>
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

                <!-- DATA TABLE CARD-->
                <div class="card mb-3">

                    <!--DO NOT TOUCH ON THIS SHIT BELOW-->
                    <canvas id="myAreaChart" width="100%" height="30" hidden></canvas>
                    <canvas id="myBarChart" width="100" height="70" hidden></canvas>
                    <canvas id="myPieChart" width="100%" height="100" hidden></canvas>
                    <!--DO NOT TOUCH ON THIS SHIT ABOVE-->

                    <div class="card-header">
                        <span style="line-height: 1.8"><i class="fa fa-table"></i>&nbsp;Danh sách nhân viên</span>
                        <a href="register-admin.jsp" class="add-btn btn btn-danger text-white" style="float: right"><i class="fa fa-plus-circle"></i> Thêm nhân viên</a>
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
                                    <%for (int i = 0; i < arr.size(); i++) {%>
                                    <!--Nhập dữ liệu vào đây-->
                                    <tr style="border-bottom: 2px solid #dee2e6" >

                                        <td><%=(i + 1)%></td>
                                        <td><%=arr.get(i).getDisplayname()%></td>
                                        <td><%=arr.get(i).getUsername()%></td>
                                        <td>
                                            <div class="password-input-group multi-input input-group">
                                                <input class="form-control password-toggle" type="password" name="password" placeholder="Mật khẩu" value="<%=arr.get(i).getPassword()%>" required readonly>
                                                <div class="input-group-append">
                                                    <span class="input-group-text">
                                                        <a href="" class="toggle-password"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                                                    </span> 
                                                </div>
                                            </div>
                                        </td>
                                        <%if (arr.get(i).getRole() == 2)
                                                err = "Quản kho";
                                            else
                                                err = "Bán Hàng";
                                        %>
                                        <td><%=err%></td>
                                        <td>
                                            <div class="d-flex">
                                                <a class="btn btn-success w-100" href="editEmpt?id=<%=arr.get(i).getUsername()%>">Chỉnh sửa</a>&nbsp;
                                                <a class="btn btn-dark w-100" data-toggle="modal" data-target="#FireConfirmModal" href="">Nghỉ việc</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <!-- Fire Confirm Modal-->
                                <div class="modal fade" id="FireConfirmModal" tabindex="-1" role="dialog" aria-labelledby="FireConfirmModal" aria-hidden="true" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header bg-dark text-white">
                                                <h5 class="modal-title" id="FireConfirmModal">Bạn có chắc chắn muốn đuổi việc người này?</h5>
                                                <button class="close text-white" type="button" data-dismiss="modal" aria-label="Close">
                                                    <i class="bi bi-x-lg"></i>
                                                </button>
                                            </div>
                                            <div class="modal-body">Hành động này sẽ không được hoàn tác, vui lòng cân nhắc thật kỹ trước khi tiếp tục</div>
                                            <div class="modal-footer">
                                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Quay lại</button>
                                                <a class="btn btn-danger" href="cancelEmpt?id=<%=arr.get(i).getUsername()%>">Vẫn tiếp tục</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>

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
