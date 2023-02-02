<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header>
    <!-- Mini banner -->
    <div class="mini-banner">
      <p>Đây là mini-banner chạy liên tục nhưng mà bgio chưa chạy được</p>
    </div>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg">
      <div class="container">
        <!-- Logo -->
        <a class="navbar-brand" href="index.jsp">Logo</a>

        <!-- Search box -->
        <form class="d-flex search-box" role="search">
          <input
            class="form-control me-2"
            type="search"
            placeholder="Bạn muốn tìm gì ?"
            aria-label="Search"
          />
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
            <li class="nav-item">
              <a class="nav-link" href="list-phone.jsp">Điện thoại</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="list-laptop.jsp">Laptop</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="cart.jsp">Giỏ hàng</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="order-info.jsp">Tra đơn</a>
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Tài khoản
              </a>
              <ul class="dropdown-menu">
                  <!--Trước khi login-->
                <li>
                  <a class="dropdown-item" href="login-user.jsp">Đăng nhập</a>
                </li>
                <li>
                  <a class="dropdown-item" href="login-admin.jsp">Đăng nhập cho admin</a>
                </li>
                <!--sau khi login-->
                <li>
                  <a class="dropdown-item" href="login-admin.jsp">Thông tin cá nhân</a>
                </li>
                <li>
                  <a class="dropdown-item" href="login-user.jsp">Đăng xuất</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
</header>