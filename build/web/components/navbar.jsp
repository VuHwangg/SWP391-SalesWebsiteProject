<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="model.Account"%> 
<%@page import="model.Customer"%> 
<%@page import="jakarta.servlet.http.HttpSession" %>

<header>
  <!-- Mini banner -->
  <div class="mini-banner">
    <p>Đây là mini-banner chạy liên tục nhưng mà bgio chưa chạy được</p>
  </div>

  <!-- Navigation Bar -->
  <nav class="navbar navbar-expand-lg">
    <div class="container">
      <!-- Logo -->
      <a class="navbar-brand" href="home">Logo</a>

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
                           
                        %>

          <li class="nav-item">
            <a class="nav-link" href="filter?type=0">Điện thoại</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="filter?type=1">Laptop</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="cart.jsp">Giỏ hàng</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="ViewAllOrder">Tra đơn</a>
          </li>
          <li class="nav-item dropdown">
            <%if (cus == null){%>
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
