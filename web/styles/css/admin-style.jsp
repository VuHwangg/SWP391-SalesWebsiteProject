<style>


    @import url('https://fonts.googleapis.com/css2?family=Fredoka+One&family=Pacifico&family=Tourney&display=swap');

    ::selection {
        color: #fff;
        background: var(--main-bg-color);
    }

    :root {
        --red: #dc3545;
        --red-hover: #b82a37;
        --green: #28a745;
        --green-hover: #107827;
        --yellow: #ffc107;
        --main-bg-color: #dc3545;
        --main-bg-color2: #198754;
        --sub-bg-color: rgb(227, 215, 37);
        --main-color-lightgray: #dee2e6;
        --main-color-gray: #404044;
        --main-color-darkgray: #243238;
        --main-color-black: rgb(39, 39, 39);
        --main-color-dark: #343a40;
    }

    textarea:focus,
    select:focus,
    input[type="text"]:focus,
    input[type="password"]:focus,
    input[type="datetime"]:focus,
    input[type="datetime-local"]:focus,
    input[type="date"]:focus,
    input[type="month"]:focus,
    input[type="time"]:focus,
    input[type="week"]:focus,
    input[type="number"]:focus,
    input[type="email"]:focus,
    input[type="url"]:focus,
    input[type="search"]:focus,
    input[type="tel"]:focus,
    input[type="color"]:focus,
    input[type="file"]:focus,
    .uneditable-input:focus {
        border-color: rgba(109, 46, 208, 0.8) !important;
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(109, 46, 208, 0.6) !important;
        outline: 0 none !important;
    }

    a:hover {
        text-decoration: none;
    }

    input[type="checkbox"] {
        accent-color: var(--main-bg-color);
    }

    input[type="radio"] {
        accent-color: var(--main-bg-color);
    }

    .border-cus-3 {
        border: 3px solid;
    }

    .border-cus-2 {
        border: 2px solid;
    }

    .enable-block {
        display: block;
    }

    .disable {
        display: none;
    }

    html {
        position: relative;
        min-height: 100%;
    }

    body {
        overflow-x: hidden;
    }

    body.sticky-footer {
        margin-bottom: 56px;
    }

    body.sticky-footer .content-wrapper {
        min-height: calc(100vh - 56px - 56px);
    }

    body.fixed-nav {
        padding-top: 56px;
    }

    .content-wrapper {
        min-height: calc(100vh - 56px);
        padding-top: 1rem;
    }

    .scroll-to-top {
        position: fixed;
        right: 15px;
        bottom: 3px;
        display: none;
        width: 50px;
        height: 50px;
        text-align: center;
        color: white;
        background: rgba(52, 58, 64, 0.5);
        line-height: 45px;
    }

    .scroll-to-top:focus, .scroll-to-top:hover {
        color: white;
    }

    .scroll-to-top:hover {
        background: #dc3545;
    }

    .scroll-to-top i {
        font-weight: 800;
    }

    .smaller {
        font-size: 0.7rem;
    }

    .o-hidden {
        overflow: hidden !important;
    }

    .z-0 {
        z-index: 0;
    }

    .z-1 {
        z-index: 1;
    }

    #mainNav .navbar-collapse {
        overflow: auto;
        max-height: 75vh;
    }

    #mainNav .navbar-collapse .navbar-nav .nav-item .nav-link {
        cursor: pointer;
    }

    #mainNav .navbar-collapse .navbar-sidenav .nav-link-collapse:after {
        float: right;
        content: '\f107';
        font-family: 'FontAwesome';
    }

    #mainNav .navbar-collapse .navbar-sidenav .nav-link-collapse.collapsed:after {
        content: '\f105';
    }

    #mainNav .navbar-collapse .navbar-sidenav .sidenav-second-level,
    #mainNav .navbar-collapse .navbar-sidenav .sidenav-third-level {
        padding-left: 0;
    }

    #mainNav .navbar-collapse .navbar-sidenav .sidenav-second-level > li > a,
    #mainNav .navbar-collapse .navbar-sidenav .sidenav-third-level > li > a {
        display: block;
        padding: 0.5em 0;
    }

    #mainNav .navbar-collapse .navbar-sidenav .sidenav-second-level > li > a:focus, #mainNav .navbar-collapse .navbar-sidenav .sidenav-second-level > li > a:hover,
    #mainNav .navbar-collapse .navbar-sidenav .sidenav-third-level > li > a:focus,
    #mainNav .navbar-collapse .navbar-sidenav .sidenav-third-level > li > a:hover {
        text-decoration: none;
    }

    #mainNav .navbar-collapse .navbar-sidenav .sidenav-second-level > li > a {
        padding-left: 1em;
    }

    #mainNav .navbar-collapse .navbar-sidenav .sidenav-third-level > li > a {
        padding-left: 2em;
    }

    #mainNav .navbar-collapse .sidenav-toggler {
        display: none;
    }

    #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown > .nav-link {
        position: relative;
        min-width: 45px;
    }

    #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown > .nav-link:after {
        float: right;
        width: auto;
        content: '\f105';
        border: none;
        font-family: 'FontAwesome';
    }

    #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown > .nav-link .indicator {
        position: absolute;
        top: 5px;
        left: 21px;
        font-size: 10px;
    }

    #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown.show > .nav-link:after {
        content: '\f107';
    }

    #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown .dropdown-menu > .dropdown-item > .dropdown-message {
        overflow: hidden;
        max-width: none;
        text-overflow: ellipsis;
    }


    #mainNav .navbar-brand {
        font-family: 'Fredoka One', cursive;
    }

    @media (min-width: 992px) {
        #mainNav .navbar-brand {
            width: 250px;
        }
        #mainNav .navbar-collapse {
            overflow: visible;
            max-height: none;
        }
        #mainNav .navbar-collapse .navbar-sidenav {
            position: absolute;
            top: 0;
            left: 0;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column;
            margin-top: 56px;
        }
        #mainNav .navbar-collapse .navbar-sidenav > .nav-item {
            width: 250px;
            padding: 0;
        }
        #mainNav .navbar-collapse .navbar-sidenav > .nav-item > .nav-link {
            padding: 1em;
        }
        #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level,
        #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level {
            padding-left: 0;
            list-style: none;
        }
        #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level > li,
        #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level > li {
            width: 250px;
        }
        #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level > li > a,
        #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level > li > a {
            padding: 1em;
        }
        #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level > li > a {
            padding-left: 2.75em;
        }
        #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level > li > a {
            padding-left: 3.75em;
        }
        #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown > .nav-link {
            min-width: 0;
        }
        #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown > .nav-link:after {
            width: 24px;
            text-align: center;
        }
        #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown .dropdown-menu > .dropdown-item > .dropdown-message {
            max-width: 300px;
        }
    }

    #mainNav.fixed-top .sidenav-toggler {
        display: none;
    }

    @media (min-width: 992px) {
        #mainNav.fixed-top .navbar-sidenav {
            height: calc(100vh - 112px);
        }
        #mainNav.fixed-top .sidenav-toggler {
            position: absolute;
            top: 0;
            left: 0;
            display: flex;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column;
            margin-top: calc(100vh - 56px);
        }
        #mainNav.fixed-top .sidenav-toggler > .nav-item {
            width: 250px;
            padding: 0;
        }
        #mainNav.fixed-top .sidenav-toggler > .nav-item > .nav-link {
            padding: 1em;
        }
    }

    #mainNav.fixed-top.navbar-dark .sidenav-toggler {
        background-color: #dc3545;
    }

    #mainNav.fixed-top.navbar-dark .sidenav-toggler a i {
        color: white;
    }

    #mainNav.fixed-top.navbar-light .sidenav-toggler {
        background-color: white;
    }

    #mainNav.fixed-top.navbar-light .sidenav-toggler a i {
        color: rgba(0, 0, 0, 0.5);
    }

    body.sidenav-toggled #mainNav.fixed-top .sidenav-toggler {
        overflow-x: hidden;
        width: 55px;
    }

    body.sidenav-toggled #mainNav.fixed-top .sidenav-toggler .nav-item,
    body.sidenav-toggled #mainNav.fixed-top .sidenav-toggler .nav-link {
        width: 55px !important;
    }

    #sidenavToggler:hover {
        background-color: var(--red-hover) !important;
    }

    body.sidenav-toggled #mainNav.fixed-top #sidenavToggler i {
        -webkit-transform: scaleX(-1);
        -moz-transform: scaleX(-1);
        -o-transform: scaleX(-1);
        transform: scaleX(-1);
        filter: FlipH;
        -ms-filter: 'FlipH';
    }

    #mainNav.static-top .sidenav-toggler {
        display: none;
    }

    @media (min-width: 992px) {
        #mainNav.static-top .sidenav-toggler {
            display: flex;
        }
    }

    body.sidenav-toggled #mainNav.static-top #sidenavToggler i {
        -webkit-transform: scaleX(-1);
        -moz-transform: scaleX(-1);
        -o-transform: scaleX(-1);
        transform: scaleX(-1);
        filter: FlipH;
        -ms-filter: 'FlipH';
    }

    .content-wrapper {
        overflow-x: hidden;
        background: white;
    }

    @media (min-width: 992px) {
        .content-wrapper {
            margin-left: 250px;
        }
    }

    #sidenavToggler i {
        font-weight: 800;
    }

    .navbar-sidenav-tooltip.show {
        display: none;
    }

    @media (min-width: 992px) {
        body.sidenav-toggled .content-wrapper {
            margin-left: 55px;
        }
    }

    body.sidenav-toggled .navbar-sidenav {
        width: 55px;
    }

    body.sidenav-toggled .navbar-sidenav .nav-link-text {
        display: none;
    }

    body.sidenav-toggled .navbar-sidenav .nav-item,
    body.sidenav-toggled .navbar-sidenav .nav-link {
        width: 55px !important;
    }

    body.sidenav-toggled .navbar-sidenav .nav-item:after,
    body.sidenav-toggled .navbar-sidenav .nav-link:after {
        display: none;
    }

    body.sidenav-toggled .navbar-sidenav .nav-item {
        white-space: nowrap;
    }

    body.sidenav-toggled .navbar-sidenav-tooltip.show {
        display: flex;
    }

    #mainNav.navbar-dark .navbar-collapse .navbar-sidenav .nav-link-collapse:after {
        color: #ffffff;
    }

    #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item > .nav-link {
        color: #ffffff;
    }

    #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item > .nav-link:hover {
        color: #adb5bd;
    }

    #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level > li > a,
    #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level > li > a {
        color: #ffffff;
    }

    #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level > li > a:focus, #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level > li > a:hover,
    #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level > li > a:focus,
    #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level > li > a:hover {
        color: #adb5bd;
    }

    #mainNav.navbar-dark .navbar-collapse .navbar-nav > .nav-item.dropdown > .nav-link:after {
        color: #ffffff;
    }

    @media (min-width: 992px) {
        #mainNav.navbar-dark .navbar-collapse .navbar-sidenav {
            background: #343a40;
        }
        #mainNav.navbar-dark .navbar-collapse .navbar-sidenav li.active a {
            color: white !important;
            background-color: #495057;
        }
        #mainNav.navbar-dark .navbar-collapse .navbar-sidenav li.active a:focus, #mainNav.navbar-dark .navbar-collapse .navbar-sidenav li.active a:hover {
            color: white;
        }
        #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level,
        #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level {
            background: #343a40;
        }
    }

    /*NAVIGATION BAR*/

    .navbar-dark .navbar-nav .nav-link,
    .navbar-dark .navbar-nav .nav-link:focus {
        color: #ffffff;
    }

    .navbar {
        box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
    }

    .navbar .dropdown-menu {
        right: 0;
        left: auto;
        top: 120%;
        max-width: 200px;
        box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
    }

    .navbar .dropdown-menu .dropdown-item:hover {
        background-color: white;
    }

    .navbar .dropdown-menu a.dropdown-item:hover {
        background-color: var(--red) !important;
        color: white !important;
    }

    .card {
        box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
    }

    a.card:hover {
        text-decoration: none;
    }

    .card-r1 .card-body {
        padding: 4px 12px;
        display: flex;
        justify-content: left;
    }

    .card-r1 .card-body span {
        font-size: 18px;
        font-weight: bold;
    }

    .card-r1 .card-footer {
        display: flex;
        justify-content: left;
        padding: 6px 12px;
    }

    .card-r1 .card-body-icon {
        position: absolute;
        z-index: 0;
        top: -25px;
        right: -10px;
        font-size: 5rem;
        -webkit-transform: rotate(15deg);
        -ms-transform: rotate(15deg);
        transform: rotate(15deg);
    }

    .card-r2 .icon-card-custom {
        overflow: hidden;
        width: 62px;
        height: 62px;
        border-radius: 50% !important;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .card-r2 .icon-card-custom i {
        font-size: 34px;
    }

    .card-r2 .card-footer {
        font-size: 18px;
        font-weight: 600;
    }

    @media (min-width: 576px) {
        .card-columns {
            column-count: 1;
        }
    }

    @media (min-width: 768px) {
        .card-columns {
            column-count: 2;
        }
    }

    @media (min-width: 1200px) {
        .card-columns {
            column-count: 2;
        }
    }

    .card-login {
        max-width: 25rem;
    }

    .card-register {
        max-width: 40rem;
    }


    /*
    ======================================
    Table Management
    ======================================
    */

    .table tr th,
    .table tr td {
        vertical-align: middle;
    }

    .table tr th{
        padding: 12px 6px
    }

    .table tr td button,
    .table tr td a{
        border: none;
        border-radius: 8px;
        padding: 4px 8px;
        cursor: pointer;
        text-decoration: none;
    }



    /*  Table Employee Management ===============================*/

    .table-emp tr th:nth-child(1) {
        width: 10%;
    }

    .table-emp tr th:nth-child(2) {
        width: 20%;
    }

    .table-emp tr th:nth-child(3) {
        width: 20%;
    }

    .table-emp tr th:nth-child(4) {
        width: 20%;
    }

    .table-emp tr th:nth-child(5) {
        width: 10%;
    }

    .table-emp tr th:nth-child(6) {
        width: 20%;
    }

    @media (max-width: 576px) {
        .save-btn {
            width: 100%;
            margin-top: 10px;
        }
    }

    .add-btn {
        padding: 4px 8px;
    }


    /*  Table Product Management =============================*/

    .table-pro tr th:nth-child(1) {
        width: 5%;
    }

    .table-pro tr th:nth-child(2) {
        width: 19%;
    }

    .table-pro tr th:nth-child(3) {
        width: 12%;
    }

    .table-pro tr th:nth-child(4) {
        width: 10%;
    }

    .table-pro tr th:nth-child(5) {
        width: 8%;
    }

    .table-pro tr th:nth-child(6) {
        width: 8%;
    }

    .table-pro tr th:nth-child(7) {
        width: 10%;
    }

    .table-pro tr th:nth-child(8) {
        width: 10%;
    }

    .table-pro tr th:nth-child(9) {
        width: 18%;
    }


    /*  Table Warehouse Management =============================*/

    .table-wareh tr th:nth-child(1) {
        width: 5%;
    }

    .table-wareh tr th:nth-child(2) {
        width: 18%;
    }

    .table-wareh tr th:nth-child(3) {
        width: 12%;
    }

    .table-wareh tr th:nth-child(4) {
        width: 15%;
    }

    .table-wareh tr th:nth-child(5) {
        width: 10%;
    }

    .table-wareh tr th:nth-child(6) {
        width: 10%;
    }

    .table-wareh tr th:nth-child(7) {
        width: 10%;
    }

    .table-wareh tr th:nth-child(8) {
        width: 12%;
    }

    .table-wareh tr th:nth-child(9) {
        width: 8%;
    }


    /*  Table Product Import History Management =============================*/

    .table-history tr th:nth-child(1) {
        width: 5%;
    }

    .table-history tr th:nth-child(2) {
        width: 19%;
    }

    .table-history tr th:nth-child(3) {
        width: 10%;
    }

    .table-history tr th:nth-child(4) {
        width: 10%;
    }

    .table-history tr th:nth-child(5) {
        width: 7%;
    }

    .table-history tr th:nth-child(6) {
        width: 7%;
    }

    .table-history tr th:nth-child(7) {
        width: 10%;
    }

    .table-history tr th:nth-child(8) {
        width: 10%;
    }

    .table-history tr th:nth-child(9) {
        width: 11%;
    }

    .table-history tr th:nth-child(10) {
        width: 11%;
    }


    /*Custom Design Of Table Defalt*/

    .page-item.active .page-link{
        background-color: var(--red);
        border-color: var(--red);
    }

    /*Password Input Group (Hide/Show)*/

    .password-input-group.multi-input input,
    .password-input-group.multi-input span {
        border: none;
        background-color: white !important;
    }

    .password-input-group.multi-input input {
        text-align: center;
    }

    .password-input-group a {
        color: var(--red);
    }

    .password-input-group a:hover {
        color: var(--red-hover);
    }

    /*------------- INPUT GROUP CSS -------------------------*/

    /*Double Column Chart*/
    #double-column-chart .highcharts-credits,
    #double-column-chart .highcharts-exporting-group{
        display: none !important;
    }
    
    
    /*---------------- INPUT LABLE BOX ---------------------*/
    .input-label-box-1 {
        min-width: 170px;
        font-weight: 700;
/*        margin: 0;
        padding-right: 12px; 
        text-align: right;*/
    }
    
    .input-label-box-2 {
        min-width: 100px;
        font-weight: 700;
    }


    footer.sticky-footer {
        position: absolute;
        right: 0;
        bottom: 0;
        width: 100%;
        height: 56px;
        background-color: #dc3545;
        color: white;
        line-height: 55px;
    }

    @media (min-width: 992px) {
        footer.sticky-footer {
            width: calc(100% - 250px);
        }
    }

    @media (min-width: 992px) {
        body.sidenav-toggled footer.sticky-footer {
            width: calc(100% - 55px);
        }
    }

</style>