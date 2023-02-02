
<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Không tìm thấy</title>
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
                <a href="index.html">Trang chủ</a>
                <span>&nbsp;/&nbsp;</span>
                <a href="#">Tìm kiếm</a>
              </div>
              <!--not found block-->
              <div class="product-notfound">
                <div>
                    <p>Rất tiếc, chúng tôi không có kết quả bạn cần tìm</p>
                    <div class="row">
                        <a class="btn btn-danger w-50"> Quay lại trang chủ </a>
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

