<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Đăng ký</title>
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
        <div class="d-flex justify-content-end align-items-start">
          <a
            type="button"
            style="margin-top: -2rem"
            class="btn btn-outline-light"
            href="index.html"
          ></i>Bỏ qua bước này
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
                    <h1 class="fw-bold mb-2" style="color: #fb1514">ĐĂNG KÝ</h1>
                    <div class="border-top border-dark border-3 my-3"></div>

                    <!--Login with account password-->
                    <form action="SignupUser"  method="post">
                      <p class="lead mb-3" style="color: #fb1514">
                        Bạn vui lòng hoàn thiện thêm thông tin bên dưới
                      </p>

                      <div class="mb-3">
                        <input name = "name"
                          type="text"
                          class="form-control"
                          placeholder="Họ và tên"
                        />
                      </div>

                      <div class="mb-3">
                          <input name="phone"
                          type="text"
                          class="form-control"
                          placeholder="Số điện thoại"
                        />
                      </div>

                      <div class="mb-3">
                          <input name="place"
                          type="text"
                          class="form-control"
                          placeholder="Địa chỉ nhà"
                        />
                      </div>

                      <button
                        type="submit"
                        class="btn btn-outline-danger w-100"
                      >
                        Hoàn tất
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
