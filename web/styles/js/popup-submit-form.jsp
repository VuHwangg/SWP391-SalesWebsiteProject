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

</script>