
<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="helper" class="util.helper"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Trang chủ</title>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        
        <main>
            <!--navigation bar-->
            <%@include file="components/navbar.jsp" %>

            <div class="main-container">
                <!--Side banner-->
                <%@include file="components/side-banner.jsp" %>
                <!-- Content Center -->
                <div class="content-center bg-red">
                    <!-- carousel -->
                    <div class="main-carousel">
                        <img src="img/main-carousel-demo.png" alt="" />
                    </div>
                    <!-- list product -->
                    <div class="list-product">
                        <!-- Hàng sản phẩm khuyến mại -->
                        <div class="sale-product row cover-block">
                            <div class="row-title">
                                <i class="bi bi-caret-right-fill"></i>
                                <a href="#">Sản phẩm khuyến mại</a>
                            </div>

                            <c:forEach items="${requestScope.onSaleList}" var="onSale">
                                <a class="product col-md-3 col-sm-6" href="product_detail?product_id=${onSale.id}">
                                    <div class="product-img">
                                        <img
                                            src="${onSale.image[0].url}"
                                            alt="iphone"
                                            />
                                    </div>
                                    <div class="product-name">
                                        <p>${onSale.name}</p>
                                    </div>
                                    <div class="row price-block">
                                        <div class="col-8">
                                            <c:if test="${onSale.discount>0}">
                                                <div class="product-old-price">
                                                    <s> ${helper.convertBigNum(onSale.original_price)}&nbsp;<span>VNĐ</span></s>
                                                </div>
                                            </c:if>

                                            <div class="product-price">
                                                <p> ${helper.convertBigNum(onSale.current_price)}&nbsp;<span>VNĐ</span></p>
                                            </div>
                                        </div>
                                        <c:if test="${onSale.discount>0}">
                                            <div class="col-4">
                                                <p class="sale-percent">-${onSale.discount}%</p>
                                            </div>
                                        </c:if>   

                                    </div>
                                </a>
                            </c:forEach>
                        </div>

                        <!-- Hàng sản phẩm bán chạy -->
                        <div class="bestseller-products row cover-block">
                            <div class="row-title">
                                <i class="bi bi-caret-right-fill"></i>
                                <a href="#">Sản phẩm bán chạy</a>
                            </div>
                            <c:forEach items="${requestScope.topSoldList}" var="topSold">
                                <a class="product col-md-3 col-sm-6" href="product_detail?product_id=${topSold.id}">
                                    <div class="product-img">
                                        <img
                                            src="${topSold.image[0].url}"
                                            alt="iphone"
                                            />
                                    </div>
                                    <div class="product-name">
                                        <p>${topSold.name}</p>
                                    </div>
                                    <div class="row price-block">
                                        <div class="col-8">
                                            <c:if test="${topSold.discount>0}">
                                                <div class="product-old-price">
                                                    <s> ${helper.convertBigNum(topSold.original_price)}&nbsp;<span>VNĐ</span></s>
                                                </div>
                                            </c:if>

                                            <div class="product-price">
                                                <p> ${helper.convertBigNum(topSold.current_price)}&nbsp;<span>VNĐ</span></p>
                                            </div>
                                        </div>
                                        <c:if test="${topSold.discount>0}">
                                            <div class="col-4">
                                                <p class="sale-percent">-${topSold.discount}%</p>
                                            </div>
                                        </c:if>   
                                    </div>
                                </a>
                            </c:forEach>

                        </div>

                        <!-- Hàng sản phẩm điện thoại -->
                        <div class="phones-products row cover-block">
                            <div class="row-title">
                                <i class="bi bi-caret-right-fill"></i>
                                <a href="phone-list.html">Điện thoại</a>
                            </div>
                            <c:forEach items="${requestScope.phoneList}" var="phone">
                                <a class="product col-md-3 col-sm-6" href="product_detail?product_id=${phone.id}">
                                    <div class="product-img">
                                        <img
                                            src="${phone.image[0].url}"
                                            alt="iphone"
                                            />
                                    </div>
                                    <div class="product-name">
                                        <p>${phone.name}</p>
                                    </div>
                                    <div class="row price-block">
                                        <div class="col-8">
                                            <c:if test="${phone.discount>0}">
                                                <div class="product-old-price">
                                                    <s> ${helper.convertBigNum(phone.original_price)}&nbsp;<span>VNĐ</span></s>
                                                </div>
                                            </c:if>

                                            <div class="product-price">
                                                <p> ${helper.convertBigNum(phone.current_price)}&nbsp;<span>VNĐ</span></p>
                                            </div>
                                        </div>
                                        <c:if test="${phone.discount>0}">
                                            <div class="col-4">
                                                <p class="sale-percent">-${phone.discount}%</p>
                                            </div>
                                        </c:if>   
                                    </div>
                                </a>
                            </c:forEach>

                        </div>

                        <!-- Hàng sản phẩm laptop -->
                        <div class="laptop-products row cover-block">
                            <div class="row-title">
                                <i class="bi bi-caret-right-fill"></i>
                                <a href="laptop-list.html">Laptop</a>
                            </div>
                            <c:forEach items="${requestScope.laptopList}" var="laptop">
                                <a class="product col-md-3 col-sm-6" href="product_detail?product_id=${laptop.id}">
                                    <div class="product-img">
                                        <img
                                            src="${laptop.image[0].url}"
                                            alt="iphone"
                                            />
                                    </div>
                                    <div class="product-name">
                                        <p>${laptop.name}</p>
                                    </div>
                                    <div class="row price-block">
                                        <div class="col-8">
                                            <c:if test="${laptop.discount>0}">
                                                <div class="product-old-price">
                                                    <s> ${helper.convertBigNum(laptop.original_price)}&nbsp;<span>VNĐ</span></s>
                                                </div>
                                            </c:if>

                                            <div class="product-price">
                                                <p> ${helper.convertBigNum(laptop.current_price)}&nbsp;<span>VNĐ</span></p>
                                            </div>
                                        </div>
                                        <c:if test="${laptop.discount>0}">
                                            <div class="col-4">
                                                <p class="sale-percent">-${laptop.discount}%</p>
                                            </div>
                                        </c:if>   
                                    </div>
                                </a>
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
            <!--footer-->
            <%@include file="components/footer.jsp" %>
        </main>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"
        ></script>
        <%@include file="styles/js/script.jsp" %>
    </body>
</html>

