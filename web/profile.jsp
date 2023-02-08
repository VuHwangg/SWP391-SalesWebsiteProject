
<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Thông tin cá nhân</title>
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
                <a href="#">Thông tin cá nhân</a>
              </div>
              <!-- list product block -->
              <div class="profile">
                <div class="row">
                  <!-- list of filter check-box column -->
                  <div class="cover-block profile-left col-sm-3 bg-offwhite">
                      <div class="avatar">
                          <img src="img/avatar-profile.png" alt="avatar"/>
                      </div>
                      <div class="profile-name">
                          <p>Hoàng Chu Anh Vũ</p>
                      </div>
                      <div class="profile-email">
                          <p>hoangvudepzai30082002@gmail.com</p>
                      </div>
                      <div class="the-line-white"></div>
                      <a class="profile-btn-white active" href="#">
                          Thông tin cá nhân
                      </a>
                      <a class="profile-btn-white" href="profile-edit.jsp">
                          Chỉnh sửa thông tin
                      </a>
                  </div>
                  <!-- list of product column -->
                  <div class="cover-block profile-right col-sm-8 bg-offwhite">
                    <!-- sort method radio check -->
                    <h3 class="title-profile">Thông tin cá nhân</h3>
                    <div class="border-top border-dark border-3 mb-2"></div>
                    <div class="col">
                        <table>
                            <tr>
                                <td>Email liên kết:</td>
                                <td>hoangvudepzai30082002@gmail.com</td>
                            </tr>
                            <tr>
                                <td>Họ và tên:</td>
                                <td>Hoàng Chu Anh Vũ</td>
                            </tr>
                            <tr>
                                <td>Số điện thoại:</td>
                                <td>0833232520</td>
                            </tr>
                            <tr>
                                <td>Địa chỉ:</td>
                                <td>Đường Phai Dài, Khu 1, thị trấn Thất Khê, huyện Tràng Định, tỉnh Lạng Sơn</td>
                            </tr>
                        </table>
                      
                      
                    </div>

                    <!-- list all product -->
                    <div class="row">
                      
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
