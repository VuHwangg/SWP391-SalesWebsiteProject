<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<script>

    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }

                        form.classList.add('was-validated')
                    }, false)
                })
    })()

            (function () {
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

                document.querySelector(".login-form #login-btn").addEventListener("click", function () {
                    let inputCaptchaValue = document.querySelector(".login-form .captcha input").value;
                    if (inputCaptchaValue === captchaValue) {
                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            title: 'Đăng nhập thành công',
                            showConfirmButton: false,
                            timer: 1500
                        })
                    } else {
                        Swal.fire({
                            position: 'center',
                            icon: 'error',
                            title: 'Sai mã captcha'
                        })
                    }
                });
            })();


</script>