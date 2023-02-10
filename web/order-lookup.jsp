<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <!--duy ngu-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Tra đơn</title>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        <main>
          <!--navigation bar-->
          <%@include file="components/navbar.jsp" %>

          <div class="py-5"></div>
            <div class="container min-vh-100">
              <!-- Breadcrumb -->
              <div class="breadcrumb" style="padding-top: 20px">
                <a href="index.jsp">Trang chủ</a>
                <span>&nbsp;/&nbsp;</span>
                <a href="#">Tra đơn</a>
              </div>

              <div class="row">
                  <div class="col-md-8 col-sm-7">
                      <h3 class="fw-bolder mb-4">TRA CỨU ĐƠN HÀNG</h3>
                  </div>
                  <div class="col-md-4 col-sm-5 mb-4">
                      <form action="">
                          <div class="input-group" style="border: 2px solid #dc3545; border-radius: 24px; overflow: hidden;">
                            <input class="form-control border-end-0 border" type="search" placeholder="Tìm kiếm theo mã đơn hàng">
                            <span class="input-group-append">
                                <button class="btn bg-danger" type="button" style="border-radius: 0">
                                    <i class="bi bi-search" style="color: white"></i>
                                </button>
                            </span>
                        </div>
                      </form>
                  </div>
              </div>

                <!--Order status-->
               <div>
                <div class="row text-center">
                    <div style="background-color: #fb1514; color: white;" class="col-md border border-2 border-dark p-0 fw-bolder">
                        <span>2</span>
                        <br>
                        <span>Tất cả</span>
                    </div>
                    <div class="col-md border border-2 p-0 fw-bold">
                        <span>1</span>
                        <br>
                        <span>Đang chuẩn bị</span>
                    </div>
                    <div class="col-md border border-2 p-0 fw-bold">
                        <span>0</span>
                        <br>
                        <span>Đang vận chuyển</span>
                    </div>
                    <div class="col-md border border-2 p-0 fw-bold">
                        <span>1</span>
                        <br>
                        <span>Đã nhận hàng</span>
                    </div>
                    <div class="col-md border border-2 p-0 fw-bold">
                        <span>0</span>
                        <br>
                        <span>Đơn đã bị hủy</span>
                    </div>

                </div>
            </div>

            <!--Order and detail-->
            <table class="table text-center mt-5">
                <tbody>
                    <tr style="color: white; background-color: #fb1514;" class="row fw-bold">
                        <th class="col border border-1 border-white">Mã đơn hàng</th>
                        <th class="col border border-1 border-white">Ngày đặt hàng</th>
                        <th class="col border border-1 border-white">Trạng thái</th>
                        <th class="col border border-1 border-white">Xem chi tiết</th>
                        <th class="col border border-1 border-white">Tổng tiền</th>
                    </tr>
                    <tr class="row">
                        <th class="col fw-normal">1001</th>
                        <th class="col fw-normal">17/01/2023</th>
                        <th class="col fw-normal">Đang chuẩn bị</th>
                        <th class="col fw-normal text-decoration-underline">
                            <a href="order-detail.jsp">Xem chi tiết</a>
                        </th>
                        <th class="col fw-normal text-end">151.500.000VND</th>
                    </tr>
                    <tr class="row">
                        <th class="col fw-normal">1002</th>
                        <th class="col fw-normal">19/01/2023</th>
                        <th class="col fw-normal">Đã nhận hàng</th>
                        <th class="col fw-normal text-decoration-underline">
                            <a href="order-detail.jsp">Xem chi tiết</a>
                        </th>
                        <th class="col fw-normal text-end">7.000.000VND</th>
                    </tr>

                </tbody>
            </table>
           </div>
          <!--footer-->
          <%@include file="components/footer.jsp" %>
    </main>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
      crossorigin="anonymous"
    ></script>
    <%@include file="styles/js/script.jsp" %>
  </body>
</html>
