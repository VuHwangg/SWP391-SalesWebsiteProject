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
        <title>Trang chủ</title>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        <main>
          <!--navigation bar-->
          <%@include file="components/navbar.jsp" %>

          <div class="py-5"></div>
            <div class="container min-vh-100">
              <div>
                <p class="fw-bold mb-3" style="color: black">Trang chủ / Giỏ hàng</p>
              </div>

              <div>
                <h3>Có 4 sản phẩm trong giỏ hàng</h3>
                <div class="border-top border-dark border-3 my-3"></div>
              </div>

              <!--Main info-->
              <div class="row mt-3 w-100 mx-auto">
                <!--Products in cart-->
                <div class="col-md-9 border border-2 rounded-1">
                  <table class="table w-100">
                    <tbody>
                      <tr>
                        <!--Image-->
                        <th class="p-0 py-2">
                          <div class="d-flex justify-content-center">
                            <img
                              class="align-items-center"
                              width="100"
                              src="https://dummyimage.com/400x400/ff0000/fff"
                            />
                          </div>
                        </th>

                        <!--Name and color option-->
                        <td>
                          <span class="fst-normal">Iphone 14 Pro Max 128GB</span>
                          <br />
                          <select
                            class="form-select form-select-sm w-75 mt-3"
                            aria-label=".form-select-sm example"
                          >
                            <option selected>Mầu sắc</option>
                            <option value="1">Tím</option>
                            <option value="2">Xanh</option>
                            <option value="3">Vàng</option>
                          </select>
                        </td>

                        <!--Quantity-->
                        <td>
                          <div class="form-outline w-75">
                            <input
                              type="number"
                              id="typeNumber"
                              value="1"
                              class="form-control"
                            />
                          </div>
                        </td>

                        <!--Price-->
                        <td>
                          <p class="fw-bold" style="color: #fb1514; margin: 0">
                            59.980.000.&#8363;
                          </p>
                          <p class="fw-light text-decoration-line-through">
                            67.980.000&#8363;
                          </p>
                        </td>
                      </tr>

                      <tr>
                        <!--Image-->
                        <th class="p-0 py-2">
                          <div class="d-flex justify-content-center">
                            <img
                              class="align-items-center"
                              width="100"
                              src="https://dummyimage.com/400x400/ff0000/fff"
                            />
                          </div>
                        </th>

                        <!--Name and color option-->
                        <td>
                          <span class="fst-normal">Iphone 14 Pro Max 128GB</span>
                          <br />
                          <select
                            class="form-select form-select-sm w-75 mt-3"
                            aria-label=".form-select-sm example"
                          >
                            <option selected>Mầu sắc</option>
                            <option value="1">Tím</option>
                            <option value="2">Xanh</option>
                            <option value="3">Vàng</option>
                          </select>
                        </td>

                        <!--Quantity-->
                        <td>
                          <div class="form-outline w-75">
                            <input
                              type="number"
                              id="typeNumber"
                              value="1"
                              class="form-control"
                            />
                          </div>
                        </td>

                        <!--Price-->
                        <td>
                          <p class="fw-bold" style="color: #fb1514; margin: 0">
                            59.980.000.&#8363;
                          </p>
                          <p class="fw-light text-decoration-line-through">
                            67.980.000&#8363;
                          </p>
                        </td>
                      </tr>

                      <tr>
                        <!--Image-->
                        <th class="p-0 py-2">
                          <div class="d-flex justify-content-center">
                            <img
                              class="align-items-center"
                              width="100"
                              src="https://dummyimage.com/400x400/ff0000/fff"
                            />
                          </div>
                        </th>

                        <!--Name and color option-->
                        <td>
                          <span class="fst-normal">Iphone 14 Pro Max 128GB</span>
                          <br />
                          <select
                            class="form-select form-select-sm w-75 mt-3"
                            aria-label=".form-select-sm example"
                          >
                            <option selected>Mầu sắc</option>
                            <option value="1">Tím</option>
                            <option value="2">Xanh</option>
                            <option value="3">Vàng</option>
                          </select>
                        </td>

                        <!--Quantity-->
                        <td>
                          <div class="form-outline w-75">
                            <input
                              type="number"
                              id="typeNumber"
                              value="1"
                              class="form-control"
                            />
                          </div>
                        </td>

                        <!--Price-->
                        <td>
                          <p class="fw-bold" style="color: #fb1514; margin: 0">
                            59.980.000.&#8363;
                          </p>
                          <p class="fw-light text-decoration-line-through">
                            67.980.000&#8363;
                          </p>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="d-flex justify-content-between mb-3">
                    <button type="button" class="btn btn-outline-danger">
                      Tiếp tục mua hàng
                    </button>
                    <button type="button" class="btn btn-outline-danger">
                      Xóa hết
                    </button>
                  </div>
                </div>

                <!--Payment-->
                <div class="col-md-3 border border-2 rounded-1">
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
                    <button type="button" class="btn btn-danger w-100">
                      Đi tới thanh toán
                    </button>
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
