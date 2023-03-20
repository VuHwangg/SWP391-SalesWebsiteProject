<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<script>
//    Login Admin Form (Tạo mạo captcha -> Validate Captcha người dùng nhập -> Validate username password)
    (function () {
        'use strict'

        const fonts = ["cursive", "sans-serif", "serif", "monospace"];
        let captchaValue = "";

        function generateCaptcha() {
            let value = btoa(Math.random() * 1000000000);
            value = value.substr(0, 5 + Math.random() * 5);
            captchaValue = value;
        }

        function setCaptcha() {
            let captchaHTML = "";
            for (let i = 0; i < captchaValue.length; i++) {
                const captchaChar = captchaValue.charAt(i);
                const rotate = -20 + Math.trunc(Math.random() * 30);
                const font = Math.trunc(Math.random() * fonts.length);
                captchaHTML += "<span style=\"transform:rotate(" + rotate + "deg);font-family:" + fonts[font] + "\">" + captchaChar + "</span>";
            }
            document.querySelector(".login-form .captcha .preview").innerHTML = captchaHTML;
        }

        function initCaptcha() {
            document.querySelector(".login-form .captcha .captcha-refresh").addEventListener("click", function () {
                generateCaptcha();
                setCaptcha();
            });
            generateCaptcha();
            setCaptcha();
        }

        initCaptcha();

        $('#login-form').submit(function (event) {
            event.preventDefault();

            let inputCaptchaValue = document.querySelector(".login-form .captcha input").value;

            if (inputCaptchaValue !== captchaValue) {
                Swal.fire({
                    icon: 'warning',
                    title: 'Sai mã captcha',
                    confirmButtonText: 'Thử Lại'
                });
                return;
            } else {
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

            }


        });
    })();


//
//    $(document).ready(function () {
//        $('#login-form').submit(function (event) {
//            event.preventDefault();
//            let email = $('#username').val();
//            let password = $('#password').val();
//
//            $.ajax({
//                url: 'LoginEmpt',
//                type: 'POST',
//                data: {
//                    email: email,
//                    pass: password
//                },
//                success: function (data) {
//                    if (data === 'error') {
//                        Swal.fire({
//                            icon: 'error',
//                            title: 'Đăng nhập thất bại',
//                            text: 'Tài khoản hoặc mật khẩu của bạn không đúng',
//                            confirmButtonText: 'Thử Lại'
//                        });
//                    } else {
//                        Swal.fire({
//                            icon: 'success',
//                            title: 'Đăng nhập thành công',
//                            showConfirmButton: false,
//                            timer: 1500
//                        }).then(function () {
//                            window.location.href = 'dashmap';
//                        });
//                    }
//                },
//                error: function () {
//                    Swal.fire({
//                        icon: 'error',
//                        title: 'Đã xảy ra lỗi',
//                        text: 'Không thể kết nối đến máy chủ, vui lòng thử lại sau',
//                        confirmButtonText: 'Thử lại'
//                    });
//                }
//            });
//        });
//    });

//    Payment Submit Loading
    function submitPayment() {
        const name = document.getElementById('name');
        const phone = document.getElementById('phone');
        const email = document.getElementById('email');
        const address = document.getElementById('address');

        if (!name.checkValidity() || !phone.checkValidity() || !email.checkValidity()|| !address.checkValidity() ) {
        }else {
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


//    Sign up User Form
    $(document).ready(function () {
        $('#sign-up-user-form"').submit(function (event) {
            event.preventDefault();
            let name = $('#name').val();
            let phone = $('#phone').val();
            let img = $('#img').val();
            let address = $('#address').val();

            $.ajax({
                url: 'SignupUser',
                type: 'POST',
                data: {
                    name: name,
                    phone: phone,
                    img: img,
                    address: address
                },
                success: function (data) {
                    if (data === 'error') {
                        Swal.fire({
                            icon: 'error',
                            title: 'Đã xảy ra lỗi',
                            text: 'Có lỗi xảy ra, vui lòng thử lại',
                            confirmButtonText: 'Thử Lại'
                        });
                    } else {
                        Swal.fire({
                            icon: 'success',
                            title: 'Thành Công',
                            text: 'Bạn đã hoàn thiện đầy đủ thông tin',
                            showConfirmButton: false,
                            timer: 1500
                        }).then(function () {
                            window.location.href = 'home';
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