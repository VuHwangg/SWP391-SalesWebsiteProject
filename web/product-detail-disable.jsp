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
                  <div class="col-sm-4 sub-vote">
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
                        <div class="main-slider-img text-center p-4"> <img id="main-image" src="https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-600x600.jpeg"/> </div>
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
                        <span class="col-4 fp-btn active">
                            128GB
                        </span>
                        <span class="col-4 fp-btn">
                            256GB
                        </span>
                        <span class="col-4 fp-btn">
                            512GB
                        </span>
                    </div>
                    
                    <div class="row filter-product-group">
                        <span class="col-4 fp-btn">Đỏ</span>
                        <span class="col-4 fp-btn">
                            Xanh
                        </span>
                        <span class="col-4 fp-btn">
                            Vàng
                        </span>
                        <span class="col-4 fp-btn">
                            Trắng
                        </span>
                        <span class="col-4 fp-btn active">
                            Đen
                        </span>
                    </div>
                    
                    <div class="row ">
                        <div class="col-12" style="padding: 0">
                            <a class="buy-btn btn btn-danger w-100" href="#">
                                Truy cập vào sản phẩm trong cửa hàng
                            </a>
                        </div>
                        
                        
                    </div>
                </div>
              </div>
              
             <div style="padding: 0 12px">
              <div class="row mt-3 w-100 mx-auto product-description">
                  
                  <div class="cover-block product-description-left col-md-7 bg-danger">
                      <h3>Đặc điểm nổi bật của iPhone 13:</h3>
                      <p>Về kích thước, iPhone 13 sẽ có 4 phiên bản khác nhau và kích thước không đổi so với series iPhone 12 hiện tại. Nếu iPhone 12 có sự thay đổi trong thiết kế từ góc cạnh bo tròn (Thiết kế được duy trì từ thời iPhone 6 đến iPhone 11 Pro Max) sang thiết kế vuông vắn (đã từng có mặt trên iPhone 4 đến iPhone 5S, SE). Thì trên điện thoại iPhone 13 vẫn được duy trì một thiết kế tương tự. Máy vẫn có phiên bản khung viền thép, một số phiên bản khung nhôm cùng mặt lưng kính. Tương tự năm ngoái, Apple cũng sẽ cho ra mắt 4 phiên bản là iPhone 13, 13 mini, 13 Pro và 13 Pro Max. Phần tai thỏ trên iPhone 13 cũng có thay đổi so với thế hệ trước, cụ thể tai thỏ này được làm nhỏ hơn so với 20%, trong khi đó độ dày của máy vẫn được giữ nguyên. Điểm khác biệt nhất về thiết kế trên thế hệ iPhone 2021 này đó là camera chéo. Màu sắc trên mẫu iPhone mới này cũng đa dạng hơn, trong đó nổi bật là iPhone 13 màu hồng. Các màu sắc còn lại đề đã từng được xuất hiện trên các phiên bản trước đó như trắng, đen, đỏ, xanh blue.</p>
                  </div>
                  
                  <div class="cover-block col-md-4">
                      <h3>Thông số kỹ thuật: </h3>
                      <div class="table-responsive">
                          <table class="table table-striped">
                              <tr>
                                  <th>Hệ điều hành:</th>
                                  <td>IOS</td>
                              </tr>
                              <tr>
                                  <th>Kích thước màn hình: </th>
                                  <td>6.1 inches</td>
                              </tr>
                              <tr>
                                  <th>Dung lượng RAM:</th>
                                  <td>4 GB</td>
                              </tr>
                              <tr>
                                  <th>Bộ nhớ trong:</th>
                                  <td>128 GB</td>
                              </tr>
                              <tr>
                                  <th>CPU:</th>
                                  <td>Apple A15</td>
                              </tr>
                              <tr>
                                  <th>Card đồ họa:</th>
                                  <td></td>
                              </tr>
                          </table>
                      </div>
                  </div>
              </div>
              <div class="vote cover-block row mt-3 w-100 mx-auto">
                  <div class="vote-left col-4 text-center">
                      <h6>Đánh giá trung bình</h6>
                      <h3>4.0/5</h3>
                      <div class="stars">
                          <i class="bi bi-star-fill active"></i>
                          <i class="bi bi-star-fill active"></i>
                          <i class="bi bi-star-fill active"></i>
                          <i class="bi bi-star-fill active"></i>
                          <i class="bi bi-star-fill"></i>
                      </div>
                      <h6>21 đánh giá</h6>
                  </div>
                  <div class="col-8">
                      <div class="d-flex justify-content-between align-items-center">
                          <span>5<i class="bi bi-star-fill active"></i></span>
                          <div class="progress">
                            <div class="progress-bar bg-danger" style="width: 80%;"></div>
                          </div>
                          <span>17</span>
                      </div>
                      <div class="d-flex justify-content-between align-items-center">
                          <span>4<i class="bi bi-star-fill active"></i></span>
                          <div class="progress">
                            <div class="progress-bar bg-danger" style="width: 20%"></div>
                          </div>
                          <span>4</span>
                      </div>
                      <div class="d-flex justify-content-between align-items-center">
                          <span>3<i class="bi bi-star-fill active"></i></span>
                          <div class="progress">
                            <div class="progress-bar bg-danger" style="width: 0%"></div>
                          </div>
                          <span>0</span>
                      </div>
                      <div class="d-flex justify-content-between align-items-center">
                          <span>2<i class="bi bi-star-fill active"></i></span>
                          <div class="progress">
                            <div class="progress-bar bg-danger" style="width: 0%"></div>
                          </div>
                          <span>0</span>
                      </div>
                      <div class="d-flex justify-content-between align-items-center">
                          <span>1<i class="bi bi-star-fill active"></i></span>
                          <div class="progress">
                            <div class="progress-bar bg-danger" style="width: 0%"></div>
                          </div>
                          <span>0</span>
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
