
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/admin-head.jsp" %>
        <%@include file="styles/css/admin-style.jsp" %>
        <title>Thống kê</title>
        
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
                    <li class="breadcrumb-item active">Thống kê</li>
                </ol>

                <!-- Icon Cards-->
                <div class="row">

                    <!-- CARD 1 -->
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="card card-r1 text-white bg-primary o-hidden h-100">
                            <div class="card-body mr-5">
                                <div class="card-body-icon">
                                    <i class="fa fa-fw fa-comments"></i>
                                </div>
                                <div>
                                    <span>Số liệu 1</span>
                                </div>
                            </div>
                            <a class="card-footer text-white z-1">
                                <span class="mr-5">2,000</span>
                            </a>
                        </div>
                    </div>

                    <!-- CARD 2 -->
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="card card-r1 text-white bg-danger o-hidden h-100">
                            <div class="card-body mr-5">
                                <div class="card-body-icon">
                                    <i class="fa fa-fw fa-list"></i>
                                </div>
                                <div>
                                    <span>Số liệu 2</span>
                                </div>
                            </div>
                            <a class="card-footer text-white z-1">
                                <span class="mr-5">2,000,000</span>
                            </a>
                        </div>
                    </div>

                    <!-- CARD 3 -->
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="card card-r1 text-white bg-warning o-hidden h-100">
                            <div class="card-body mr-5">
                                <div class="card-body-icon">
                                    <i class="fa fa-fw fa-shopping-cart"></i>
                                </div>
                                <div>
                                    <span>Số liệu 3</span>
                                </div>
                            </div>
                            <a class="card-footer text-white z-1">
                                <span class="mr-5">200</span>
                            </a>
                        </div>
                    </div>

                    <!-- CARD 4 -->
                    <div class="col-xl-3 col-sm-6 mb-3">
                        <div class="card card-r1 text-white bg-success o-hidden h-100">
                            <div class="card-body mr-5">
                                <div class="card-body-icon">
                                    <i class="fa fa-fw fa-support"></i>
                                </div>
                                <div>
                                    <span>Số liệu 4</span>
                                </div>
                            </div>
                            <a class="card-footer text-white z-1">
                                <span class="mr-5">50</span>
                            </a>
                        </div>
                    </div>
                </div>


                <!-- AREA CHART CARD -->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-area-chart"></i> Area Chart Example</div>
                    <div class="card-body">

                        <!-- Nhập số liệu vào bảng ở bên file "admin-script.js" phần "AREA CHART DATA" -->
                        <div id="chart"></div>
                        <canvas id="myAreaChart" width="100%" height="30" hidden=""></canvas>

                    </div>
                    <!-- <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
                </div>


                <div class="row">
                    <div class="col-lg-8">

                        <!-- BAR CHART CARD-->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fa fa-bar-chart"></i> Bar Chart Example</div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-8 my-auto">

                                        <!-- Nhập số liệu vào bảng ở bên file "admin-script.js" phần "BAR CHART DATA" -->
                                        <canvas id="myBarChart" width="100" height="70"></canvas>

                                    </div>
                                    <div class="col-sm-4 text-center my-auto">
                                        <!-- Số liệu  -->
                                        <div class="h4 mb-0 text-primary">
                                            <!-- 1 -->
                                            34,693 <span class="text-dark">VNĐ</span>
                                        </div>
                                        <div class="small text-muted">Blue Data</div>
                                        <hr>
                                        <div class="h4 mb-0 text-warning">
                                            <!-- 2 -->
                                            18,474 <span class="text-dark">VNĐ</span>
                                        </div>
                                        <div class="small text-muted">Yellow Data</div>
                                        <hr>
                                        <div class="h4 mb-0 text-success">
                                            <!-- 3 -->
                                            16,219 <span class="text-dark">VNĐ</span>
                                        </div>
                                        <div class="small text-muted">Green Data</div>
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
                        </div>
                    </div>
                    
                    <div class="col-lg-4">
                        <!-- PIE CHART CARD-->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fa fa-pie-chart"></i> Pie Chart Example</div>
                            <div class="card-body">

                                <!-- Nhập số liệu vào bảng ở bên file "admin-script.js" phần "PIE CHART DATA" -->
                                <canvas id="myPieChart" width="100%" height="100"></canvas>

                            </div>
                            <!-- <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid-->
            <!-- /.content-wrapper-->
            <%@include file="components/admin-footer.jsp" %>
        </div>
        <%@include file="components/admin-footer-link.jsp" %>
        <%@include file="styles/js/admin-script.jsp" %>
        <%@include file="styles/js/admin-script-additional.jsp" %>
    </body>
</html>
