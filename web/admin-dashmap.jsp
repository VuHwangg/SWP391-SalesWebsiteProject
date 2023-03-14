
<%@page import="util.Helper"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
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
                    <form action="dashmap" method="GET">
                        </br>
                        From: <input type="date" name="from" value="${requestScope.from}"/>
                        -
                        To: <input type="date" name="to" value="${requestScope.to}"/>

                        <input type="submit" value="View"/> 
                    </form>
                </ol>

                <!--                 Icon Cards
                                <div class="row">
                
                                     CARD 1 
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
                
                                     CARD 2 
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
                
                                     CARD 3 
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
                
                                     CARD 4 
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
                                </div>-->


                <!-- AREA CHART CARD -->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-area-chart"></i>&nbsp;Biểu đồ thống kê lịch sử nhập hàng theo ngày</div>
                    <div class="card-body">                       
                        <canvas id="myAreaChart" width="100%" height="30" ></canvas>
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
                                    <!--                                    <div class="col-sm-4 text-center my-auto">
                                                                             Số liệu  
                                                                            <div class="h4 mb-0 text-primary">
                                                                                 1 
                                                                                34,693 <span class="text-dark">VNĐ</span>
                                                                            </div>
                                                                            <div class="small text-muted">Blue Data</div>
                                                                            <hr>
                                                                            <div class="h4 mb-0 text-warning">
                                                                                 2 
                                                                                18,474 <span class="text-dark">VNĐ</span>
                                                                            </div>
                                                                            <div class="small text-muted">Yellow Data</div>
                                                                            <hr>
                                                                            <div class="h4 mb-0 text-success">
                                                                                 3 
                                                                                16,219 <span class="text-dark">VNĐ</span>
                                                                            </div>
                                                                            <div class="small text-muted">Green Data</div>
                                                                        </div>-->
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
        <%
            List<String> dayMonthList = (List<String>) request.getAttribute("dayMonthList");
            List<Double> totalPrice = (List<Double>) request.getAttribute("totalPrice");
            List<String> phoneBrandNames = (List<String>) request.getAttribute("phoneBrandNames");
            List<Integer> numOfPhones = (List<Integer>) request.getAttribute("numOfPhones");
            double x = Helper.findTopOfY(totalPrice);
            double y = Helper.findTopOfYForInt(numOfPhones);
        %>
        <script>
            var dayMonth = <%= new Gson().toJson(dayMonthList)%>;
            var price = <%= new Gson().toJson(totalPrice)%>;
            var phoneBrandNames = <%= new Gson().toJson(phoneBrandNames)%>;
            var numOfPhones = <%= new Gson().toJson(numOfPhones)%>;
            var x = <%= new Gson().toJson(x)%>;
            var y = <%= new Gson().toJson(y)%>;
        </script>
        <script>

            // Chart.js scripts
// -- Set new default font family and font color to mimic Bootstrap's default styling
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';


// -- AREA CHART DATA 1
            var ctx = document.getElementById("myAreaChart");
            var myLineChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: dayMonth,
                    datasets: [{
                            label: "Sessions",
                            lineTension: 0.3,
                            backgroundColor: "rgba(2,117,216,0.2)",
                            borderColor: "rgba(2,117,216,1)",
                            pointRadius: 5,
                            pointBackgroundColor: "rgba(2,117,216,1)",
                            pointBorderColor: "rgba(255,255,255,0.8)",
                            pointHoverRadius: 5,
                            pointHoverBackgroundColor: "rgba(2,117,216,1)",
                            pointHitRadius: 20,
                            pointBorderWidth: 2,

                            // Input data below
                            data: price,
                        }],
                },
                options: {
                    scales: {
                        xAxes: [{
                                time: {
                                    unit: 'date'
                                },
                                gridLines: {
                                    display: false
                                },
                                ticks: {
                                    maxTicksLimit: 7
                                }
                            }],
                        yAxes: [{
                                ticks: {
                                    min: 0,
                                    max: x,
                                    maxTicksLimit: 5
                                },
                                gridLines: {
                                    color: "rgba(0, 0, 0, .125)",
                                }
                            }],
                    },
                    legend: {
                        display: false
                    }
                }
            });

// -- BAR CHART DATA
            var ctx = document.getElementById("myBarChart");
            var myLineChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: phoneBrandNames,
                    datasets: [{
                            label: "Revenue",
                            backgroundColor: "rgba(2,117,216,1)",
                            borderColor: "rgba(2,117,216,1)",

                            // Input data below
                            data: numOfPhones,
                        }],
                },
                options: {
                    scales: {
                        xAxes: [{
                                time: {
                                    unit: 'month'
                                },
                                gridLines: {
                                    display: false
                                },
                                ticks: {
                                    maxTicksLimit: 6
                                }
                            }],
                        yAxes: [{
                                ticks: {
                                    min: 0,
                                    max: y,
                                    maxTicksLimit: 5
                                },
                                gridLines: {
                                    display: true
                                }
                            }],
                    },
                    legend: {
                        display: false
                    }
                }
            });


// -- PIE CHART DATA
            var ctx = document.getElementById("myPieChart");
            var myPieChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: ["Blue", "Red", "Yellow", "Green"],
                    datasets: [{

                            // Input data below
                            data: [12.21, 15.58, 11.25, 8.32],
                            backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
                        }],
                },
            });

            $(document).ready(function () {
                $('#dataTable').DataTable();
            });

            (function ($) {
                "use strict"; // Start of use strict
                // Configure tooltips for collapsed side navigation
                $('.navbar-sidenav [data-toggle="tooltip"]').tooltip({
                    template: '<div class="tooltip navbar-sidenav-tooltip" role="tooltip" style="pointer-events: none;"><div class="arrow"></div><div class="tooltip-inner"></div></div>'
                })
                // Toggle the side navigation
                $("#sidenavToggler").click(function (e) {
                    e.preventDefault();
                    $("body").toggleClass("sidenav-toggled");
                    $(".navbar-sidenav .nav-link-collapse").addClass("collapsed");
                    $(".navbar-sidenav .sidenav-second-level, .navbar-sidenav .sidenav-third-level").removeClass("show");
                });
                // Force the toggled class to be removed when a collapsible nav link is clicked
                $(".navbar-sidenav .nav-link-collapse").click(function (e) {
                    e.preventDefault();
                    $("body").removeClass("sidenav-toggled");
                });
                // Prevent the content wrapper from scrolling when the fixed side navigation hovered over
                $('body.fixed-nav .navbar-sidenav, body.fixed-nav .sidenav-toggler, body.fixed-nav .navbar-collapse').on('mousewheel DOMMouseScroll', function (e) {
                    var e0 = e.originalEvent,
                            delta = e0.wheelDelta || -e0.detail;
                    this.scrollTop += (delta < 0 ? 1 : -1) * 30;
                    e.preventDefault();
                });
                // Scroll to top button appear
                $(document).scroll(function () {
                    var scrollDistance = $(this).scrollTop();
                    if (scrollDistance > 100) {
                        $('.scroll-to-top').fadeIn();
                    } else {
                        $('.scroll-to-top').fadeOut();
                    }
                });
                // Configure tooltips globally
                $('[data-toggle="tooltip"]').tooltip()
                // Smooth scrolling using jQuery easing
                $(document).on('click', 'a.scroll-to-top', function (event) {
                    var $anchor = $(this);
                    $('html, body').stop().animate({
                        scrollTop: ($($anchor.attr('href')).offset().top)
                    }, 1000, 'easeInOutExpo');
                    event.preventDefault();
                });
            })(jQuery); // End of use strict


            // Edit Status of each order
            $(document).ready(function () {
                $(".change-status-btn").on('click', function (event) {
                    event.preventDefault();
                    var disableEdit = $(this).closest('.change-order-status').find('.edit-off');
                    var enableEdit = $(this).closest('.change-order-status').find('.edit-on');

                    if (enableEdit.hasClass('disable')) {
                        disableEdit.addClass("disable");
                        enableEdit.removeClass("disable");
                    } else if (disableEdit.hasClass('disable')) {
                        enableEdit.addClass("disable");
                        disableEdit.removeClass("disable");
                    }
                });
            });

            // Quantity input -----------------------------
            // Get all the quantity input tags on the page
            const quantityInputs = document.querySelectorAll('.quantity-input');

            // Add click event listeners to each of the quantity input tags
            quantityInputs.forEach(function (quantityInput) {
                const quantity = quantityInput.querySelector('.quantity');
                const numberInputs = document.querySelectorAll('.numberInputHidden');

                quantity.addEventListener('input', function () {
                    validateInput(quantity);
                });

                quantity.addEventListener('blur', function () {
                    validateInput(quantity);
                });

                function validateInput(input) {
                    let value = parseInt(input.value);
                    if (isNaN(value) || value < 1 || value > 9999) {
                        alert('Value must be an integer, greater than 0 and less than 100!');
                        input.value = 1;
                    } else {
                        input.value = value;
                    }
                }
            });

        </script>
    </body>
</html>
