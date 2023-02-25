<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="model.Account"%> 
<%@page import="model.Customer"%> 
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page import="java.util.Map" %>
<%@page import="model.Cart" %>


<header>
    <!-- Mini banner -->
    <div class="mini-banner">
        <div class="banner-text">
            <span>Đặt trước Galaxy S23 Series - Ưu đãi khủng đến 10 triệu</span>
        </div>
    </div>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <!-- Logo -->
            <a class="navbar-brand logo button-92" role="button" href="home">Awns's Store</a>
            
            <a class="navbar-brand logo mobile-logo" role="button" href="home">Awns's Store</a>

            <!-- Search box -->
            <form
                class="d-flex search-box"
                role="search"
                action="search"
                method="GET"
                >
                <input
                    class="form-control me-2"
                    type="search"
                    placeholder="Bạn muốn tìm gì ?"
                    aria-label="Search"
                    name="txtSearch"
                    />
                <input type="hidden" name="sort" value="none" />
            </form>

            <!-- Menu for responsive -->
            <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
                >
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar elements -->

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <%

                        Account acc = (Account) session.getAttribute("acc");
                        Customer cus = (Customer) session.getAttribute("cust");

                        //                           // chuyen sang trang admin
                        //                           if ((int)session.getAttribute("role") == 1){
                        //                               request.getRequestDispatcher("#").forward(request, response);
                        //                            }
                        //                           // chuyen sang trang empt
                        //                           if ((int)session.getAttribute("role") == 2){
                        //                               request.getRequestDispatcher("#").forward(request, response);
                        //                            }
                        //                           // chuyen sang trang mana
                        //                            if ((int)session.getAttribute("role") == 3){
                        //                               request.getRequestDispatcher("#").forward(request, response);
                        //                            }
                        //                            if ((int)session.getAttribute("role") == 4 && (int)session.getAttribute("role") ==0){
                        //                           
                        String link = "";
                        if (cus == null) {
                            link = "order-lookup-guest.jsp";
                        } else {
                            link = "ViewAllOrder";
                        }
                        String mess = "Khách";
                        if (session.getAttribute("acc") != null)
                            mess = "Hồ sơ";
                    %>

                    <li class="nav-item">
                        <a class="nav-link" href="filter?type=0">
                            <i class="bi bi-phone-landscape"></i>
                            Điện thoại
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="filter?type=1">
                            <i class="bi bi-laptop"></i>
                            Laptop
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="order-lookup-guest.jsp">
                            <i class="bi bi-truck"></i>
                            Tra đơn
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link position-relative" href="cart">
                            <i class="bi bi-cart3"></i>
                            Giỏ hàng
                            <!--Số lượng sản phẩm trong giỏ hàng-->

                            <c:if test="${sessionScope.carts == null}" var="condition">

                            </c:if>
                            <c:if test="${!condition}">
                                <span class="mini-quantity position-absolute badge rounded-pill">
                                    ${sessionScope.carts.size()}
                                </span>
                            </c:if>

                        </a>
                    </li>

                    <li class="nav-item dropdown">
                        <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                            >
                            <i class="bi bi-person"></i>
                            <%=mess%>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <%if (cus == null || cus.isStatus() == false) {%>

                                <%} else {%>
                                <div class="dropdown-item">
                                    <i class="bi bi-person-circle"></i>
                                    <span><%= cus.getCustomerName()%></span>
                                </div>
                                <%}%>
                            </li>
                            <!--Trước khi login-->
                            <% if (session.getAttribute("acc") == null) {%>
                            <li>
                                <a class="dropdown-item" href="login-user.jsp">Đăng nhập</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="login-admin.jsp">Đăng nhập cho nhân viên</a>
                            </li>
                            <%} else {%>
                            <!--sau khi login user account-->
                            <li>
                                <a class="dropdown-item" href="profile.jsp">
                                    Thông tin cá nhân
                                </a>
                            </li>

                            <li>
                                <a class="dropdown-item" href="<%=link%>">
                                    Đơn hàng của tôi
                                </a>
                            </li>

                            <li>
                                <a class="dropdown-item" href="Logout">Đăng xuất</a>
                            </li>
                            <% }%>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
