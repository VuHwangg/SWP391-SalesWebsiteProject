<style>
    @import url(//fonts.googleapis.com/css?family=Lato:300:400);
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@800&amp;display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Fredoka+One&family=Pacifico&family=Tourney&display=swap');
    * {
        margin:0px;
        padding:0px;
        box-sizing:border-box;
    }
    body {
        font-family:"Roboto",sans-serif;
        background:#f5f5f5;
    }

    h1 {
        font-family: 'Lato', sans-serif;
        font-weight:300;
        letter-spacing: 2px;
        font-size:48px;
        margin-top: 70px;
    }
    p {
        font-family: 'Lato', sans-serif;
        letter-spacing: 1px;
        font-size:14px;
        color: #333333;
    }

    .header {
        position:relative;
        text-align:center;
        background: linear-gradient(60deg, rgba(220,53,69,1) 0%, rgba(54,30,48,1) 100%);
        color:white;
    }
    .logo {
        width:50px;
        fill:white;
        padding-right:15px;
        display:inline-block;
        vertical-align: middle;
    }

    .inner-header {
        height:45vh;
        width:100%;
        margin: 0;
        padding: 0;
    }

    .waves {
        position:relative;
        width: 100%;
        height:15vh;
        margin-bottom:-7px; /*Fix for safari gap*/
        min-height:100px;
        max-height:150px;
    }

    .content {
        position:relative;
        height:20vh;
        text-align:center;
        background-color: white;
    }

    /* Animation */

    .parallax > use {
        animation: move-forever 25s cubic-bezier(.55,.5,.45,.5)     infinite;
    }
    .parallax > use:nth-child(1) {
        animation-delay: -2s;
        animation-duration: 7s;
    }
    .parallax > use:nth-child(2) {
        animation-delay: -3s;
        animation-duration: 10s;
    }
    .parallax > use:nth-child(3) {
        animation-delay: -4s;
        animation-duration: 13s;
    }
    .parallax > use:nth-child(4) {
        animation-delay: -5s;
        animation-duration: 20s;
    }
    @keyframes move-forever {
        0% {
            transform: translate3d(-90px,0,0);
        }
        100% {
            transform: translate3d(85px,0,0);
        }
    }
    /*Shrinking for mobile*/
    @media (max-width: 768px) {
        .waves {
            height:40px;
            min-height:40px;
        }
        .content {
            height:30vh;
        }
        .login-form .form-title h1 {
            font-size:32px;
        }
        .login-form .form-title span {
            display: none;
        }
    }

    /*Back button*/
    .back-btn {
        position:absolute;
        top:5%;
        left:3%;
    }

    .back-btn a {
        cursor: pointer;
        font-size: 18px;
        font-weight: 700;
        color: #fff !important;
        text-decoration: none;
    }

    .back-btn a span {
        transition: all 0.4s ease;
    }

    .back-btn a span:hover {
        padding-left: 8px;
    }

    /*Login Form*/
    .login-form {
        position:absolute;
        top:50%;
        left:50%;
        transform:translate(-50%,-50%);
        width:90%;
        max-width:450px;
        background:#fff;
        padding:20px 30px;
        box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px 2px, rgba(0, 0, 0, 0.09) 0px 8px 4px, rgba(0, 0, 0, 0.09) 0px 16px 8px, rgba(0, 0, 0, 0.09) 0px 32px 16px;
    }
    .login-form .form-title {
        text-align:center;
        font-weight:600;
        margin:12px 0px 30px;
        color:#111;
    }

    .login-form .form-title h4 {
        font-family: 'Fredoka One', cursive;
        margin: 0;
        --x-offset: -0.0625em;
        --y-offset: 0.0625em;
        --stroke: 0.025em;
        --background-color: white;
        --stroke-color: lightblue;

        text-shadow:

            var(--x-offset)
            var(--y-offset)
            0px
            var(--background-color),

            calc( var(--x-offset) - var(--stroke) )
            calc( var(--y-offset) + var(--stroke) )
            0px
            var(--stroke-color);
    }

    .login-form .form-title h1,
    .login-form .form-title h2 {
        font-family:"Montserrat",sans-serif;
        margin: 0;
        margin-top: 20px;
    }

    .login-form .form-title span {
        font-size:18px;
        font-weight:500;
        line-height: 0.3;
    }

    .login-form .form-input {
        margin:10px 0px;
    }
    .login-form .form-input label,
    .login-form .captcha label {
        display:block;
        font-size:15px;
        color:#111;
        margin-bottom:5px;
    }
    .login-form .form-input input {
        width:100%;
        padding:10px;
        border:1px solid #888;
        font-size:15px;
    }
    .login-form .captcha {
        margin:15px 0px;
    }
    .login-form .captcha .preview {
        color:#555;
        width:100%;
        text-align:center;
        height:40px;
        line-height:40px;
        letter-spacing:8px;
        border:1px dashed #888;
        font-family:"monospace";
    }
    .login-form .captcha .preview span {
        display:inline-block;
        user-select:none;
    }
    .login-form .captcha .captcha-form {
        display:flex;
    }
    .login-form .captcha .captcha-form input {
        width:100%;
        padding:8px;
        border:1px solid #888;
    }
    .login-form .captcha .captcha-form .captcha-refresh {
        width:40px;
        border:none;
        outline:none;
        background:#888;
        color:#eee;
        cursor:pointer;
    }
    .login-form #login-btn {
        margin-top:5px;
        width:100%;
        padding:10px;
        border:none;
        outline:none;
        font-size:15px;
        text-transform:uppercase;
        color:#fff;
        cursor:pointer;
    }

    .bi-google {
        color: #dc3545;
        justify-items: left;

    }
    .btn-google{
        border: 3px solid #000;

    }
    .btn-google:hover
    {
        background-color: #dc3545;
        color: white;
    }
    .btn-google:hover .bi-google{
        color: white;
    }
    
    .admin-login-btn {
        color: #dc3545;
    }
    
    .admin-login-btn:hover {
        color: #83121d;
    }
</style>
