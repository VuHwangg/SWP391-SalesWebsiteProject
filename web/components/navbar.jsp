<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="model.Account"%> 
<%@page import="model.Customer"%> 
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page import="java.util.Map" %>
<%@page import="model.Cart" %>


<header>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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
            <a class="navbar-brand logo" href="home">Awns's Store</a>

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
                                     String link ="";
                                     if (cus == null){
                                     link = "order-lookup-guest.jsp";
                        }else{
                                    link =  "ViewAllOrder";
                        }
                           
                    %>

                    <li class="nav-item">
                        <a class="nav-link" href="filter?type=0">Điện thoại</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="filter?type=1">Laptop</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cart">Giỏ hàng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href=<%=link%>>Tra đơn</a>
                    </li>
                    <li class="nav-item dropdown">
                        <%if (cus == null||cus.isStatus()==false){%>
                        <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                            >
                            Khách
                        </a>
                        <%}else{%>
                        <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                            >
                            <%= cus.getCustomerName()%>
                        </a>
                        <%}%>
                        <ul class="dropdown-menu">
                            <!--Trước khi login-->
                            <% if (session.getAttribute("acc") == null) {%>
                            <li>
                                <a class="dropdown-item" href="login-user.jsp">Đăng nhập</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="login-admin.jsp">Đăng nhập cho nhân viên</a>
                            </li>
                            <%} else { %>
                            <!--sau khi login user account-->
                            <li>
                                <a class="dropdown-item" href="profile.jsp"
                                   >Thông tin cá nhân</a
                                >
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
