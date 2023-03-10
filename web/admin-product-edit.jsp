<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.Helper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/admin-head.jsp" %>
        <%@include file="styles/css/admin-style.jsp" %>
        <title>Quản lý sản phẩm</title>

    </head>
    <body class="fixed-nav sticky-footer bg-danger" id="page-top">



        <!-- NAVIGATION BAR-->
        <%@include file="components/admin-navbar.jsp" %>

        <!-- CONTENT PART -->
        <div class="content-wrapper">
            <div class="container-fluid">

                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="admin-product-list.jsp">Quản lý sản phẩm</a>
                    </li> 
                    <li class="breadcrumb-item active">Chỉnh sửa</li>
                </ol>

                <!-- EDIT CARD-->
                <div class="card mb-3">

                    <!--DO NOT TOUCH ON THIS SHIT BELOW-->
                    <canvas id="myAreaChart" width="100%" height="30" hidden></canvas>
                    <canvas id="myBarChart" width="100" height="70" hidden></canvas>
                    <canvas id="myPieChart" width="100%" height="100" hidden></canvas>
                    <!--DO NOT TOUCH ON THIS SHIT ABOVE-->

                    <div class="card-header">
                        <i class="fa fa-pencil-square-o"></i>&nbsp;Chỉnh sửa sản phẩm số
                        <!--ID của sản phẩm-->
                        <span class="text-danger" style="text-decoration: underline; font-size: 18px; font-weight: 700;">
                            #${requestScope.product.id}
                        </span>
                    </div>
                    <div class="card-body p-3">
                        <form action="EditProduct" method="POST"></form>
                            <div class="input-group mb-3">
                                <!--Tên sản phẩm-->
                                <div class="input-group-prepend">
                                    <label class="input-group-text" for="inputNameProduct">Tên sản phẩm</label>
                                </div>
                                <input type="text" class="form-control" id="inputNameProduct" placeholder="Độ dài từ 1 đến 40 ký tự" value="${requestScope.product.name}" minlength="1" maxlength="40" required>
                            </div>
                        
                            <div class="row">
                                <div class="col-md-6 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="OldPrice">Giá gốc</label>
                                    </div>
                                    <!--Giá gốc-->
                                    <input type="text" class="form-control" id="OldPrice" placeholder="VD: 19000000" value="${helper.convertBigNum(product.original_price)}" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text">VNĐ</span>
                                    </div>
                                </div>
                                <div class="col-md-6 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="SalePrice">Giá bán ra</label>
                                    </div>
                                    <!--Giá sale-->
                                    <input type="text" class="form-control" id="SalePrice" placeholder="VD: 12990000" value=" ${helper.convertBigNum(product.current_price)} " maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');">
                                    <div class="input-group-append">
                                        <span class="input-group-text">VNĐ</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="inputColorProduct">Màu sắc</label>
                                    </div>
                                    <!--Màu sắc-->
                                    <input type="text" class="form-control" id="inputColorProduct" placeholder="Màu sắc của sản phẩm" value="${requestScope.product.color}" maxlength="40" required>
                                </div>
                                <div class="col-md-6 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="inputTypeProduct">Loại sản phẩm</label>
                                    </div>
                                    <!--Loại sản phẩm-->
                                    <select class="custom-select" id="inputTypeProduct">
                                        <c:if test="${product.type == 1}">
                                            <option  value="phone">Điện thoại</option>
                                            <option  selected value="laptop">Laptop</option>
                                        </c:if>
                                        <c:if test="${product.type == 0}">
                                            <option selected value="phone">Điện thoại</option>
                                            <option value="laptop">Laptop</option>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3">
                                <h5 class="fw-bold">Thông số kỹ thuật</h5>
                            </div>
                            <div class="row">
                                <div class="col-md-4 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="inputRam">RAM</label>
                                    </div>
                                    <!--RAM-->
                                    <input type="text" class="form-control" id="inputRam" placeholder="VD: 16" value="${requestScope.product.ram}" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text">GB</span>
                                    </div>
                                </div>
                                <div class="col-md-4 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="inputRom">ROM</label>
                                    </div>
                                    <!--ROM-->
                                    <input type="text" class="form-control" id="inputRom" placeholder="VD: 512" value="${requestScope.product.memory}" maxlength="5" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text">GB</span>
                                    </div>
                                </div>
                                <div class="col-md-4 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="inputGroupSelect02">Hệ điều hành</label>
                                    </div>
                                    <!--Hệ điều hành-->

                                    <select class="custom-select" id="inputGroupSelect02">
                                        <c:if test="${helper.osCompare(product.os) == 0}">
                                            <option selected value="android">Android</option>
                                            <option value="ios">IOS</option>
                                            <option value="window">Windows</option>
                                            <option value="macos">MacOS</option>
                                        </c:if>
                                        <c:if test="${helper.osCompare(product.os) == 1}">
                                            <option value="android">Android</option>
                                            <option selected value="ios">IOS</option>
                                            <option value="window">Windows</option>
                                            <option value="macos">MacOS</option>
                                        </c:if>
                                        <c:if test="${helper.osCompare(product.os) == 2}">
                                            <option value="android">Android</option>
                                            <option value="ios">IOS</option>
                                            <option selected value="window">Windows</option>
                                            <option value="macos">MacOS</option>
                                        </c:if>
                                        <c:if test="${helper.osCompare(product.os) == 3}">
                                            <option value="android">Android</option>
                                            <option value="ios">IOS</option>
                                            <option value="window">Windows</option>
                                            <option selected value="macos">MacOS</option>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="screenProduct">Kích thước màn hình</label>
                                    </div>
                                    <!--Kích thước màn hình-->
                                    <input type="text" class="form-control" placeholder="VD: VD: 15.6" value="${requestScope.product.size}" maxlength="10" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');">
                                    <div class="input-group-append">
                                        <span class="input-group-text">Inchs</span>
                                    </div>
                                </div>
                                <div class="col-md-4 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="CpuProduct">CPU (Chipset)</label>
                                    </div>
                                    <!--CPU-->
                                    <input type="text" class="form-control" id="CpuProduct" placeholder="VD: Ryzen 7 4800H" value="${requestScope.product.cpu}" maxlength="30">
                                </div>
                                <div class="col-md-4 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="GpuProduct">GPU (Card đồ họa)</label>
                                    </div>
                                    <!--GPU-->
                                    <input type="text" class="form-control" id="GpuProduct" placeholder="VD: Geforce RTX 3060 6GB" value="${requestScope.product.graphic_card}" maxlength="30">
                                </div>
                            </div>
                            <div class="mb-3">
                                <h5 class="fw-bold">Mô tả sản phẩm</h5>
                            </div>
                            <div class="mb-3">
                                <textarea class="form-control border border-1 border-danger" rows="5" placeholder="Độ dài từ 1 đến 1000 ký tự" minlength="1" maxlength="1000" required>${requestScope.product.description}</textarea>
                            </div>
                            <div class="d-flex justify-content-end align-items-end">
                                <input type="submit" class="save-btn btn btn-danger m-1" value="Lưu Lại Thay Đổi">
                                <a class="save-btn btn btn-secondary text-white m-1" onclick="history.back(-1)">
                                    Quay Lại
                                </a>
                            </div>
                        </form>
                    </div>
                    <!-- <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
                </div>
            </div>
            <!-- /.container-fluid-->
            <!-- /.content-wrapper-->
            <%@include file="components/admin-footer.jsp" %>
        </div>
        <%@include file="components/admin-footer-link.jsp" %>
        <%@include file="styles/js/admin-script.jsp" %>
    </body>
</html>
