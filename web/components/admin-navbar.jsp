<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page import="model.Account"%>
<!-- NAVIGATION BAR-->
<nav class="navbar navbar-expand-lg navbar-dark bg-danger fixed-top" id="mainNav">

    <!-- LOGO -->
    <a class="navbar-brand" href="dashmap">Anwn's Store Management</a>

    <!-- MENU BUTTON FOR RESPONSIVE -->
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- NAVBAR RESPONSIVE -->
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <%Account acc = (Account) session.getAttribute("acc1");%>
        <!--  LEFT SIDE NAVIGATION BAR ============================================================================= -->
        <ul class="navbar-nav navbar-sidenav" id="MainAccordion">

            <!-- 1 -->
            <%if (acc.getRole() == 1) {%>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Thống kê">
                <a class="nav-link" href="dashmap">
                    <i class="fa fa-fw fa-dashboard" style="font-size: 20px"></i>&nbsp;
                    <span class="nav-link-text">Thống kê</span>
                </a>
            </li>

            <!-- 2 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Nhân viên">
                <a class="nav-link" href="controllerEmployee">
                    <i class="fa fa-users" style="font-size: 20px"></i>&nbsp;
                    <span class="nav-link-text">Nhân viên</span>
                </a>
            </li>
            <%}
                if (acc.getRole() == 2) {
            %>
            <!-- 3 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Sản phẩm đang bán">
                <a class="nav-link" href="ProductManagement">
                    <i class="bi bi-bag-check-fill" style="font-size: 20px"></i>&nbsp;
                    <span class="nav-link-text">Sản phẩm đang bán</span>
                </a>
            </li>

            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Sản phẩm đang bán">
                <a class="nav-link" href="ProductManagmentDisable">
                    <i class="bi bi-bag-x-fill" style="font-size: 20px"></i>&nbsp;
                    <span class="nav-link-text">Sản phẩm chưa bán</span>
                </a>
            </li>
            <%}
                if (acc.getRole() == 3) {

            %>
            <!-- 5 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Kho hàng">
                <a class="nav-link" href="WarehouseManagment">
                    <i class="fa fa-cubes" style="font-size: 20px"></i>&nbsp;
                    <span class="nav-link-text">Kho hàng</span>
                </a>
            </li>
            <%}

                if (acc.getRole() == 2) {
            %>
            <!-- 6 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Đơn hàng">
                <a class="nav-link" href="ViewOrder">
                    <i class="fa fa-truck" style="font-size: 20px"></i>&nbsp;
                    <span class="nav-link-text">Đơn hàng</span>
                </a>
            </li>
            <%}
                if (acc.getRole() == 3 || acc.getRole() == 2) {

            %>
            <!-- 7 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Lịch sử nhập hàng">
                <a class="nav-link" href="importhistory">
                    <i class="fa fa-history" style="font-size: 20px"></i>&nbsp;
                    <span class="nav-link-text">Lịch sử nhập hàng</span>
                </a>
            </li>
            <%}

                if (acc.getRole() == 2) {
            %>
            <!-- 8 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Đánh giá sản phẩm">
                <a class="nav-link" href="admin-feedback-list.jsp">
                    <i class="bi bi-chat-square-dots-fill" style="font-size: 20px"></i>&nbsp;
                    <span class="nav-link-text">Đánh giá sản phẩm</span>
                </a>
            </li>
            <%}
                if (acc.getRole() == 1) {%>
            <!-- 9 -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tạo tài khoản cho nhân viên">
                <a class="nav-link" href="register-admin.jsp">
                    <i class="fa fa-sign-in" style="font-size: 20px"></i>&nbsp;
                    <span class="nav-link-text">Tạo tài khoản nhân viên</span>
                </a>
            </li>
            <%}%>
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
            <% acc = (Account) session.getAttribute("acc1");%>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle mr-lg-2" href="#" data-toggle="dropdown" style="font-size: 18px; font-weight: 700">
                    <%=acc.getDisplayname()%>
                    <span class="indicator text-primary d-none d-lg-block">
                        <i class="fa fa-fw"></i>
                    </span>
                </a>
                <div class="dropdown-menu">
                    <div class="dropdown-item text-center">
                        <span>
                            Vai trò: 
                            <%if (acc.getRole() == 1) {%>
                            <strong class="text-danger">Admin</strong>
                            <%}
                                if (acc.getRole() == 2) {
                            %>
                            <strong class="text-danger">Bán Hàng</strong>
                            <%}
                                if (acc.getRole() == 3) {
                            %>
                            <strong class="text-danger">Quản Kho</strong>
                            <%}
                            %>

                        </span>
                    </div>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item nav-link text-dark text-center" href="logoutEmpt">
                        <i class="fa fa-fw fa-sign-out"></i>&nbsp;Đăng xuất
                    </a>
                </div>
            </li>

            <!-- LOGOUT BUTTON ============================================================================= -->
            <li class="nav-item">
                <!--                <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                                  <i class="fa fa-fw fa-sign-out"></i>Đăng xuất
                                </a>-->

            </li>
        </ul>
    </div>
</nav>
<!-- NAVIGATION BAR END-->