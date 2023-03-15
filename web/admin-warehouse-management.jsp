<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/admin-head.jsp" %>
        <%@include file="styles/css/admin-style.jsp" %>
        <title>Quản lý kho hàng</title>

    </head>
    <body class="fixed-nav sticky-footer bg-danger" id="page-top">

        <!-- NAVIGATION BAR-->
        <%@include file="components/admin-navbar.jsp" %>

        <!-- CONTENT PART -->
        <div class="content-wrapper">
            <div class="container-fluid">

                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <!-- <li class="breadcrumb-item">
                      <a href="#">Thống kê</a>
                    </li> -->
                    <li class="breadcrumb-item active">Quản lý kho hàng</li>
                </ol>

                <!-- Icon Cards-->
                <div class="row">
                    <!-- CARD 1 -->
                    <div class="col-md-4 mb-3">
                        <div class="card card-r2 o-hidden h-100">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div class="mr-3">
                                        <div>
                                            <h4>Tổng số sản phẩm</h4>
                                        </div>
                                        <span style="font-size: 17px">Số lượng: 
                                            <span class="text-danger" style="font-weight: 700; font-size: 18px">
                                                6&nbsp;sản phẩm
                                            </span>
                                        </span>
                                    </div>
                                    <div>
                                        <div class="icon-card-custom bg-danger text-white">
                                           <i class="bi bi-basket-fill"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--<a href="#" class="card-footer bg-danger text-white z-1">
                                    Xem chi tiết 
                            </a>-->
                        </div>
                    </div>

                    <!-- CARD 2 -->
                    <div class="col-md-4 mb-3">
                        <div class="card card-r2 o-hidden h-100">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div class="mr-3">
                                        <div>
                                            <h4>Tổng số điện thoại</h4>
                                        </div>
                                        <span style="font-size: 17px">Số lượng: 
                                            <span class="text-danger" style="font-weight: 700; font-size: 18px">
                                                2&nbsp;sản phẩm
                                            </span>
                                        </span>
                                    </div>
                                    <div>
                                        <div class="icon-card-custom bg-danger text-white">
                                            <i class="bi bi-phone-fill"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--<a href="#" class="card-footer bg-danger text-white z-1">
                                   Xem chi tiết 
                           </a>-->
                        </div>
                    </div>

                    <!-- CARD 3 -->
                    <div class="col-md-4 mb-3">
                        <div class="card card-r2 o-hidden h-100">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div class="mr-3">
                                        <div>
                                            <h4>Tổng số laptop</h4>
                                        </div>
                                        <span style="font-size: 17px">Số lượng: 
                                            <span class="text-danger" style="font-weight: 700; font-size: 18px">
                                                4&nbsp;sản phẩm
                                            </span>
                                        </span>
                                    </div>
                                    <div>
                                        <div class="icon-card-custom bg-danger text-white">
                                            <i class="bi bi-laptop-fill"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--<a href="#" class="card-footer bg-danger text-white z-1">
                                   Xem chi tiết 
                           </a>-->
                        </div>
                    </div>
                </div>

                <!-- DATA TABLE CARD-->
                <div class="card mb-3">

                    <!--DO NOT TOUCH ON THIS SHIT BELOW-->
                    <canvas id="myAreaChart" width="100%" height="30" hidden></canvas>
                    <canvas id="myBarChart" width="100" height="70" hidden></canvas>
                    <canvas id="myPieChart" width="100%" height="100" hidden></canvas>
                    <!--DO NOT TOUCH ON THIS SHIT ABOVE-->

                    <div class="card-header">
                        <span style="line-height: 1.8"><i class="fa fa-table"></i>&nbsp;Danh sách sản phẩm trong kho</span>
                        <a class="add-btn btn btn-danger text-white" href="AddNewProduct" style="float: right"><i class="fa fa-plus-circle"></i> Thêm sản phẩm</a>
                    </div>
                    <div class="card-body p-2">
                        <div class="table-responsive">
                            <table class="table-wareh table-striped table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead class="text-center bg-danger text-white">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Phân loại</th>
                                        <th>Hãng sản xuất</th>
                                        <th>Màu sắc</th>
                                        <th>RAM</th>
                                        <th>ROM</th>
                                        <th>Số lượng</th>
                                        <th>Quản lý</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">
                                    <!-- Sản phẩm-->
                                    <tr>
                                        <td>1</td>
                                        <td class="text-left">Asus Gaming</td>
                                        <td>Điện thoại</td>
                                        <td>Apple</td>
                                        <td>Gray</td>
                                        <td>16<span>GB</span></td>
                                        <td>512<span>GB</span></td>
                                        <td>
                                            <div class="change-order-status">
                                                <div class="edit-off">
                                                    <span class="text-center">55000</span>
<!--                                                    <a class="change-status-btn text-danger" href="" style="float: right" data-toggle="tooltip" data-placement="top" title="Thay đổi số lượng sản phẩm">
                                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                    </a>-->
                                                </div>
                                                <div class="edit-on disable">
                                                    <form>
                                                        <div class="d-flex quantity-input">
                                                            <input type="number" class="form-control quantity text-center" style="border: 3px solid #dc3536;" value="1" min="1" max="9999" />&nbsp;
                                                            <input type="submit" class="btn btn-danger" style="padding: 4px 6px" value="Lưu">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex ">
                                                <!-- Button trigger modal -->
                                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#addProductModal">
                                                    Thêm số lượng
                                                </button>

                                                <!-- Modal -->
                                                <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="addProductModal" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <form>
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title">Thêm số lượng sản phẩm mới</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="input-group w-100 mb-3">
                                                                        <div class="input-group-prepend">
                                                                            <label class="input-group-text" for="inputQuantity">Số lượng</label>
                                                                        </div>
                                                                        <input type="text" class="form-control text-center" id="inputQuantity" placeholder="VD: 16" maxlength="6" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');" required>
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text">sản phẩm</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="input-group w-100 mb-3">
                                                                        <div class="input-group-prepend">
                                                                            <label class="input-group-text" for="inputPrice">Giá nhập</label>
                                                                        </div>
                                                                        <input type="text" class="form-control text-center" id="inputPrice" placeholder="VD: 19000000" maxlength="10" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');" required>
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text">VNĐ</span>
                                                                        </div>
                                                                    </div>
                                                                    <p class="text-danger m-0">* THAO TÁC LƯU SẼ KHÔNG THỂ HOÀN TÁC *<br>bạn vui lòng kiểm tra kỹ thông tin trước khi ấn nút lưu</p>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <input type="submit" class="btn btn-danger w-100" value="Lưu">
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

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
