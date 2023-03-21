

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<script>
    //    Sign up User Form
    $(document).ready(function () {
        $('#sign-up-user-form').submit(function (event) {
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