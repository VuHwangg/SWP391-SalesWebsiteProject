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
            labels: ["Mar 1", "Mar 2", "Mar 3", "Mar 4", "Mar 5", "Mar 6", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 12", "Mar 13"],
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
                    data: [10000, 30162, 26263, 18394, 18287, 28682, 31274, 33259, 25849, 24159, 32651, 31984, 38451],
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
                            max: 40000,
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
    
    // Quantity input -----------------------------
        // Get all the quantity input tags on the page
        const quantityInputs = document.querySelectorAll('.quantity-input');

        // Add click event listeners to each of the quantity input tags
        quantityInputs.forEach(function(quantityInput) {
          const quantity = quantityInput.querySelector('.quantity');
          const numberInputs = document.querySelectorAll('.numberInputHidden');

          quantity.addEventListener('input', function() {
            validateInput(quantity);
          });

          quantity.addEventListener('blur', function() {
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