<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Đơn hàng của tôi</title>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        <main>
            <%@include file="components/navbar.jsp" %>

            <div class="py-5"></div>
            <div class="container min-vh-100">
                <div class="breadcrumb" style="padding-top: 20px">
                    <a href="home">Trang chủ</a>
                    <span>&nbsp;/&nbsp;</span>
                    <a href="order-lookup-guest.jsp">Tra đơn</a>
                    <span>&nbsp;/&nbsp;</span>
                    <a href="#">Không tìm thấy đơn hàng</a>
                </div>
                
                <div class="d-flex justify-content-center align-items-center flex-column" style="height: 60vh">
                    <i style="font-size: 250px; line-height: 1.3" class="bi bi-bag-x"></i>
                    <h3 style="text-align: center">Không tìm thấy đơn hàng</h3>
                        <div style="width: 60%;" class=" border-top border-dark border-1 my-3"></div>
                        <a href="home" class="btn w-50" style="font-weight: bold; background-color: #6f42c1; border-color: #6f42c1; color: white;">Quay Lại Trang Chủ</a>
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
