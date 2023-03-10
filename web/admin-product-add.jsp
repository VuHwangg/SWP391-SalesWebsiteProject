<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/admin-head.jsp" %>
        <%@include file="styles/css/admin-style.jsp" %>
        <title>Thêm mới sản phẩm</title>

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
                        <a href="admin-warehouse-management.jsp">Quản lý kho hàng</a>
                    </li> 
                    <li class="breadcrumb-item active">Thêm mới sản phẩm</li>
                </ol>

                <!-- EDIT CARD-->
                <div class="card mb-3">

                    <!--DO NOT TOUCH ON THIS SHIT BELOW-->
                    <canvas id="myAreaChart" width="100%" height="30" hidden></canvas>
                    <canvas id="myBarChart" width="100" height="70" hidden></canvas>
                    <canvas id="myPieChart" width="100%" height="100" hidden></canvas>
                    <!--DO NOT TOUCH ON THIS SHIT ABOVE-->

                    <div class="card-header">
                        <i class="fa fa-pencil-square-o"></i>&nbsp;Thêm mới sản phẩm
                    </div>
                    <div class="card-body p-3">
                        <form>
                            <div class="input-group mb-3">
                                <!--Tên sản phẩm-->
                                <div class="input-group-prepend">
                                    <label class="input-group-text" for="inputNameProduct">Tên sản phẩm</label>
                                </div>
                                <input type="text" class="form-control" id="inputNameProduct" placeholder="Độ dài từ 1 đến 40 ký tự" minlength="1" maxlength="40" required>
                            </div>
                            <div class="row">
                                <div class="col-md-6 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="OldPrice">Giá gốc</label>
                                    </div>
                                    <!--Giá gốc-->
                                    <input type="text" class="form-control" id="OldPrice" placeholder="VD: 19000000" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text">VNĐ</span>
                                    </div>
                                </div>
                                <div class="col-md-6 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="SalePrice">Giá bán ra</label>
                                    </div>
                                    <!--Giá sale-->
                                    <input type="text" class="form-control" id="SalePrice" placeholder="VD: 12990000" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');">
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
                                    <input type="text" class="form-control" id="inputColorProduct" placeholder="Màu sắc của sản phẩm" maxlength="40" required>
                                </div>
                                <div class="col-md-6 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="inputTypeProduct">Loại sản phẩm</label>
                                    </div>
                                    <!--Loại sản phẩm-->
                                    <select class="custom-select" id="inputTypeProduct">
                                            <option  value="phone">Điện thoại</option>
                                            <option  selected value="laptop">Laptop</option>
                                    </select>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <!--Thêm nhiều ảnh-->
                                <input type="file" class="form-control" id="inputFile" accept="image/png, image/jpeg" multiple required>
                                <div class="input-group-append" >
                                    <label class="input-group-text" style="cursor: pointer" for="inputFile">Tải ảnh lên (có thể chọn nhiều ảnh)</label>
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
                                    <input type="text" class="form-control" id="inputRam" placeholder="VD: 16" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text">GB</span>
                                    </div>
                                </div>
                                <div class="col-md-4 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="inputRom">ROM</label>
                                    </div>
                                    <!--ROM-->
                                    <input type="text" class="form-control" id="inputRom" placeholder="VD: 512" maxlength="5" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');" required>
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
                                            <option selected value="android">Android</option>
                                            <option value="ios">IOS</option>
                                            <option value="window">Windows</option>
                                            <option value="macos">MacOS</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="screenProduct">Kích thước màn hình</label>
                                    </div>
                                    <!--Kích thước màn hình-->
                                    <input type="text" class="form-control" placeholder="VD: 15.6" maxlength="10" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');">
                                    <div class="input-group-append">
                                        <span class="input-group-text">Inchs</span>
                                    </div>
                                </div>
                                <div class="col-md-4 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="CpuProduct">CPU (Chipset)</label>
                                    </div>
                                    <!--CPU-->
                                    <input type="text" class="form-control" id="CpuProduct" placeholder="VD: Ryzen 7 4800H" maxlength="30">
                                </div>
                                <div class="col-md-4 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="GpuProduct">GPU (Card đồ họa)</label>
                                    </div>
                                    <!--GPU-->
                                    <input type="text" class="form-control" id="GpuProduct" placeholder="VD: Geforce RTX 3060 6GB" maxlength="30">
                                </div>
                            </div>
                            <div class="mb-3">
                                <h5 class="fw-bold">Mô tả sản phẩm</h5>
                            </div>
                            <div class="mb-3">
                                <textarea class="form-control border border-1 border-danger" rows="4" placeholder="Độ dài từ 1 đến 1000 ký tự" minlength="1" maxlength="1000" required></textarea>
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
