<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Đăng nhập</title>
    </head>
    <body>
    <!-- Section: Design Block -->
    <section
      class="text-center h-100 w-100 d-inline-block"
      style="max-height: 1000px"
    >
      <!-- Background image -->
      <div
        class="p-5 bg-image"
        style="background-color: #fb1514; height: 350px"
      >
        <div class="d-flex justify-content-start align-items-start">
          <a
            type="button"
            style="margin-top: -2rem"
            class="btn btn-outline-light"
            href="index.html"
          >
            <i class="bi bi-house me-1"></i>Trang chủ
          </a>
        </div>
        <h1 style="color: white">FTECH</h1>
        <h1 style="color: white">
          Store chuyên cung cấp đồ công nghệ hàng đầu Việt Nam
        </h1>
      </div>
      <!-- Background image -->

      <div class="container-fluid h-100 d-inline-block">
        <div class="row">
          <!--Col-2 Banner-1-->
          <div class="col-md-2 mx-0" style="background-color: #e3e2e5">
            <h3>Banner</h3>
          </div>

          <!--Col-6-->
          <div class="col-md-8" style="padding: 0">
            <div
              class="card rounded-3 shadow-5-strong"
              style="
                margin-top: -100px;
                background: hsla(0, 0%, 100%, 0.8);
                backdrop-filter: blur(30px);
              "
            >
              <div class="card-body py-5 px-md-5">
                <div class="row d-flex justify-content-center">
                  <div class="col-lg-8">
                    <h1 class="fw-bold mb-2" style="color: #fb1514">
                      ĐĂNG NHẬP
                    </h1>
                    <p class="lead mb-3" style="color: #fb1514">
                      Chọn tài khoản bạn muốn đăng nhập vao FTECH Store
                    </p>

                    <!--Login with gmail-->
                    <div>
                      <button
                        type="button"
                        class="btn btn-outline-dark mb-2 w-100"
                      >
                        <i class="bi bi-google text-danger me-1"></i>
                        <p class="d-inline h5">
                          <strong>Sử dụng tài khoản Google </strong>
                        </p>
                      </button>

                      <button
                        type="button"
                        class="btn btn-outline-dark mb-2 w-100"
                      >
                        <i class="bi bi-facebook text-primary me-1"></i>
                        <p class="d-inline h5">
                          <strong>Sử dụng tài khoản Facebook </strong>
                        </p>
                      </button>
                    </div>
                    <div class="border-top border-dark border-3 my-3"></div>
                    <!--Login with account password-->
                    <form>
                      <p class="lead mb-3" style="color: #fb1514">
                        Phần đăng nhập chỉ dành cho Admin
                      </p>

                      <div class="mb-3">
                        <input
                          type="email"
                          class="form-control"
                          id="exampleInputEmail1"
                          aria-describedby="emailHelp"
                          placeholder="Username"
                        />
                      </div>
                      <div class="mb-3">
                        <input
                          type="password"
                          class="form-control"
                          id="exampleInputPassword1"
                          placeholder="Password"
                        />
                      </div>

                      <button
                        type="submit"
                        class="btn btn-outline-danger w-100"
                      >
                        Login
                      </button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!--Col-3 Banner-2-->
          <div class="col-md-2 mx-0" style="background-color: #e3e2e5">
            <h3>Banner</h3>
          </div>
        </div>
      </div>
    </section>

    <!--JS bootstrap 5 include -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
      integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
      integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
