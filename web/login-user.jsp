<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/login-style.jsp" %>
        <title>Đăng nhập</title>
    </head>
    <body>

        <!--Background-->
        <div class="header">

            <!--Content before waves-->
            <div class="inner-header flex">
            </div>

            <!--Waves Container-->
            <div>
                <svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                     viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
                <defs>
                <path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
                </defs>
                <g class="parallax">
                <use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(255,255,255,0.7" />
                <use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.5)" />
                <use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.3)" />
                <use xlink:href="#gentle-wave" x="48" y="7" fill="#fff" />
                </g>
                </svg>
            </div>
            <!--Waves end-->
        </div>

        <div class="back-btn">
            <a href="home">
                <i class="fa fa-chevron-left" aria-hidden="true"></i><span> Quay lại</span>
            </a>
        </div>

        <!--Login Form-->
        <div class="login-form">
            <form class="mb-5" action="LoginEmpt" method="post">
                <div class="form-title">
                    <h4 style="color: #662FB5">ApexTec</h4>
                    <h1>ĐĂNG NHẬP</h1>
                    <span>Vui lòng chọn tài khoản để đăng nhập</span>
                </div>
                <div>
                    <a  style="text-decoration: none"
                        href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:9999/SWP391-SalesWebsiteProject/LoginUser&response_type=code&client_id=1085689904569-u4662st25sdv1a20rngoqc2vn1ucibrh.apps.googleusercontent.com&approval_prompt=force"
                        class="btn mb-2 w-100 btn-google"
                        >
                        <i class="bi bi-google me-1"></i>
                        <span  class="d-line h5" >
                            <strong>Sử dụng tài khoản Google </strong>
                        </span>
                    </a>
                </div>
            </form>
            <a class="admin-login-btn" href="login-admin.jsp"><i class="bi bi-person-fill-gear" style="font-size: 22px; line-height: 1"></i> Nhân Viên</a>
        </div>

        <!--Content ends-->
        <%@include file="styles/js/validate-script.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <!--JS bootstrap 5 include--> 
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
