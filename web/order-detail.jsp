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
        <title>Chi tiết đơn hàng</title>
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
                <a href="order-lookup.jsp">Tra đơn</a>
                <span>&nbsp;/&nbsp;</span>
                <a href="#">Chi tiết đơn hàng</a>
              </div>


               <div>
                    <h3 class="fw-bolder mb-4">CHI TIẾT ĐƠN HÀNG <span class="text-decoration-underline">#1001</span></h3>
                </div>


                <!--Product List-->
                <table class="table text-center fs-5">
                    <tbody>
                        <tr style="color: white; background-color: #fb1514;" class="row fw-bold">
                            <th class="col-5 border border-1 border-white">Tên sản phẩm</th>
                            <th class="col-1 border border-1 border-white">Mầu sắc</th>
                            <th class="col-1 border border-1 border-white">Số lượng</th>
                            <th class="col-2 border border-1 border-white">Chi tiết</th>
                            <th class="col-3 border border-1 border-white">Giá tiền</th>
                        </tr>
                        <tr class="row my-2 py-3">
                            <th class="col-5 fw-normal text-start">IPhone 14 Pro Max</th>
                            <th class="col-1 fw-normal">Tím</th>
                            <th class="col-1 fw-normal">2</th>
                            <th class="col-2 fw-normal text-decoration-underline">Xem chi tiết</th>
                            <th class="col-3 fw-normal text-end">59.980.000 VND</th>
                        </tr>
                        <tr class="row my-2 py-3">
                            <th class="col-5 fw-normal text-start">MacBook Pro 14" 2021 M1 Pro Ram 32GB</th>
                            <th class="col-1 fw-normal"></th>
                            <th class="col-1 fw-normal">1</th>
                            <th class="col-2 fw-normal text-decoration-underline">Xem chi tiết</th>
                            <th class="col-3 fw-normal text-end">55.990.000 VND</th>
                        </tr>
                        <tr class="row my-2 py-3">
                            <th class="col-5 fw-normal text-start">Samsung Galaxy Z Fold4 5G 256GB</th>
                            <th class="col-1 fw-normal">Xanh</th>
                            <th class="col-1 fw-normal">1</th>
                            <th class="col-2 fw-normal text-decoration-underline">Xem chi tiết</th>
                            <th class="col-3 fw-normal text-end">35.490.000 VND</th>
                        </tr>
                    </tbody>
                </table>

                <!---->
                <div class="border-top border-dark border-3 px-5 "></div>
                <div>
                    <div class="row py-3  fs-5">
                        <div class="col-md-6 text-start fw-bolder  fs-5">
                            <span>Phí vận chuyển</span>
                        </div>
                        <div class="col-md-6 text-end">
                            <span>40.000 VND</span>
                        </div>
                    </div>
                    <div style="color: white; background-color: #fb1514;" class="row py-4 fs-4 fw-bolder">
                        <div class="col-md-6 text-start">
                            <span>Tổng cộng</span>
                        </div>
                        <div class="col-md-6 text-end">
                            <span>151.500.000 VND</span>
                        </div>
                    </div>
                </div>

                <!---->
                <div class="mt-3">
                    <div class="row py-3  fs-5">
                        <div class="col-md-6 text-start fs-5 fst-italic text-decoration-underline">
                            <span>Thông tin vận chuyển</span>
                        </div>
                        <div class="col-md-6 text-end">
                            <button type="button" class="btn btn-secondary w-50 h-100 p-3 fs-4 fw-bolder">HỦY ĐƠN HÀNG</button>
                        </div>
                    </div>

                </div>
            
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
