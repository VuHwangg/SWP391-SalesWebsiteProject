
<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Trang chủ</title>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        <main>
          <!--navigation bar-->
          <%@include file="components/navbar.jsp" %>

          <div class="main-container">
            <!--Side banner-->
            <%@include file="components/side-banner.jsp" %>
            <!-- Content Center -->
            <div class="content-center bg-red">
              <!-- carousel -->
              <div class="main-carousel">
                <img src="img/main-carousel-demo.png" alt="" />
              </div>
              <!-- list product -->
              <div class="list-product">
                <!-- Hàng sản phẩm khuyến mại -->
                <div class="sale-product row cover-block">
                  <div class="row-title">
                    <i class="bi bi-caret-right-fill"></i>
                    <a href="#">Sản phẩm khuyến mại</a>
                  </div>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_1.jpg"
                        alt="iphone"
                      />
                    </div>
                    <div class="product-name">
                      <p>iPhone 14 128GB</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <s> 34.690.000&nbsp;<span>VNĐ</span></s>
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div>
                    </div>
                  </a>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook-pro-2021-06_8.jpg"
                        alt="laptop"
                      />
                    </div>
                    <div class="product-name">
                      <p>Macbook Pro 14 M1 Pro 16GB 1TB 2021</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <!-- <s> 34.690.000&nbsp;<span>VNĐ</span></s> -->
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <!-- <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div> -->
                    </div>
                  </a>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_1.jpg"
                        alt="iphone"
                      />
                    </div>
                    <div class="product-name">
                      <p>iPhone 14 128GB</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <s> 34.690.000&nbsp;<span>VNĐ</span></s>
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div>
                    </div>
                  </a>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_1.jpg"
                        alt="iphone"
                      />
                    </div>
                    <div class="product-name">
                      <p>iPhone 14 128GB</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <s> 34.690.000&nbsp;<span>VNĐ</span></s>
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div>
                    </div>
                  </a>
                </div>

                <!-- Hàng sản phẩm bán chạy -->
                <div class="bestseller-products row cover-block">
                  <div class="row-title">
                    <i class="bi bi-caret-right-fill"></i>
                    <a href="#">Sản phẩm bán chạy</a>
                  </div>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_1.jpg"
                        alt="iphone"
                      />
                    </div>
                    <div class="product-name">
                      <p>iPhone 14 128GB</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <s> 34.690.000&nbsp;<span>VNĐ</span></s>
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div>
                    </div>
                  </a>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_1.jpg"
                        alt="iphone"
                      />
                    </div>
                    <div class="product-name">
                      <p>iPhone 14 128GB</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <s> 34.690.000&nbsp;<span>VNĐ</span></s>
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div>
                    </div>
                  </a>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_1.jpg"
                        alt="iphone"
                      />
                    </div>
                    <div class="product-name">
                      <p>iPhone 14 128GB</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <s> 34.690.000&nbsp;<span>VNĐ</span></s>
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div>
                    </div>
                  </a>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_1.jpg"
                        alt="iphone"
                      />
                    </div>
                    <div class="product-name">
                      <p>iPhone 14 128GB</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <s> 34.690.000&nbsp;<span>VNĐ</span></s>
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div>
                    </div>
                  </a>
                </div>

                <!-- Hàng sản phẩm điện thoại -->
                <div class="phones-products row cover-block">
                  <div class="row-title">
                    <i class="bi bi-caret-right-fill"></i>
                    <a href="phone-list.html">Điện thoại</a>
                  </div>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_1.jpg"
                        alt="iphone"
                      />
                    </div>
                    <div class="product-name">
                      <p>iPhone 14 128GB</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <s> 34.690.000&nbsp;<span>VNĐ</span></s>
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div>
                    </div>
                  </a>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_1.jpg"
                        alt="iphone"
                      />
                    </div>
                    <div class="product-name">
                      <p>iPhone 14 128GB</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <s> 34.690.000&nbsp;<span>VNĐ</span></s>
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div>
                    </div>
                  </a>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_1.jpg"
                        alt="iphone"
                      />
                    </div>
                    <div class="product-name">
                      <p>iPhone 14 128GB</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <s> 34.690.000&nbsp;<span>VNĐ</span></s>
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div>
                    </div>
                  </a>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_1.jpg"
                        alt="iphone"
                      />
                    </div>
                    <div class="product-name">
                      <p>iPhone 14 128GB</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <s> 34.690.000&nbsp;<span>VNĐ</span></s>
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div>
                    </div>
                  </a>
                </div>

                <!-- Hàng sản phẩm laptop -->
                <div class="laptop-products row cover-block">
                  <div class="row-title">
                    <i class="bi bi-caret-right-fill"></i>
                    <a href="laptop-list.html">Laptop</a>
                  </div>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_1.jpg"
                        alt="iphone"
                      />
                    </div>
                    <div class="product-name">
                      <p>iPhone 14 128GB</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <s> 34.690.000&nbsp;<span>VNĐ</span></s>
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div>
                    </div>
                  </a>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_1.jpg"
                        alt="iphone"
                      />
                    </div>
                    <div class="product-name">
                      <p>iPhone 14 128GB</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <s> 34.690.000&nbsp;<span>VNĐ</span></s>
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div>
                    </div>
                  </a>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_1.jpg"
                        alt="iphone"
                      />
                    </div>
                    <div class="product-name">
                      <p>iPhone 14 128GB</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <s> 34.690.000&nbsp;<span>VNĐ</span></s>
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div>
                    </div>
                  </a>

                  <a class="product col-md-3 col-sm-6" href="#">
                    <div class="product-img">
                      <img
                        src="https://cdn2.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2022-09-28_21-58-51_1.jpg"
                        alt="iphone"
                      />
                    </div>
                    <div class="product-name">
                      <p>iPhone 14 128GB</p>
                    </div>
                    <div class="row price-block">
                      <div class="col-8">
                        <div class="product-old-price">
                          <s> 34.690.000&nbsp;<span>VNĐ</span></s>
                        </div>
                        <div class="product-price">
                          <p>32.690.000&nbsp;<span>VNĐ</span></p>
                        </div>
                      </div>
                      <div class="col-4">
                        <p class="sale-percent">-6%</p>
                      </div>
                    </div>
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

