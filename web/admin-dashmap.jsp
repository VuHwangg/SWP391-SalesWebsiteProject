
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

                </ol>

                <div class="row">

                    <!-- CARD 1 -->
                    <div class="col-md-4 mb-3">
                        <div class="card card-r2 o-hidden h-100">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div class="mr-3">
                                        <div>
                                            <h4>Tổng số doanh thu</h4>
                                        </div>
                                        <span style="font-size: 17px">Số lượng: 
                                            <span class="text-danger" style="font-weight: 700; font-size: 18px">
                                                1,892,000,000&nbsp;VNĐ
                                            </span>
                                        </span>
                                    </div>
                                    <div>
                                        <div class="icon-card-custom bg-danger text-white">
                                            <i class="bi bi-cash-coin"></i>
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
                                            <h4>Tổng số mặt hàng</h4>
                                        </div>
                                        <span style="font-size: 17px">Số lượng: 
                                            <span class="text-danger" style="font-weight: 700; font-size: 18px">
                                                60&nbsp;mặt hàng
                                            </span>
                                        </span>
                                    </div>
                                    <div>
                                        <div class="icon-card-custom bg-danger text-white">
                                            <i class="bi bi-box-seam-fill"></i>
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
                                            <h4>Tổng số sản phẩm</h4>
                                        </div>
                                        <span style="font-size: 17px">Số lượng: 
                                            <span class="text-danger" style="font-weight: 700; font-size: 18px">
                                                19,034&nbsp;sản phẩm
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
                </div>

                <!-- AREA CHART CARD -->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-area-chart"></i>&nbsp;Biểu đồ thống kê doanh thu
                    </div>
                    <div class="d-flex justify-content-end mt-3" style="padding: 0 12px">
                        <form action="dashmap" method="GET">
                            <div class="d-flex align-items-center">
                                <div>
                                    <input type="date" name="from" value="${requestScope.from}"/>
                                    <i class="bi bi-arrow-right"></i>
                                    <input type="date" name="to" value="${requestScope.to}"/>
                                </div>
                                <input class="btn btn-danger ml-2" type="submit" value="Lọc" style="padding: 2px 10px; font-weight: 700"/> 
                            </div>
                        </form>
                    </div>
                    <div class="card-body">                       
                        <canvas id="myAreaChart" width="100%" height="25" ></canvas>
                    </div>
                    <!-- <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
                </div>


                <div class="row mb-3">
                    <div class="col-md-8 ">
                        <!-- BAR CHART CARD-->
                        <div class="card h-100">
                            <div class="card-header">
                                <i class="fa fa-bar-chart"></i>&nbsp;Biểu đồ thống kê số lượng mặt hàng</div>
                            <div class="card-body">
                                <canvas id="myBarChart" width="100" height="70" hidden></canvas>
                                <div id="double-column-chart" class="w-100 h-100"></div>
                            </div>
                            <!-- <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
                        </div>
                    </div>

                    <div class="col-md-4 ">
                        <!-- PIE CHART CARD-->
                        <div class="card h-100">
                            <div class="card-header">
                                <i class="fa fa-pie-chart"></i>&nbsp;Biểu đồ thống kê số lượng nhân viên</div>
                            <div class="card-body">
                                <canvas id="myPieChart" width="100%" height="100"></canvas>
                            </div>
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
            List<String> brandNames = (List<String>) request.getAttribute("brandNames");
            List<Integer> numOfPhones = (List<Integer>) request.getAttribute("numOfPhones");
            List<Integer> numOfLaps = (List<Integer>) request.getAttribute("numOfLaps");
            double x = Helper.findTopOfY(totalPrice);
            double y = Helper.findTopOfYForInt(numOfPhones);
        %>
        <script>
            var dayMonth = <%= new Gson().toJson(dayMonthList)%>;
            var price = <%= new Gson().toJson(totalPrice)%>;
            var brandNames = <%= new Gson().toJson(brandNames)%>;
            var numOfPhones = <%= new Gson().toJson(numOfPhones)%>;
            var numOfLaps = <%= new Gson().toJson(numOfLaps)%>;
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
                    labels: brandNames,
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

// DOUBLE COLUMN CHART DATA
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ' '
                },
                colors: ['#28a745', '#ffc107']
            })
            Highcharts.chart('double-column-chart', {
                chart: {
                    type: 'column',
                    zoomType: 'y',
                    //backgroundColor:"#FBFAE4"
                },
                title: {
                    text: ''
                },
                subtitle: {
                    text: ''
                },
                xAxis: {
                    categories: brandNames,
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Số lượng sản phẩm'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px"><b>{point.key}</b></span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                            '<td style="padding:0"><b>{point.y}</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: [{
                        name: 'Điện thoại',
                        data: numOfPhones

                    }, {
                        name: 'Laptop',
                        data: numOfLaps

                    }]
            });


        </script>
    </body>
</html>
