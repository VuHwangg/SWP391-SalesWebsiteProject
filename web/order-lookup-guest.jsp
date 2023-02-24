<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Order" %>
<%@page import="java.sql.Date" %>
<%@page import="java.util.ArrayList" %>
<%@page import="util.Helper"%>


<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Tra đơn</title>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        <main>
            <!--navigation bar-->
            <%@include file="components/navbar.jsp" %>

            <div class="py-5"></div>
            <div class="">
              <div class="container">
                <!-- Breadcrumb -->
                <div class="breadcrumb" style="padding-top: 20px">
                    <a href="home">Trang chủ</a>
                    <span>&nbsp;/&nbsp;</span>
                    <a href="ViewAllOrder">Tra đơn</a>
                </div>

                <div class="row">
                    <h3 class="fw-bolder mb-4">TRA CỨU ĐƠN HÀNG</h3>
                </div>
              </div>
                <!--Order lookup-->
                
                <div class="overlookup-guest">
                    <div class="bg-overlookup"></div>
                    <div class="search-block d-flex justify-content-center align-items-center">
                        <div class="container-fluid d-inline-block text-center">    
                            <h1>
                                Kiểm tra thông tin đơn hàng 
                                <br/>
                                & tình trạng vận chuyển
                            </h1>
                            <br/>
                            <form action="SearchOrder" method="post">
                                <div class="input-group" style="border: 2px solid #dc3545; border-radius: 24px; overflow: hidden;">
                                    <input class="form-control border-end-0 border" type="text" name="search" placeholder="Tìm kiếm theo mã đơn hàng">
                                    <span class="input-group-append">
                                        <button class="btn bg-danger" type="submit" style="border-radius: 0">
                                            <i class="bi bi-search" style="color: white"></i>
                                        </button>
                                    </span>
                                </div>
                            </form>
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