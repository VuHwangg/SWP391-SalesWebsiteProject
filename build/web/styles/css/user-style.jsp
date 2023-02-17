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
  
  ul {
    margin: 0;
    padding: 0;
  }
  
  input[type="checkbox"] {
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
      0% { left: 0; }
      50% { left: 73%; }
      100% { left: 0; }
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
  
  .navbar .navbar-brand {
      font-family: 'Fredoka One', cursive;
      font-size: 26px;
      line-height: 43px;
      width: 160px;
      text-align: center;
      transition: all 0.3s ease-in;
      border: 3px solid var(--main-bg-color);
  }
  
  .navbar .navbar-brand:hover {
      color: var(--main-bg-color);
      background-color: white;
      font-size: 22px;
      border: 3px solid white;
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
    padding: 16px 8px;
    position: relative;
    font-weight: 700;
    text-transform: uppercase;
    transition: all 0.2s ease-in-out;
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
  
    /* animation left to right 
          transition: all 0.5s ease;    
      */
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
    border: 2px solid #c3c3c3;;
    padding: 0;
    overflow: hidden;
  }

  .navbar .dropdown-menu .dropdown-item {
    color: #404044;
    font-weight: 500;
    padding-top: 10px;
    padding-bottom: 10px;
    border-bottom: 1px solid #c3c3c3;;
  }

  .navbar .dropdown-menu .dropdown-item:hover {
    background-color: #d0d0d0;
    color: var(--main-bg-color);
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

  @media (max-width: 520px) {
    .navbar .search-box {
      width: 50px;
    }
  }

  @media (max-width: 992px) {
    .navbar {
      padding-top: 8px;
      padding-bottom: 8px;
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
    padding: 100px 20px 10px;
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

  .main-carousel {
    padding-top: 88px;
    background-color: var(--main-bg-color);
  }
  
  .main-carousel .carousel-item {
      height: 500px;
      width: 100%;
  }
  
  .small-main-carousel .carousel-item {
      height: 300px;
      width: 100%;
  }

  .small-main-carousel {
    background-color: white;
  }


/*==============================================================================
                                List Product
==============================================================================*/
  .list-product {
    padding: 30px 40px 1px 40px;
  }
  
  .cover-block {
    padding: 30px;
    margin-bottom: 20px;
    border-radius: 16px;
    overflow: hidden;
  }
  
  .list-product .cover-block {
    background-color: white;
  }

/*                          List in home page 
--------------------------------------------------------------------------------*/

  .list-product .row-title {
    font-size: 32px;
    font-weight: 700;
    text-transform: capitalize;
    margin-bottom: 20px;
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
    padding: 12px; 
    overflow: hidden;
    text-decoration: none;
    color: var(--main-color-black);
  }

  .product p {
    margin-bottom: 0;
  }

  .product:hover {
    border: 1px solid #c3c3c3;
    box-shadow: 2px 2px 10px rgb(160, 158, 164);
  }

  .product:hover .product-img{
    padding: 0;
  }

  .product .product-img {
    width: 100%;
    height: 200px;
    margin-bottom: 10px;
    padding: 10px;
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
    background-position: 0 -6px;
  }
  .product .sale-percent {
    color: white;
    font-weight: 700;
    margin-top: 14px;
    font-size: 15px;
  }

  @media (max-width: 575px) {
    .list-product .product .product-name {
      height: auto;
    }
  }
  
/*==============================================================================
                                Profile
==============================================================================*/

.profile {
    padding: 15px 40px 1px 40px;
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
  
/*--------------- Quantity input in Product Detail --------------------------*/
    
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

.order-lookup .order-detail tr:first-child{
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