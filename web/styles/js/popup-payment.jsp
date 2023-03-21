<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<script>
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
                timer: 60000,
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
</script>