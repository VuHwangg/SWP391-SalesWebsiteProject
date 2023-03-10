<style>

    @import url('https://fonts.googleapis.com/css2?family=Fredoka+One&family=Pacifico&family=Tourney&display=swap');

    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box !important;
    }

    html {
        font-family: Montserrat sans-serif;
        scroll-behavior: smooth;
    }

    body {
        position: relative;
        font-size: 16px;
        line-height: 1.6;
        font-weight: 400;
        color: #243238;
        background-color: #ffffff;
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
        border-color: rgba(220, 53, 69, 0.8) !important;
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(220, 53, 69, 0.6) !important;
        outline: 0 none !important;
    }

    ::selection {
        color: #fff;
        background: var(--main-bg-color);
    }

    :root {
        --main-bg-color: #dc3545;
        --main-bg-color2: #198754;
        --sub-bg-color: rgb(227, 215, 37);
        --main-color-lightgray: #dee2e6;
        --main-color-gray: #404044;
        --main-color-darkgray: #243238;
        --main-color-black: rgb(39, 39, 39);
    }

    table tr,
    table td,
    table th {
        overflow: hidden;
    }

    ul {
        margin: 0;
        padding: 0;
    }

    input[type="checkbox"] {
        accent-color: var(--main-bg-color);
    }

    input[type="radio"] {
        accent-color: var(--main-bg-color);
    }

    .bg-red {
        background-color: var(--main-bg-color);
    }

    .bg-offwhite {
        background-color: rgb(235, 235, 235) !important;
    }

    /*==============================================================================
                                    Mini banner
    ==============================================================================*/
    .mini-banner {
        height: 60px;
        width: 100%;
        background-color: var(--main-color-darkgray);
        position: absolute;
        z-index: 999;
        overflow: hidden;
    }

    .mini-banner .banner-text {
        position: relative;
        animation: move 40s linear infinite;
    }

    .mini-banner span {
        white-space: nowrap;
        position: absolute;
        left: 0;
        font-size: 18px;
        font-weight: bold;
        color: white
    }

    @keyframes move {
        0% {
            left: 0;
        }
        50% {
            left: 73%;
        }
        100% {
            left: 0;
        }
    }

    /*==============================================================================
                                  Navigation Bar
    ==============================================================================*/
    .navbar {
        padding: 0 !important;
        margin-top: 30px;
        background-color: var(--main-bg-color);
        position: fixed;
        width: 100%;
        box-shadow: 0px 2px 15px rgb(78, 72, 87);
        transition: all 0.1s ease;
        z-index: 1000;
    }

    /*Navbar Brand Button*/
    /*Navbar Brand Button*/
    .button-92 {
        --c: #fff;
        /* text color */
        background: linear-gradient(90deg, #0000 33%, #a0a0a0, #0000 67%) var(--_p,100%)/300% no-repeat,
            #fff;
        border-radius: 50%;
        /* background color */
        color: var(--main-bg-color) !important;
        border: none;
        transform: perspective(500px) rotateY(calc(-25deg*var(--_i,-1)));
        text-shadow: calc(var(--_i,-1)* 0.08em) -.01em 0   var(--c),
            calc(var(--_i,-1)*-0.08em)  .01em 2px #0004;
        outline-offset: .1em;
        transition: 0.3s;
    }

    .button-92:hover,
    .button-92:focus-visible {
        --_p: 0%;
        --_i: 1;
    }

    .button-92:active {
        text-shadow: none;
        color: var(--c);
        box-shadow: inset 0 0 9e9q #0005;
        transition: 0s;
    }

    .button-92 {
        font-weight: bold;
        font-size: 2rem;
        margin: 0;
        cursor: pointer;
        padding: .1em .3em;
    }
    /*Navbar Brand Button*/
    /*Navbar Brand Button*/

    .navbar .navbar-brand {
        font-family: 'Fredoka One', cursive;
        font-size: 24px;
    }

    .navbar .mobile-logo {
        display: none;
    }

    .mini-banner-off {
        margin-top: 0 !important;
    }

    .navbar a,
    .navbar a:hover,
    .navbar a:active,
    .navbar a:focus {
        color: white;
    }

    .navbar .nav-link {
        padding: 6px 8px;
        position: relative;
        font-weight: 700;
        font-size: 14px;
        text-transform: uppercase;
        transition: all 0.2s ease-in-out;
    }

    .navbar .nav-link i {
        display: block;
        font-size: 30px;
        line-height: 0.5;
        text-align: center;
    }

    .navbar .nav-link:before {
        content: "";
        position: absolute;
        height: 4px;
        width: 0;
        bottom: 0;
        background-color: white;

        /* animation center */
        left: 50%;
        transform: translateX(-50%);
        transition: all 0.5s ease;

    }

    .navbar .nav-link:hover:before {
        width: 100%;
    }

    .navbar .navbar-collapse {
        flex-grow: 0;
    }

    .navbar .navbar-collapse .nav-item {
        margin-right: 10px;
    }

    .navbar .dropdown-menu {
        background-color: #ffffff;
        border: 2px solid #c3c3c3;
        ;
        padding: 0;
        overflow: hidden;
        box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px;
        min-width: 220px;
    }

    .navbar .dropdown-menu .dropdown-item {
        color: #404044;
        font-weight: 500;
        padding-top: 10px;
        padding-bottom: 10px;
        border-bottom: 1px solid #c3c3c3;
        ;
    }

    .navbar .dropdown-menu li:first-child .dropdown-item{
        padding-top: 6px;
        padding-bottom: 6px;
        text-align: center;
    }

    .navbar .dropdown-menu li:first-child .dropdown-item:hover {
        color: #404044;
        background-color: white;
    }


    .navbar .dropdown-menu .dropdown-item:hover {
        background-color: #d0d0d0;
        color: var(--main-bg-color);
    }

    .navbar .dropdown-menu i {
        display: block;
        font-size: 36px;
        line-height: 1.2;
    }

    .dropdown-menu[data-bs-popper] {
        right: 0%;
        left: auto;
    }

    .navbar .search-box {
        flex-grow: 0.8;
    }
    .navbar .search-box input {
        background-image: url('img/searching-icon.png');
        background-position: 8px 8px;
        background-repeat: no-repeat;
        background-size: 20px;
        padding-left: 35px;
    }

    .navbar .mini-quantity {
        top: 5%;
        left: 58%;
        background-color: var(--main-color-darkgray);
        color: white;
    }

    @media (max-width: 520px) {
        .navbar .search-box {
            width: 50px;
        }

        .navbar .button-92 {
            display: none
        }

        .navbar .mobile-logo {
            display: block;
        }
    }

    @media (max-width: 992px) {
        .navbar {
            padding-top: 8px !important;
            padding-bottom: 8px !important;
        }

        .navbar .nav-link {
            padding: 16px 8px;
            position: relative;
            font-weight: 700;
            text-transform: uppercase;
            transition: all 0.2s ease-in-out;
        }

        .navbar .nav-link:before {
            /* animation left to right */
            left: 0%;
            transform: translateX(0%);
            transition: all 1s ease;
        }

        .navbar .nav-link i {
            display: inline;
        }

        .mini-quantity {
            display: none;
        }
    }

    /*==============================================================================
                                  Main Container
    ==============================================================================*/
    .main-container {
        position: relative;
    }


    /*==============================================================================
                                    Side Banner
    ==============================================================================*/
    .img-bg {
        position: fixed;
        width: 100vw;
        height: 100vh;
    }

    .sb-right,
    .sb-left {
        position: fixed;
        width: 400px;
        height: 100vh;
    }

    .sb-right {
        right: 0;
    }

    .sb-img {
        height: 100%;
        width: 100%;
        object-fit: cover;
    }


    /*==============================================================================
                                    Content Center
    ==============================================================================*/
    .content-center {
        position: relative;
        max-width: 1200px;
        margin: auto;
    }

    /*==============================================================================
                                     Breadcrumb
    ==============================================================================*/
    .breadcrumb {
        padding: 110px 20px 10px;
        margin-bottom: 0;
        background-color: white;
    }

    .breadcrumb a {
        color: var(--main-color-black);
        text-decoration: none;
        font-weight: 700;
    }

    .breadcrumb a:hover {
        color: var(--main-bg-color);
    }


    /*==============================================================================
                                    Carousel
    ==============================================================================*/
    .main-carousel,
    .small-main-carousel {
        width: 100%;
        overflow: hidden;
    }

    .main-carousel img,
    .small-main-carousel img{
        object-fit: cover;
        width: 100%;
        height: 100%;
    }

    .main-carousel img {
        border-radius: 30px;
    }

    .main-carousel {
        padding-top: 110px;
    }

    .main-carousel .carousel-item {
        height: 500px;
        width: 100%;
        border-radius: 30px;
    }

    .small-main-carousel .carousel-item {
        height: 300px;
        width: 100%;
    }

    .small-main-carousel {
        background-color: white;
    }

    @media (max-width: 1200px) {
        .main-carousel {
            padding-top: 88px;
        }

        .main-carousel img {
            border-radius: 0;
        }
    }


    /*==============================================================================
                                    List Product
    ==============================================================================*/
    .list-product {
        padding: 30px 40px 1px 40px;
    }

    .list-product.home {
        padding: 30px 0 1px;
    }

    .cover-block {
        padding: 30px;
        margin-bottom: 20px;
        border-radius: 30px;
        overflow: hidden;
    }

    .list-product .cover-block {
        background-color: white;
    }

    @media (max-width: 1200px) {
        .list-product.home {
            padding: 30px 18px 1px 18px;
        }
    }

    /*                          List in home page 
    --------------------------------------------------------------------------------*/

    .list-product .row-title {
        font-size: 32px;
        font-weight: 700;
        text-transform: capitalize;
        color: var(--main-bg-color);
    }

    .list-product .row-title a {
        transition: all 0.5s ease;
        cursor: pointer;
        text-decoration: none;
        color: var(--main-bg-color);
    }

    .list-product .row-title a:hover{
        padding-left: 10px;
        text-decoration: underline;
    }

    @media (max-width: 575px) {
        .list-product .row-title {
            font-size: 26px;
            margin-bottom: 0;
        }
    }

    /*                      List in Phone & Laptop page 
    --------------------------------------------------------------------------------*/

    /*----------------------- Filter block -----------------------------------------*/

    .list-product .filter {
        padding: 30px 30px 30px 0;
    }

    .list-product .filter .filter-title {
        font-size: 24px;
        font-weight: 700;
        margin-bottom: 8px;
    }

    .list-product .filter .row {
        margin-bottom: 30px;
    }

    .list-product .filter .btn-filter {
        background-color: var(--main-bg-color);
        color: white;
        font-weight: 500;
        width: 100%;
        border-radius: 10px;
        border: 1px solid black;
    }

    .list-product .filter .btn-filter:hover {
        background-color: #960000;
    }

    /* --------------------------- Sort block --------------------------------------*/
    .list-product .sort-method p {
        font-size: 24px;
        font-weight: 700;
        color: var(--main-color-black);
    }

    .list-product .sort-method .sort-method-selection {
        width: 90%;
    }

    .list-product .sort-method .sort-method-selection .btn {
        font-weight: 500;
    }

    .list-product .sort-method .sort-method-selection .btn label {
        cursor: pointer;
    }

    @media (max-width: 768px) {

        .list-product .sort-method .sort-method-title {
            display: none;
        }
        .list-product .sort-method .sort-method-selection {
            width: 100%;
            padding-bottom: 20px;
        }
    }


    /*==============================================================================
                                    Pagination
    ==============================================================================*/
    .pagination a {
        font-weight: 500;
        border: 0;
        border-left: 1px solid var(--main-bg-color);
        border-right: 1px solid var(--main-bg-color);
    }

    .pagination a:hover {
        border-left: 1px solid white;
        border-right: 1px solid white;
    }

    .pagination a.active{
        border-left: 1px solid white;
        border-right: 1px solid white;
    }

    .pagination .arrow{
        width: 50px;
        border: 2px solid var(--main-bg-color);
    }
    .pagination .arrow:hover{
        border: 2px solid var(--main-bg-color);
    }

    .pagination i {
        font-size: 18px;
        font-weight: 900;
    }


    /*==============================================================================
                                    List Not Found
    ==============================================================================*/

    .product-notfound {
        height: 50vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .product-notfound p {
        text-align: center;
        font-size: 20px;
        font-weight: 700;
    }

    .product-notfound a {
        text-align: center;
        margin: auto
    }


    /*==============================================================================
                                    Each product
    ==============================================================================*/
    .product {
        border-radius: 10px;
        padding: 24px 12px;
        overflow: hidden;
        text-decoration: none;
        color: var(--main-color-black);
        transform: scale(1.008);
        transition: all ease 0.2s;
    }

    .product p {
        margin-bottom: 0;
    }

    .product:hover {
        transform: scale(1.015);
        border: 1px solid #c3c3c3;
        box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
    }

    .product:hover .product-img{
        transform: scale(1.1);
        padding: 0;
    }

    .product .product-img {
        width: 100%;
        height: 200px;
        padding: 4px;
        margin-bottom: 10px;
        transition: all 0.5s ease;
    }

    .product .product-img img {
        width: 100%;
        height: 100%;
        object-fit: contain;
    }

    .product .product-name {
        font-size: 20px;
        font-weight: 700;
        margin-bottom: 6px;
        height: 64px;
    }

    .product .product-old-price {
        color: #868686;
        margin-left: 16px;
        height: 26px;
    }

    .product .product-price {
        color: white;
        background-color: var(--main-bg-color);
        border-radius: 20px;
        margin: 2px 6px;
        font-weight: 700;
        font-size: 16px;
        text-align: center;
    }

    .product .col-4 {
        background-image: url('img/seven-pointed-star-svgrepo-com.svg');
        background-repeat: no-repeat;
        background-size: 64px;
        background-position: 0 0px;
    }
    .product .sale-percent {
        color: white;
        font-weight: 700;
        margin-top: 23px;
        font-size: 15px;
    }

    @media (max-width: 575px) {
        .list-product .product .product-name {
            height: auto;
        }

        .slider-product {
            margin: 10px 10px 20px 10px;
        }

        .product {
            padding: 8px;
        }
    }

    /*==============================================================================
                              List Product Slider
    ==============================================================================*/

    .slider-product {
        display: flex;
        flex-direction: column;
        width: 265px;
        margin: 10px 0 20px 10px;
    }

    .slider-product.slider-product-similar {
        width: 260px;
    }

    .lSAction > a {
        background-color: rgb(0, 0, 0, 0.2);
        width: 42px !important;
        height: 42px !important;
        border-radius: 50% !important;
        background-image: none !important;
        display: flex !important;
        justify-content: center !important;
        align-items: center !important;
    }

    .lSAction > a::after {
        position: absolute !important;
        content: '' !important;
        margin: auto !important;
        border: solid #fff !important;
        border-width: 0 4px 4px 0 !important;
        display: inline-block !important;
        padding: 5px !important;
    }

    .lSAction > .lSPrev::after {
        transform: rotate(135deg) !important;
        -webkit-transform: rotage(135px) !important;
    }

    .lSAction > .lSNext::after {
        transform: rotate(-45deg) !important;
        -webkit-transform: rotage(-45px) !important;
    }


    /*==============================================================================
                                    Profile
    ==============================================================================*/

    .profile {
        padding: 15px 40px 1px 40px;
        height: 70vh;
    }

    @media (max-width: 576px) {
        .profile {
            height: 100%;
        }
    }

    .profile .cover-block{
        flex-grow: 1;
        padding: 20px;
    }

    .profile .profile-left {
        margin-right: 20px;
        display: flex;
        align-items: center;
        flex-direction: column;
    }

    .avatar {
        overflow: hidden;
        border: 8px solid white;
        border-radius: 50%;
        height: 100px;
        width: 100px;
        box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px 6px 6px;
        background-color: white;
    }

    .avatar img {
        height: 100%;
        width: 100%;
        object-fit: cover;
    }

    .profile .profile-name p {
        margin: 20px 0 2px;
        font-size: 18px;
        font-weight: 500;
        text-align: center;
    }

    .profile .profile-email p {
        font-size: 14px;
    }

    .the-line-white {
        width: 100%;
        border: 2px solid var(--main-color-darkgray);
        border-radius: 50%;
        margin-bottom: 10px;
    }

    .profile-btn-white {
        color: var(--main-color-black);
        background-color: white;
        border: 3px solid var(--main-color-black);
        border-radius: 24px;
        padding: 8px;
        width: 100%;
        margin-top: 10px;
        text-align: center;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.3s ease;
    }

    .profile-btn-white:hover {
        background-color: var(--main-bg-color);
        color: white;
    }


    .profile-btn-red {
        color: white;
        background-color: var(--main-bg-color);
        border: 3px solid var(--main-color-black);
        border-radius: 24px;
        padding: 8px;
        width: 100%;
        margin-top: 10px;
        text-align: center;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.3s ease;
    }

    .profile-btn-red:hover {
        background-color: #ab2936;
    }

    .profile-btn-white.active {
        background-color: var(--main-bg-color);
        color: white;
    }

    .profile .profile-right table {
        width: 100%;
    }

    .profile .profile-right table tr {
        border-bottom: 1px solid gray;
    }

    .profile .profile-right table tr td:first-child {
        font-weight: 500;
        width: 150px;
        height: 60px;
    }

    .profile .profile-right table tr td input {
        width: 100%;
        height: 40px;
    }

    .change-email.profile-btn-red {
        font-size: 14px;
        padding: 6px 8px;
        border-radius: 8px;
        text-align: right;
    }


    /*==============================================================================
                                  Product Detail
    ==============================================================================*/

    .product-detail-title {
        padding: 0 8px;
        margin: 0;
    }

    .product-detail-title .sub-vote {
        text-align: right;
    }

    .stars {
        font-size: 18px;
    }

    .bi-star-fill.active {
        color: #e0c84a;
    }

    @media (max-width: 576px) {
        .product-detail-title .sub-vote {
            text-align: left;
        }
    }

    .product-detail .price {
        color: var(--main-bg-color);
    }

    .product-detail .sale-price {
        color: gray;
        margin-bottom: 24px;
    }

    .product-detail .filter-product-group h5 {
        font-size: 18px;
        font-weight: 700;
    }

    .product-detail .fp-btn {
        color: var(--main-color-black);
        border: 2px solid var(--main-bg-color);
        padding: 8px 16px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        height: 50px;
        display: flex;
        justify-content: center;
        align-items: center;
        transition: all 0.3s ease-in-out
    }

    .product-detail a.fp-btn:hover {
        background-color: var(--main-bg-color);
        color: white;
    }

    .product-detail .fp-btn.active {
        background-color: var(--main-bg-color);
        color: white;
    }

    .product-detail .row {
        margin-bottom: 20px;
    }

    .product-detail .buy-btn {
        margin-bottom: 8px;
        padding: 8px 16px;
        font-size: 22px;
        font-weight: 700;
        text-transform: uppercase;
        border-radius: 16px;
    }

    .product-detail .add-cart-btn {
        background-color: #ece033;
        border: 2px solid black;
        border-radius: 16px;
        font-size: 18px;
        padding: 0;
    }

    .product-detail .add-cart-btn i {
        font-size: 32px;

    }

    .product-detail .add-cart-btn:hover {
        background-color: #d9ce30;
    }

    .product-detail .sold-out-box {
        border: 2px solid #6c757d;
        border-radius: 20px;
        box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
    }

    /*-------------------------- Feedback modal --------------------------*/

    .rating {
        display: flex;
        flex-direction: row-reverse;
        justify-content: center;
    }


    .rating > input{
        display:none;
    }

    .rating > label {
        position: relative;
        font-size: 40px;
        line-height: 0.8;
        color: #FFD700;
        margin: 0 16px;
        cursor: pointer;
    }

    .rating > label::before{
        content: "\2605";
        position: absolute;
        opacity: 0;
    }

    .rating > label:hover:before,
    .rating > label:hover ~ label:before {
        opacity: 1 !important;
    }

    .rating > input:checked ~ label:before{
        opacity:1;
    }

    .rating:hover > input:checked ~ label:before{
        opacity: 0.4;
    }

    /*-------------------------- Similar product-----------------------------------*/
    .similar-product {
        box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
    }


    /*----------------------Product Description-----------------------------------*/

    .product-description .cover-block{
        flex-grow: 1;
        padding: 20px;
        box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
        margin-top: 20px;
    }

    .product-description .cover-block p {
        margin: 0;
    }

    .product-description .product-description-left {
        margin-right: 20px;
        color: white;
    }

    /*----------------------Product Vote-----------------------------------*/

    .vote.cover-block {
        box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
        margin-top: 20px;
    }

    .vote .vote-left {
        border-right: 2px solid var(--main-color-lightgray);
    }

    .vote .progress {
        width: 80%;
        height: 1rem;
        margin: 0 8px;
    }
    .vote span {
        width: 30px;
    }


    /*==============================================================================
                                    Slider Images
    ==============================================================================*/

    .slider-img {
        margin-bottom: 16px;
        box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
        overflow: hidden;
        border-radius: 16px;
    }

    .slider-img .main-slider-img {
        width: 100%;
        height: 400px;
    }

    .slider-img .main-slider-img img {
        width: 100%;
        height: 100%;
        object-fit: contain;
    }

    .slider-img .thumbnail {
        height: 80px;
    }

    .slider-img .thumbnail img {
        height: 100%;
        width: 80px;
        object-fit: contain;
    }


    /*==============================================================================
                                 Quantity Input Block
    ==============================================================================*/

    /*--------------- Quantity input in Product Detail --------------------------*/
    .quantity-input-pd  {
        display: flex;
        align-items: center;
        background-color: #cccccc5c;
        border-radius: 16px;
        border: 2px solid black;
        overflow: hidden;
        width: 100%;
        height: 100%;
    }
    .quantity-input-pd input[type="number"] {
        text-align: center;
        color: var(--main-color-black);
        background-color: transparent;
        border: none;
        outline: none;
        font-size: 20px;
        font-weight: 500;
        border-left: 2px solid black;
        border-right: 2px solid black;
        cursor: pointer;
        width: 40px;
    }
    .quantity-input-pd button {
        width: 100%;
        height: 100%;
        border: none;
        font-size: 24px;
        color: var(--main-color-black);
        outline: none;
        cursor: pointer;
    }
    .quantity-input button:hover {
        background-color: #ccc;
    }

    /*--------------- Quantity input in Product Cart --------------------------*/

    .quantity-input-cart {
    }

    .quantity-input-cart button {
        font-size: 20px;
        font-weight: 700;
        width: 40px;
    }

    .quantity-input-cart button:hover {
        background: white;
        color: var(--main-bg-color);
    }

    .quantity-input-cart input {
        border: 3px solid var(--main-bg-color);
        font-size: 18px;
        font-weight: 500;
    }

    .quantity-input-cart button,
    .quantity-input-cart input {
        padding: 4px 4px;
    }

    @media (max-width: 520px) {
        .quantity-input-cart button,
        .quantity-input-cart input {
            width: 100%;
            border-radius: 0;
            border: 0;
        }
    }


    /*==============================================================================
                                 Order Lookup
    ==============================================================================*/

    .order-lookup .order-status-group .order-status {
        color: var(--main-color-black);
        text-decoration: none;
        transition: all 0.3s ease;
    }

    .order-lookup .order-status-group .order-status:hover {
        background-color: var(--main-bg-color);
        color: white;
    }

    .order-lookup .order-status-group .order-status.active {
        background-color: var(--main-bg-color);
        color: white;
    }

    .order-detail-table tr:first-child{
        color: white;
        background-color: var(--main-bg-color);
    }


    .overlookup-guest {
        position: relative;
        width: 100%;
        height: 75vh;
        background-color: var(--main-color-darkgray);
    }

    .overlookup-guest .bg-overlookup {
        background-image: url('img/bg-overlookup.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center center;
        opacity: 0.6;
        position: absolute;
        width: 100%;
        height: 100%;
    }

    .overlookup-guest .search-block {
        position: absolute;
        z-index: 10;
        width: 100%;
        height: 100%;
    }

    .overlookup-guest .search-block .container-fluid {
        max-width: 600px;
    }

    .overlookup-guest .search-block h1 {
        text-shadow: 3px 3px 5px #595858;
        text-transform: capitalize;
        color: white
    }

    /*==============================================================================
                                 FOOTER
    ==============================================================================*/

    .page-footer {
        position: relative;
        width: 100%;
        height: auto;
        padding: 50px 100px;
        color: #d3d3d3;
        background-color: #303036;
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }

    .page-footer .footer-content {
        margin-bottom: 40px;
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        flex-direction: row;
    }

    .page-footer .footer-content .footer-section {
        margin-right: 30px;
    }

    .page-footer .footer-content .footer-section.footer-about {
        width: 40%;
    }

    .page-footer .footer-content h2 {
        position: relative;
        color: white;
        font-weight: 500;
        margin-bottom: 22px;
    }

    .page-footer .footer-content h2:before {
        content: "";
        position: absolute;
        bottom: -10px;
        left: 0;
        width: 80px;
        height: 3px;
        background-color: var(--main-color-orange);
    }

    .footer-about .footer-logo {
        position: relative;
        margin-bottom: 20px;
        height: 52px;
    }

    .footer-about .footer-logo img {
        height: 100%
    }

    .footer-about .media-icons {
        margin-top: 30px;
        display: flex;
    }

    .footer-about .media-icons a {
        height: 40px;
        width: 40px;
        margin-right: 16px;
        border-radius: 50%;
        text-align: center;
        line-height: 40px;
        color: white;
        font-size: 22px;
        text-decoration: none;
        justify-content: center;
        align-items: center;
        transition: all 0.4s ease;
    }

    .footer-about .media-icons .fa-github {
        font-size: 42px;
    }

    .footer-about .media-icons a:nth-child(1) {
        background: #4267b2;
    }

    .footer-about .media-icons a:nth-child(1):hover {
        color: #4267b2;
        background: #fff;
    }

    .footer-about .media-icons a:nth-child(2) {
        background: #1da1f2;
    }

    .footer-about .media-icons a:nth-child(2):hover {
        color: #1da1f2;
        background: #fff;
    }

    .footer-about .media-icons a:nth-child(3) {
        background: #e1306c;
    }

    .footer-about .media-icons a:nth-child(3):hover {
        color: #e1306c;
        background: #fff;
    }

    .footer-about .media-icons a:nth-child(4) {
        background: #0077b5;
    }

    .footer-about .media-icons a:nth-child(4):hover {
        color: #0077b5;
        background: #fff;
    }

    .footer-about .media-icons a:nth-child(5) {
        color: rgb(255, 70, 70);
        background: #fff;
    }

    .footer-about .media-icons a:nth-child(5):hover {
        color: #fff;
        background: rgb(255, 70, 70);
    }

    .footer-links {
        position: relative;
        width: 25%;
        padding-left: 60px;
    }

    .footer-links ul li {
        list-style: none;
    }

    .footer-links ul li a {
        color: #999;
        text-decoration: none;
        margin-bottom: 10px;
        display: inline-block;
        transition: all 0.4s ease;
    }

    .footer-links ul li a:hover {
        padding-left: 8px;
        color: white;
    }

    .footer-contact {
        width: calc(35% - 60px);
        margin-right: 0 !important;
        padding-left: 30px;
    }

    .footer-contact .info {
        position: relative;
    }

    .footer-contact .info li {
        display: flex;
        margin-bottom: 16px;
    }

    .footer-contact .info li span:nth-child(1) {
        color: white;
        font-size: 20px;
        margin-right: 10px;
    }

    .footer-contact .info li span {
        color: #999;
    }

    .footer-contact .info li a {
        color: #999;
        text-decoration: none;
        transition: all 0.4s ease;
    }

    .footer-contact .info li a:hover {
        color: white;
        padding-left: 8px;
    }

    .page-footer .footer-copyright {
        position: absolute;
        background-color: #181818;
        color: #999;
        width: 100%;
        text-align: center;
        padding-top: 12px;
        bottom: 0px;
        left: 0px;
        right: 0px;
    }

    @media (max-width: 992px) {
        .page-footer {
            padding: 30px;
        }
        .footer-logo img {
            height: 46px;
        }
    }

    @media (max-width: 782px) {
        .footer-logo img {
            height: 42px;
        }
        .page-footer .footer-content {
            flex-direction: column;
        }
        .page-footer .footer-content .footer-section {
            margin-right: 0;
            margin-bottom: 40px;
        }
        .footer-links {
            padding-left: 30px;
        }
        .page-footer .footer-content .footer-section.footer-about,
        .footer-links,
        .footer-contact {
            width: 100%;
        }
        .footer-copyright {
            padding: 8px 40px;
        }
    }


    /*==============================================================================
                                 Range Price Input
    ==============================================================================*/

    .price-input{
        width: 100%;
        display: flex;
        margin: 10px 0 20px;
    }
    .price-input .field{
        display: flex;
        width: 100%;
        height: 26px;
        align-items: center;
    }
    .field input{
        width: 100%;
        height: 100%;
        outline: none;
        font-size: 17px;
        border-radius: 5px;
        text-align: center;
        border: 1px solid #999;
        -moz-appearance: textfield;
    }
    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }
    .price-input .separator{
        width: 40px;
        display: flex;
        font-size: 18px;
        align-items: center;
        justify-content: center;
    }
    .slider{
        height: 5px;
        position: relative;
        background: #ddd;
        border-radius: 5px;
    }
    .slider .progress{
        height: 100%;
        left: 18%;
        right: 20%;
        position: absolute;
        border-radius: 5px;
        background: var(--main-bg-color);
    }
    .range-input{
        position: relative;
    }
    .range-input input{
        position: absolute;
        width: 100%;
        height: 5px;
        top: -5px;
        background: none;
        pointer-events: none;
        -webkit-appearance: none;
        -moz-appearance: none;
    }
    input[type="range"]::-webkit-slider-thumb{
        height: 17px;
        width: 17px;
        border-radius: 50%;
        background: var(--main-bg-color);
        pointer-events: auto;
        -webkit-appearance: none;
        box-shadow: 0 0 6px rgba(0,0,0,0.05);
    }
    input[type="range"]::-moz-range-thumb{
        height: 17px;
        width: 17px;
        border: none;
        border-radius: 50%;
        background: var(--main-bg-color);
        pointer-events: auto;
        -moz-appearance: none;
        box-shadow: 0 0 6px rgba(0,0,0,0.05);
    }
</style>