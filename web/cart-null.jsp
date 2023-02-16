<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Giỏ hàng</title>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        <main>
          <!--navigation bar-->
          <%@include file="components/navbar.jsp" %>

          <div class="py-5"></div>
            <div class="container min-vh-100">
              <!-- Breadcrumb -->
              <div class="breadcrumb" style="padding-top: 20px">
                <a href="home">Trang chủ</a>
                <span>&nbsp;/&nbsp;</span>
                <a href="#">Giỏ hàng</a>
              </div>

              <div>
                <h3>Có 4 sản phẩm trong giỏ hàng</h3>
                <div class="border-top border-dark border-3 my-3"></div>
              </div>

              <!--Main info-->
              <div class="row mt-3 w-100 mx-auto">
                <!--Products in cart-->
                <div class="col-md-9 border border-2 rounded-1">
                 <div class="row table-responsive">
                  <table class="table w-100">
                      <tr>
                        <!--Image-->
                        <th class="p-0 py-2" style="width: 120px;">
                            <div class="d-flex justify-content-center" style="width: 100px; height: 100px; margin-left: 12px;">
                            <img
                              class="align-items-center"
                              style="width: 100%; object-fit: contain;"
                              src="https://dummyimage.com/400x400/ff0000/fff"
                            />
                          </div>
                        </th>

                        <!--Name-->
                        <td style="padding-left: 10px; vertical-align: middle">
                            <h5 class="fst-normal" style="height: 100%; margin: auto">Iphone 14 Pro Max 128GB</h5>
                        </td>
                        
                        <!--Quantity Delete-->
                        <td style="vertical-align: middle; width: 150px">
                          <div class="input-group quantity-input quantity-input-cart">
                            <button class="btn btn-danger minus-btn" type="button">-</button>
                            <input type="number" class="form-control quantity text-center" value="1" min="1" max="99" />
                            <button class="btn btn-danger plus-btn" type="button">+</button>
                          </div>
                        </td>
                        
                         <!--Delete-->
                        <td style="vertical-align: middle; text-align: center">
                            <a href="#" style="font-size: 18px; text-decoration: none;">
                                <i class="bi bi-trash3-fill"></i>Xóa
                            </a>
                        </td>

                        <!--Price-->
                        <td style="vertical-align: middle;">
                          <div class="d-flex flex-column align-items-center">
                            <span class="fw-bold" style="color: #fb1514; margin: 0">
                              59.980.000.&#8363;
                            </span>
                            <span class="fw-light text-decoration-line-through">
                              67.980.000&#8363;
                            </span>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <!--Image-->
                        <th class="p-0 py-2" style="width: 120px;">
                            <div class="d-flex justify-content-center" style="width: 100px; height: 100px; margin-left: 12px;">
                            <img
                              class="align-items-center"
                              style="width: 100%; object-fit: contain;"
                              src="https://dummyimage.com/400x400/ff0000/fff"
                            />
                          </div>
                        </th>

                        <!--Name-->
                        <td style="padding-left: 10px; vertical-align: middle">
                            <h5 class="fst-normal" style="height: 100%; margin: auto">Iphone 14 Pro Max 128GB</h5>
                        </td>
                        
                        <!--Quantity Delete-->
                        <td style="vertical-align: middle; width: 150px">
                          <div class="input-group quantity-input quantity-input-cart">
                            <button class="btn btn-danger minus-btn" type="button">-</button>
                            <input type="number" class="form-control quantity text-center" value="1" min="1" max="99" />
                            <button class="btn btn-danger plus-btn" type="button">+</button>
                          </div>
                        </td>
                        
                         <!--Delete-->
                        <td style="vertical-align: middle; text-align: center">
                            <a href="#" style="font-size: 18px; text-decoration: none;">
                                <i class="bi bi-trash3-fill"></i>Xóa
                            </a>
                        </td>

                        <!--Price-->
                        <td style="vertical-align: middle;">
                          <div class="d-flex flex-column align-items-center">
                            <span class="fw-bold" style="color: #fb1514; margin: 0">
                              59.980.000.&#8363;
                            </span>
                            <span class="fw-light text-decoration-line-through">
                              67.980.000&#8363;
                            </span>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <!--Image-->
                        <th class="p-0 py-2" style="width: 120px;">
                            <div class="d-flex justify-content-center" style="width: 100px; height: 100px; margin-left: 12px;">
                            <img
                              class="align-items-center"
                              style="width: 100%; object-fit: contain;"
                              src="https://dummyimage.com/400x400/ff0000/fff"
                            />
                          </div>
                        </th>

                        <!--Name-->
                        <td style="padding-left: 10px; vertical-align: middle">
                            <h5 class="fst-normal" style="height: 100%; margin: auto">Iphone 14 Pro Max 128GB</h5>
                        </td>
                        
                        <!--Quantity Delete-->
                        <td style="vertical-align: middle; width: 150px">
                          <div class="input-group quantity-input quantity-input-cart">
                            <button class="btn btn-danger minus-btn" type="button">-</button>
                            <input type="number" class="form-control quantity text-center" value="1" min="1" max="99" />
                            <button class="btn btn-danger plus-btn" type="button">+</button>
                          </div>
                        </td>
                        
                         <!--Delete-->
                        <td style="vertical-align: middle; text-align: center">
                            <a href="#" style="font-size: 18px; text-decoration: none;">
                                <i class="bi bi-trash3-fill"></i>Xóa
                            </a>
                        </td>

                        <!--Price-->
                        <td style="vertical-align: middle;">
                          <div class="d-flex flex-column align-items-center">
                            <span class="fw-bold" style="color: #fb1514; margin: 0">
                              59.980.000.&#8363;
                            </span>
                            <span class="fw-light text-decoration-line-through">
                              67.980.000&#8363;
                            </span>
                          </div>
                        </td>
                      </tr>
                  </table>
                 </div>
                  <div class="d-flex justify-content-between mb-3">
                    <a class="btn btn-outline-danger" href="#">
                      Tiếp tục mua hàng
                    </a>
                    <a class="btn btn-outline-danger" href="#">
                      Xóa hết
                    </a>
                  </div>
                </div>

                <!--Payment-->
                <div class="col-md-3">
                  <div class="d-flex justify-content-between mb-3">
                    <span>Tổng tiền:</span>
                    <span>172.960.000&#8363;</span>
                  </div>

                  <div class="d-flex justify-content-between mb-3">
                    <span>Giảm:</span>
                    <span>-172.960.000&#8363;</span>
                  </div>
                  <div>
                    <span class="fw-bold">Cần thanh toán:</span>
                  </div>
                  <div class="d-flex justify-content-center">
                    <span class="fs-4 fw-bolder" style="color: #fb1514"
                      >151.460.000&#8363;</span
                    >
                  </div>
                  <div class="border-top border-dark border-3 mb-3"></div>
                  <div class="d-flex justify-content-center">
                    <a class="btn btn-danger w-100" href="payment.jsp">
                        <b> Đi tới thanh toán</b>
                    </a>
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
