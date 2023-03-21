<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<script>
    //    Admin register Form
    $(document).ready(function () {
        $('#admin-register-form').submit(function (event) {
            event.preventDefault();

            const name = document.getElementById('name');
            const username = document.getElementById('username');
            const password = document.getElementById('password');
            const rePassword = document.getElementById('re-password');

            if (!name.checkValidity() || !username.checkValidity() || !password.checkValidity() || !rePassword.checkValidity()) {
                
                let timerInterval
                Swal.fire({
                    icon: 'error',
                    title: 'Vui lòng điền đẩy đủ thông tin',
                    confirmButtonText: 'Thử lại'
                });
                
                
            } else {
                
                var form = $(this);
                var formData = form.serialize();

                $.ajax({
                    url: 'SignupEmpt',
                    type: 'POST',
                    data: formData,
                    success: function (data) {
                        if (data === 'error') {
                            console.log(data);
                            Swal.fire({
                                icon: 'error',
                                title: 'Tên đăng nhập đã tồn tại',
                                confirmButtonText: 'Thử Lại'
                            });
                        } else {
                            console.log(data);
                            Swal.fire({
                                icon: 'success',
                                title: 'Thêm nhân viên thành công',
                                showConfirmButton: false,
                                timer: 1500
                            }).then(function () {
                                window.location.href = 'controllerEmployee';
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
    });
</script>