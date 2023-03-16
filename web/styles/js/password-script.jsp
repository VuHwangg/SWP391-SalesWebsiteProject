<script>
    $(document).ready(function () {
        $(".toggle-password").on('click', function (event) {
            event.preventDefault();
            var passwordField = $(this).closest('.input-group').find('.password-toggle');
            var passwordToggleIcon = $(this).find('i');

            if (passwordField.attr("type") == "text") {
                passwordField.attr('type', 'password');
                passwordToggleIcon.addClass("fa-eye-slash");
                passwordToggleIcon.removeClass("fa-eye");
                passwordField.attr('maxlength', '8'); 
            } else if (passwordField.attr("type") == "password") {
                passwordField.attr('type', 'text');
                passwordToggleIcon.removeClass("fa-eye-slash");
                passwordToggleIcon.addClass("fa-eye");
                passwordField.removeAttr('maxlength');
            }
        });
    });


</script>