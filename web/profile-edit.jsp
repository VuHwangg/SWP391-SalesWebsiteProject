
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
                <%@include file="components/side-banner.jsp" %>

                <!-- Content Center -->
                <div class="content-center min-vh-100">
                    <!-- Breadcrumb -->
                    <div class="breadcrumb breadcrumb-invisible">
                        <a href="home">Trang chủ</a>
                        <span>&nbsp;/&nbsp;</span>
                        <a href="#">Thông tin cá nhân</a>
                    </div>
                    <!-- list product block -->
                    <div class="profile d-flex justify-content-center align-items-center flex-column">
                        <%
                            cus = (Customer) session.getAttribute("cust");
                            acc = (Account) session.getAttribute("acc");
                            mess = (String) request.getAttribute("err");
                            if (mess == null)
                                mess = "";
                        %>
                        <p><%=mess%></p>
                        <div class="row w-100">
                            <!-- list of filter check-box column -->
                            <div class="cover-block profile-left col-sm-3">
                                <div class="avatar">
                                    <img src="img/avatar-profile.png" alt="avatar"/>
                                </div>
                                <div class="profile-name">
                                    <p><%=cus.getCustomerName()%></p>
                                </div>
                                <div class="profile-email">
                                    <p><%=cus.getEmail()%></p>
                                </div>
                                <div class="the-line-white"></div>
                                <a class="profile-btn-white" href="profile.jsp">
                                    Thông tin cá nhân
                                </a>
                                <a class="profile-btn-white active" href="#">
                                    Chỉnh sửa thông tin
                                </a>
                            </div>
                            <!-- list of product column -->
                            <div class="cover-block profile-right col-sm-8">
                                <!-- sort method radio check -->
                                <h3 class="title-profile">Thông tin cá nhân</h3>
                                <div class="border-top border-dark border-3 mb-2"></div>
                                <div class="col">
                                    <form action="EditProfile">
                                        <table>
                                            <tr>
                                                <td>Email liên kết:</td>
                                                <td>
                                                    <span><%=cus.getEmail()%></span>
                                                    <!--                                    <a class="profile-btn-red change-email" href="#">Đổi&nbsp;tài&nbsp;khoản</a>-->
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Họ và tên:</td>
                                                <td>
                                                    <input type="text" name="name" value="<%=cus.getCustomerName()%>" class="form-control" placeholder="Nhập họ tên của bạn" required maxlength="100">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Số điện thoại:</td>
                                                <td>
                                                    <input type="text" name="phone" value="<%=cus.getPhone()%>" class="form-control" placeholder="Nhập số điện thoại của bạn" required oninput="this.value = this.value.replace(/[^0-9]/g, '');" maxlength="30">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Địa chỉ:</td>
                                                <td>
                                                    <input type="text" name="adress" value="<%=cus.getAddress()%>" class="form-control" placeholder="Nhập địa chỉ của bạn" required maxlength="200">
                                                </td>
                                            </tr>
                                        </table>
                                        <input type="submit" value="Lưu lại chỉnh sửa" class="profile-btn-red">
                                    </form>
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
        <!--Vanta.js Animation Background-->
        <%@include file="components/vantajs-link.jsp" %>
    </body>
</html>
