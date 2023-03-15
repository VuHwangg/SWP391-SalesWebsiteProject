<%@page import="util.Helper"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<jsp:useBean id="helper" class="util.Helper"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/admin-head.jsp" %>
        <%@include file="styles/css/admin-style.jsp" %>
        <title>Tra cứu lịch sử nhập hàng</title>

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
                    <li class="breadcrumb-item active">Tra cứu lịch sử nhập hàng</li>
                    <form action="importhistory" method="GET">
                        </br>
                        From: <input type="date" name="from" value="${requestScope.from}"/>
                        -
                        To: <input type="date" name="to" value="${requestScope.to}"/>

                        <input type="submit" value="View"/> 
                    </form>
                </ol>

                <!-- AREA CHART CARD -->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-area-chart"></i>&nbsp;Biểu đồ thống kê lịch sử nhập hàng theo ngày</div>
                    <div class="card-body">
                        <canvas id="myAreaChart" width="100%" height="20" ></canvas>
                    </div>
                </div>

                <!-- DATA TABLE CARD-->
                <div class="card mb-3">
                    <!--DO NOT TOUCH ON THIS SHIT BELOW-->
                    <canvas id="myBarChart" width="100" height="70" hidden></canvas>
                    <canvas id="myPieChart" width="100%" height="100" hidden></canvas>
                    <!--DO NOT TOUCH ON THIS SHIT ABOVE-->

                    <div class="card-header">
                        <span style="line-height: 1.8"><i class="fa fa-table"></i>&nbsp;Danh sách lịch sử nhập hàng</span>
                    </div>
                    <div class="card-body p-2">
                        <div class="table-responsive">
                            <table class="table-history table-striped table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead class="text-center bg-danger text-white">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Phân loại</th>
                                        <th>Màu sắc</th>
                                        <th>RAM</th>
                                        <th>ROM</th>
                                        <th>Giá nhập</th>
                                        <th>Số lượng</th>
                                        <th>Ngày nhập</th>
                                        <th>Người nhập</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">

                                    <!-- Sản phẩm-->
                                    <c:forEach items="${requestScope.historyList}" var="history">
                                        <tr>
                                            <td>${history.id}</td>
                                            <td>${history.product.name}</td>
                                            <td>${history.product.type}</td>
                                            <td>${history.product.color}</td>
                                            <td>${history.product.ram}<span>GB</span></td>
                                            <td>${history.product.memory}<span>GB</span></td>
                                            <td class="text-right">${helper.convertBigNum(history.cost)}&nbsp;&#8363;</td>
                                            <td>${history.num}</td>
                                            <td>${history.date}</td>
                                            <td>${history.account}</td>
                                        </tr>
                                    </c:forEach>                                   
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
        <%
            List<String> dayMonthList = (List<String>) request.getAttribute("dayMonthList");
            List<Double> totalCost = (List<Double>) request.getAttribute("totalCost");
            double x = Helper.findTopOfY(totalCost);
        %>
        <script>
            var dayMonthList = <%= new Gson().toJson(dayMonthList)%>;
            var totalCost = <%= new Gson().toJson(totalCost)%>;
            var x = <%= new Gson().toJson(x)%>;

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
                    labels: dayMonthList,
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
                            data: totalCost,
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
                    labels: ["January", "February", "March", "April", "May", "June"],
                    datasets: [{
                            label: "Revenue",
                            backgroundColor: "rgba(2,117,216,1)",
                            borderColor: "rgba(2,117,216,1)",

                            // Input data below
                            data: [4215, 5312, 6251, 7841, 9821, 14984],
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
                                    max: 15000,
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
        </script>
    </body>
</html>
