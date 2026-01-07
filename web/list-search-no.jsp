<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Không tìm thấy</title>
        
        <style>
            .btn-purple {
                background-color: #662FB5 !important;
                border-color: #662FB5 !important;
                color: #ffffff !important;
            }
            .btn-purple:hover {
                background-color: #522591 !important; /* Đậm hơn khi hover */
                border-color: #522591 !important;
            }
        </style>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        <main>
          <%@include file="components/navbar.jsp" %>

          <div class="main-container">
            <div class="content-center">
              <div class="breadcrumb">
                <a href="home">Trang chủ</a>
                <span>&nbsp;/&nbsp;</span>
                <a href="#">Tìm kiếm</a>
              </div>
              <div class="product-notfound">
                <div>
                    <p>Rất tiếc, chúng tôi không có kết quả bạn cần tìm</p>
                    <div class="row">
                        <a class="btn btn-purple w-50" href="home"> Quay lại trang chủ </a>
                    </div>
                </div>
              </div>
            </div>
          </div>
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
