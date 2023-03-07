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
                    <i class="fa fa-fw fa-dashboard"></i>
                    <span class="nav-link-text">Thống kê</span>
                </a>
            </li>

            <!-- 2 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Nhân viên">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseEmployee" data-parent="#MainAccordion">
                    <i class="fa fa-users" aria-hidden="true"></i>
                    <span class="nav-link-text">Nhân viên</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseEmployee">
                    <li>
                        <a href="controllerEmployee">Quản lý nhân viên</a>
                    </li>
                    <li>
                        <a href="register-admin.jsp">Tạo tài khoản</a>
                    </li>
                </ul>
            </li>
            
            <!-- 3 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Sản phầm">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseProduct" data-parent="#MainAccordion">
                    <i class="fa fa-shopping-basket" aria-hidden="true"></i>
                    <span class="nav-link-text">Sản phẩm</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseProduct">
                    <li>
                        <a href="ProductManagement">Quản lý sản phẩm</a>
                    </li>
                    <li>
                        <a href="#">Quản lý kho hàng</a>
                    </li>
                    <li>
                        <a href="#">Tra cứu lịch sử nhập hàng</a>
                    </li>
                </ul>
            </li>
            
            <!-- 4 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Đơn hàng">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseOrder" data-parent="#MainAccordion">
                    <i class="fa fa-truck" aria-hidden="true"></i>
                    <span class="nav-link-text">Đơn hàng</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseOrder">
                    <li>
                        <a href="ViewOrder">Quản lý đơn hàng</a>
                    </li>
                </ul>
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