<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page import="model.Account"%>
<!-- NAVIGATION BAR-->
<nav class="navbar navbar-expand-lg navbar-dark bg-danger fixed-top" id="mainNav">

    <!-- LOGO -->
    <a class="navbar-brand" href="admin-dashmap.jsp">Anwn's Store Management</a>

    <!-- MENU BUTTON FOR RESPONSIVE -->
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- NAVBAR RESPONSIVE -->
    <div class="collapse navbar-collapse" id="navbarResponsive">

        <!--  LEFT SIDE NAVIGATION BAR ============================================================================= -->
        <ul class="navbar-nav navbar-sidenav" id="MainAccordion">

            <!-- 1 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Thống kê">
                <a class="nav-link" href="admin-dashmap.jsp">
                    <i class="fa fa-fw fa-dashboard"></i>&nbsp;
                    <span class="nav-link-text">Thống kê</span>
                </a>
            </li>
            
            <!-- 2 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Nhân viên">
                <a class="nav-link" href="controllerEmployee">
                    <i class="fa fa-users"></i>&nbsp;
                    <span class="nav-link-text">Nhân viên</span>
                </a>
            </li>
            
            <!-- 3 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Sản phẩm">
                <a class="nav-link" href="ProductManagement">
                    <i class="fa fa-shopping-basket"></i>&nbsp;
                    <span class="nav-link-text">Sản phẩm</span>
                </a>
            </li>
            
            <!-- 4 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Kho hàng">
                <a class="nav-link" href="admin-warehouse-management.jsp">
                    <i class="fa fa-dropbox"></i>&nbsp;
                    <span class="nav-link-text">Kho hàng</span>
                </a>
            </li>
            
            <!-- 5 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Đơn hàng">
                <a class="nav-link" href="ViewOrder">
                    <i class="fa fa-truck"></i>&nbsp;
                    <span class="nav-link-text">Đơn hàng</span>
                </a>
            </li>
            
            <!-- 6 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Lịch sử nhập hàng">
                <a class="nav-link" href="admin-history-list.jsp">
                    <i class="fa fa-history"></i>&nbsp;
                    <span class="nav-link-text">Lịch sử nhập hàng</span>
                </a>
            </li>
            
            <!-- 7 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tạo tài khoản cho nhân viên">
                <a class="nav-link" href="register-admin.jsp">
                    <i class="fa fa-sign-in"></i>&nbsp;
                    <span class="nav-link-text">Tạo tài khoản nhân viên</span>
                </a>
            </li>
        </ul>
        <ul class="navbar-nav sidenav-toggler">
            <li class="nav-item">
                <a class="nav-link text-center" id="sidenavToggler">
                    <i class="fa fa-fw fa-angle-left"></i>
                </a>
            </li>
        </ul>


        <!--  UPPER NAVIGATION BAR ============================================================================= -->
        <ul class="navbar-nav ml-auto">
            <!-- LOGOUT BUTTON ============================================================================= -->
            <li class="nav-item">
                <!--                <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                                  <i class="fa fa-fw fa-sign-out"></i>Đăng xuất
                                </a>-->
                <a class="nav-link" href="logoutEmpt">
                    <i class="fa fa-fw fa-sign-out"></i>Đăng xuất
                </a>
            </li>
        </ul>
    </div>
</nav>
<!-- NAVIGATION BAR END-->