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

          <div class="main-container">

            <!-- Content Center -->
            <div class="content-center">
              <!-- Breadcrumb -->
              <div class="breadcrumb">
                <a href="index.jsp">Trang chủ</a>
                <span>&nbsp;/&nbsp;</span>
                <a href="list-phone.jsp">Điện thoại</a>
                <span>&nbsp;/&nbsp;</span>
                <a href="#">Iphone</a>
                <span>&nbsp;/&nbsp;</span>
                <a href="#">Iphone 13</a>
              </div>

              <div class="row product-detail-title">
                  <h1 class="col-sm-8 fw-bold">iPhone 13 128GB Đen</h1>
                  <div class="col-sm-4 sub-reviews">
                      <div class="stars">
                          <i class="bi bi-star-fill active"></i>
                          <i class="bi bi-star-fill active"></i>
                          <i class="bi bi-star-fill active"></i>
                          <i class="bi bi-star-fill active"></i>
                          <i class="bi bi-star-fill"></i>
                      </div>
                      <h6>21 đánh giá</h6>
                  </div>
                  <div class="border-top border-3 my-2"></div>
              </div>
              
              <div class="row mt-3 w-100 mx-auto product-detail">
                <div class="col-md-8">
                    <div class="slider-img">
                        <div class="main-slider-img text-center p-4 border border-2 rounded-5"> <img id="main-image" src="https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-600x600.jpeg"/> </div>
                        <div class="thumbnail text-center"> 
                            <img onclick="change_image(this)" src="https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-600x600.jpeg"> 
                            <img onclick="change_image(this)" src="https://cdn.ankhang.vn/media/product/21291_asus_tuf_gaming_f15_fx507zc_hn124w_12.jpg"> 
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <h3 class="price fw-bold">18.890.000 &#8363</h3>
                    <h4 class="sale-price text-decoration-line-through">21.990.000 &#8363</h4>
                    <div class="row filter-product-group">
                        <a class="col-4 fp-btn active">
                            128GB
                        </a>
                        <a class="col-4 fp-btn">
                            256GB
                        </a>
                        <a class="col-4 fp-btn">
                            512GB
                        </a>
                    </div>
                    
                    <div class="row filter-product-group">
                        <a class="col-4 fp-btn">Đỏ</a>
                        <a class="col-4 fp-btn">
                            Xanh
                        </a>
                        <a class="col-4 fp-btn active">
                            Vàng
                        </a>
                        <a class="col-4 fp-btn">
                            Trắng
                        </a>
                        <a class="col-4 fp-btn">
                            Đen
                        </a>
                    </div>
                    
                    <div class="row ">
                        <div class="col-12" style="padding: 0">
                            <a class="buy-btn btn btn-danger w-100" href="cart.jsp">
                                Mua ngay
                            </a>
                        </div>
                        <div class="col-4" style="padding: 0">
                            <div class="quantity-input">
                                <button id="minusBtn">-</button>
                                <input type="number" id="numberInput" value="1" min="1" max="99" readonly />
                                <button id="plusBtn">+</button>
                              </div>
                        </div>
                        <div class="col-8" style="padding: 0 0 0 8px">
                            <a class="add-cart-btn btn w-100" href="cart.jsp">
                                <table>
                                    <tr>
                                        <td style="width: 30%"><i class="bi bi-cart-plus-fill"></i></td>
                                        <td style="width: 70%">Thêm vào giỏ hàng</td>
                                    </tr>
                                </table>
                            </a>
                        </div>
                    </div>
                </div>
              </div>
              
              <div class="row mt-3 w-100 mx-auto similar-product">
                  <h4>Sản phẩm tương tự: </h4>
                  <div class="row" style="flex-grow: 1">
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
