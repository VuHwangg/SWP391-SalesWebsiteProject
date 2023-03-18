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
            <form action="SignupUser" method="post" class="needs-validation" novalidate>

                <div class="form-title">
                    <h4 class="text-danger">Awns's Store</h4>
                    <h2 class="mb-1">Hoàn Thiện Thông Tin</h2>
                    <span>Bạn lòng hoàn thiện hết thông tin bên dưới để có thể tiếp tục sử dụng website</span>

                </div>
                <div class="form-input">
                    <label for="name">Họ và tên</label>
                    <input type="text" class="form-control" id="name" name="name" onkeydown="if(event.keyCode==32 && this.selectionStart==0) return false;" placeholder="VD: Hoàng Chu Anh Vũ" maxlength="100" required>
                    <div class="invalid-feedback">
                        Họ và tên không được để trống
                    </div>
                </div>
                <div class="form-input">
                    <label for="phone">Số điện thoại</label>
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="VD: 0833232520" oninput="this.value = this.value.replace(/[^0-9]/g, '');" maxlength="30" required>
                    <div class="invalid-feedback">
                        Số điện thoại không đuợc để trống
                    </div>
                </div>
                <div class="form-input">
                    <label for="address">Địa chỉ</label>
                    <input type="text" class="form-control" id="address" name="place" onkeydown="if(event.keyCode==32 && this.selectionStart==0) return false;" placeholder="VD: Thôn 4 - Thạch Hòa - Thạch Thất - Hà Nội" maxlength="100" required>
                    <div class="invalid-feedback">
                        Số điện thoại không đuợc để trống
                    </div>
                </div>

                <div class="input-group mb-3" hidden>
                    <input type="file" class="form-control" id="inputGroupFile02" accept="image/png, image/jpeg"name="img" value="">
                    <label class="input-group-text" for="inputGroupFile02">Tải lên ảnh đại diện</label>
                </div>
                <div class="form-input">
                    <input type="submit" class="btn btn-danger" id="login-btn" value="Hoàn Tât">
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