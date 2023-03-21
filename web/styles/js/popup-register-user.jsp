

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<script>
    //    Sign up User Form
    $(document).ready(function () {
        $('#sign-up-user-form').submit(function (event) {
            event.preventDefault();

            var form = $(this);
            var formData = form.serialize();

            $.ajax({
                url: 'SignupUser',
                type: 'POST',
                data: formData,
                success: function (data) {
                    if (data === 'error') {
                        console.log(data);
                        Swal.fire({
                            icon: 'error',
                            title: 'Đã xảy ra lỗi',
                            text: 'Có lỗi xảy ra, vui lòng thử lại',
                            confirmButtonText: 'Thử Lại'
                        });
                    } else {
                        Swal.fire({
                            icon: 'success',
                            title: 'Đăng Ký Tài Khoản Thành Công',
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