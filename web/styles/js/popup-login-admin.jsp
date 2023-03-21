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
            console.log(value);
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
                var form = $(this);
                var formData = form.serialize();
                $.ajax({
                    url: 'LoginEmpt',
                    type: 'POST',
                    data: formData,
                    success: function (data) {
                        if (data === 'error') {
                            console.log(data);
                            Swal.fire({
                                icon: 'error',
                                title: 'Đăng nhập thất bại',
                                text: 'Tài khoản hoặc mật khẩu của bạn không đúng',
                                confirmButtonText: 'Thử Lại'
                            });
                        } else if (data === 'admin') {
                            console.log(data);
                            Swal.fire({
                                icon: 'success',
                                title: 'Đăng nhập thành công',
                                text: 'Bạn đang đăng nhập trong vai trò Quản Trị Viên',
                                showConfirmButton: false,
                                timer: 1500
                            }).then(function () {
                                window.location.href = 'dashmap';
                            });
                        } else if (data === 'seller') {
                            console.log(data);
                            Swal.fire({
                                icon: 'success',
                                title: 'Đăng nhập thành công',
                                text: 'Bạn đang đăng nhập trong vai trò Người Bán Hàng',
                                showConfirmButton: false,
                                timer: 1500
                            }).then(function () {
                                window.location.href = 'ProductManagement';
                            });
                        } else {
                            console.log(data);
                            Swal.fire({
                                icon: 'success',
                                title: 'Đăng nhập thành công',
                                text: 'Bạn đang đăng nhập trong vai trò Người Quản Kho',
                                showConfirmButton: false,
                                timer: 1500
                            }).then(function () {
                                window.location.href = 'WarehouseManagment';
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
</script>