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
        <title>Đăng nhập cho quản trị viên</title>
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
            <a href="login-user.jsp">
                <i class="fa fa-chevron-left" aria-hidden="true"></i><span> Quay lại</span>
            </a>
        </div>

        <!--Login Form-->
        <div class="login-form">
            <form action="LoginEmpt" method="post">
                <%
                    String mess = (String) request.getAttribute("err");
                    if (mess == null)
                        mess = "";
                %>
                
                <div class="form-title">
                    <h4 class="text-danger">Awns's Store</h4>
                    <h1>ADMIN LOGIN</h1>
                    <span>Chức năng đăng nhập chỉ dành cho quản trị viên</span>
                    
                </div>
                <div class="form-input">
                    <label for="username">Tên đăng nhập</label>
                    <input type="text" id="username" name="email">
                    <small class="text-danger"><%=mess%></small>
                </div>
                <div class="form-input">
                    <label for="password">Mật khẩu</label>
                    <input type="password" id="password" name="pass">
                </div>
                <div class="captcha">
                    <label for="captcha-input">Captcha</label>
                    <div class="preview"></div>
                    <div class="captcha-form">
                        <input type="text" id="captcha-form" placeholder="Nhập mã captcha tương tự với đoạn mã trên">
                        <button class="captcha-refresh">
                            <i class="fa fa-refresh"></i>
                        </button>
                    </div>
                </div>
                <div class="form-input">
                    <input type="submit" class="btn btn-danger" id="login-btn" value="Đăng nhập">
                </div>
            </form>
        </div>

        <!--Content ends-->
        <%@include file="styles/js/login-script.jsp" %>
        
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <!--JS bootstrap 5 include -->
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