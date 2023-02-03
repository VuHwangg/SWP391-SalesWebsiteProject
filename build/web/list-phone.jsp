
<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Điện thoại</title>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        <main>
          <!--navigation bar-->
          <%@include file="components/navbar.jsp" %>

          <div class="main-container">
            <!--Side banner-->
            <%@include file="components/side-banner.jsp" %>

            <!-- Content Center -->
            <div class="content-center bg-offwhite">
              <!-- Breadcrumb -->
              <div class="breadcrumb">
                <a href="index.jsp">Trang chủ</a>
                <span>&nbsp;/&nbsp;</span>
                <a href="#">Điện thoại</a>
              </div>
              <!-- carousel -->
              <div class="small-main-carousel">
                <img src="img/small-main-carousel-demo.png" alt="" />
              </div>
              <!-- list product block -->
              <div class="list-product">
                <div class="row">
                  <!-- list of filter check-box column -->
                  <div class="filter col-sm-3">
                    <form action="" method="get">
                        
                        <div class="row">
                          <p class="filter-title">Mức giá</p>
                          <div class="price-input">
                            <div class="field">
                              
                              <input type="number" class="input-min" value="10000000">
                              <span>&nbsp;VNĐ</span>
                            </div>
                            <div class="separator">&nbsp;<i class="bi bi-arrow-right"></i>&nbsp;</div>
                            <div class="field">
                              <input type="number" class="input-max" value="80000000">
                              <span>&nbsp;VNĐ</span>
                            </div>
                          </div>
                          <div class="slider">
                            <div class="progress"></div>
                          </div>
                          <div class="range-input">
                            <input type="range" class="range-min" min="0" max="100000000" value="10000000" step="2000000">
                            <input type="range" class="range-max" min="0" max="100000000" value="80000000" step="2000000">
                          </div>
                        </div>
                        
                        <div class="row">
                          <p class="filter-title">Kích thức màn hình</p>
                          <div class="col-lg-6">
                            <input type="checkbox" name="brand" id="brand1"  />
                            <label for="brand1">Dưới 6 inch</label>
                          </div>
                          <div class="col-lg-6">
                            <input type="checkbox" name="brand" id="brand2" />
                            <label for="brand2">Trên 6 inch</label>
                          </div>
                        </div>
                        
                        <div class="row">
                          <p class="filter-title">Nhu cầu sử dụng</p>
                          <div class="col-lg-6">
                            <input type="checkbox" name="needs" id="needs1" checked />
                            <label for="needs1">Tất cả</label>
                          </div>
                          <div class="col-lg-6">
                            <input type="checkbox" name="needs" id="needs2" />
                            <label for="needs2">Mỏng nhẹ</label>
                          </div>
                          <div class="col-lg-6">
                            <input type="checkbox" name="needs" id="needs3" />
                            <label for="needs3">Gaming</label>
                          </div>
                        </div>
                        
                        <div class="row">
                          <p class="filter-title">Radio</p>
                          <div class="col-lg-6">
                            <input type="radio" name="brand_2" id="brand5" checked />
                            <label for="brand5">Tất cả</label>
                          </div>
                          <div class="col-lg-6">
                            <input type="radio" name="brand_2" id="brand6" />
                            <label for="brand6">Brand 2</label>
                          </div>
                          <div class="col-lg-6">
                            <input type="radio" name="brand_2" id="brand7" />
                            <label for="brand7">Brand 3</label>
                          </div>
                          <div class="col-lg-6">
                            <input type="radio" name="brand_2" id="brand8" />
                            <label for="brand8">Brand 4</label>
                          </div>
                        </div>
                        <input class="btn-filter" type="submit" value=" Tìm kiếm " />
                      </form>
                  </div>
                  <!-- list of product column -->
                  <div class="list cover-block col-sm-9">
                    <!-- sort method radio check -->
                    <div class="sort-method row">
                      <div class="col-4 sort-method-title">
                        <p>Sắp xếp theo:</p>
                      </div>
                      <div class="col-md-8">
                        <div class="btn-group sort-method-selection" role="group">
                            <input
                              type="radio"
                              class="btn-check"
                              name="btnradio"
                              id="btnradio1"
                              autocomplete="off"
                              checked
                            />
                            <a class="btn btn-outline-danger" href="#">
                                <label for="btnradio1">
                                    Khuyến mãi
                              </label>
                            </a>

                            <input
                              type="radio"
                              class="btn-check"
                              name="btnradio"
                              id="btnradio2"
                              autocomplete="off"
                            />
                            <a class="btn btn-outline-danger" href="#">
                              <label for="btnradio2">
                                  Giá tăng dần
                              </label>
                            </a>

                            <input
                              type="radio"
                              class="btn-check"
                              name="btnradio"
                              id="btnradio3"
                              autocomplete="off"
                            />
                            <a class="btn btn-outline-danger" href="#">
                                <label for="btnradio3">
                                  Giá giảm dần
                              </label>
                            </a>
                          </div>
                      </div>
                    </div>

                    <!-- list all product -->
                    <div class="row">
                        <a class="product col-md-4 col-sm-6" href="#">
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
                        <a class="product col-md-4 col-sm-6" href="#">
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
                        <a class="product col-md-4 col-sm-6" href="#">
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
                        <a class="product col-md-4 col-sm-6" href="#">
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
                        <a class="product col-md-4 col-sm-6" href="#">
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
