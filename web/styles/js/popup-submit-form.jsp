<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<script>

//    Login Admin Form
    $(document).ready(function () {
        $('#login-form').submit(function (event) {
            event.preventDefault();
            let email = $('#username').val();
            let password = $('#password').val();

            $.ajax({
                url: 'LoginEmpt',
                type: 'POST',
                data: {
                    email: email,
                    pass: password
                },
                success: function (data) {
                    if (data === 'error') {
                        Swal.fire({
                            icon: 'error',
                            title: 'Đăng nhập thất bại',
                            text: 'Tài khoản hoặc mật khẩu của bạn không đúng',
                            confirmButtonText: 'Thử Lại'
                        });
                    } else {
                        Swal.fire({
                            icon: 'success',
                            title: 'Đăng nhập thành công',
                            showConfirmButton: false,
                            timer: 1500
                        }).then(function () {
                            window.location.href = 'dashmap';
                        });
                    }
                },
                error: function () {
                    Swal.fire({
                        icon: 'error',
                        title: 'Đã xảy ra lỗi',
                        text: 'Không thể kết nối đến máy chủ, vui lòng thử lại sau',
                        confirmButtonText: 'Thử lại'
                    });
                }
            });
        });
    });

//    Payment Submit Loading
    function submitPayment() {
        let timerInterval
        Swal.fire({
            title: 'Đăng tiến hành đặt hàng',
            text: 'Bạn vui lòng chờ trong giây lát',
            allowOutsideClick: false,
            timer: 30000,
            didOpen: () => {
                Swal.showLoading()
            },
            willClose: () => {
                clearInterval(timerInterval)
            }
        })
    }


//    Payment Form
    $(document).ready(function () {
        $('#payment-form').submit(function (event) {
            event.preventDefault();
            let name = $('#name').val();
            let phone = $('#phone').val();
            let email = $('#email').val();
            let address = $('#address').val();

            $.ajax({
                url: 'Payment2',
                type: 'POST',
                data: {
                    name: name,
                    phone: phone,
                    email: email,
                    address: address
                },
                success: function (data) {
                    if (data === 'error') {
                        Swal.fire({
                            icon: 'error',
                            title: 'Đặt hàng thất bại',
                            text: 'Có lỗi xảy ra, vui lòng thử lại',
                            confirmButtonText: 'Thử Lại'
                        });
                    } else {
                        Swal.fire({
                            icon: 'success',
                            title: 'Đặt hàng thành công',
                            showConfirmButton: false,
                            timer: 3000
                        }).then(function () {
                            window.location.href = 'cart';
                        });
                    }
                },
                error: function () {
                    Swal.fire({
                        icon: 'error',
                        title: 'Đã xảy ra lỗi',
                        text: 'Không thể kết nối đến máy chủ, vui lòng thử lại sau',
                        confirmButtonText: 'Thử lại'
                    });
                }
            });
        });
    });

</script>