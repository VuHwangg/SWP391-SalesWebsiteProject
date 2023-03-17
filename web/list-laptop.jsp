
<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="helper" class="util.Helper"/>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <c:if test="${param.type == 1}">
            <title>Laptop</title>
        </c:if>
        <c:if test="${param.type == 0}">
            <title>Điện thoại</title>
        </c:if>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        <main>
            <!--navigation bar-->
            <%@include file="components/navbar.jsp" %>

            <div class="main-container">
                <!--Side banner-->
                <%@include file="components/side-banner.jsp" %>

                <!-- Content Center -->
                <div class="content-center bg-offwhite">
                    <!-- Breadcrumb -->
                    <div class="breadcrumb">
                        <a href="home">Trang chủ</a>
                        <span>&nbsp;/&nbsp;</span>
                        <c:if test="${param.type == 1}">
                            <a href="#">Laptop</a>
                        </c:if>
                        <c:if test="${param.type == 0}">
                            <a href="#">Điện thoại</a>
                        </c:if>

                    </div>
                    <!-- carousel -->
                    <div class="small-main-carousel carousel slide" id="carousel-main" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carousel-main" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carousel-main" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carousel-main" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="img/banner/small_banner_1.jpg" class="d-block w-100" alt="banner 1">
                            </div>
                            <div class="carousel-item">
                                <img src="img/banner/small_banner_2.jpg" class="d-block w-100" alt="banner 2">
                            </div>
                            <div class="carousel-item">
                                <img src="img/banner/small_banner_3.jpg" class="d-block w-100" alt="banner 3">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carousel-main" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carousel-main" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                    <!-- list product block -->
                    <div class="list-product">


                        <div class="row">
                            <!-- list of filter check-box column -->
                            <div class="filter col-sm-3">
                                <form action="" method="get">
                                    <div class="row">
                                        <p class="filter-title">Hãng sản xuất</p>
                                        <div class="col-lg-6">
                                            <input
                                                <c:if test="${helper.compareWithAll(requestScope.brands)}">
                                                    checked="checked"
                                                </c:if>
                                                type="checkbox" name="brand" id="brand0" value="all"/>
                                            <label for="brand0">Tất cả</label>
                                        </div>
                                        <c:forEach items="${requestScope.allBrands}" var="allBrand">
                                            <div class="col-lg-6">
                                                <input
                                                    <c:if test="${helper.checked(allBrand.name, requestScope.brands)}">
                                                        checked="checked"
                                                    </c:if>
                                                    type="checkbox" name="brand" id="brand${allBrand.id}" value="${allBrand.name}" />
                                                <label for="brand${allBrand.id}">${allBrand.name}</label>
                                            </div>
                                        </c:forEach>

                                    </div>

                                    <div class="row">
                                        <p class="filter-title">Nhu cầu sử dụng</p>
                                        <div class="col-lg-6">
                                            <input
                                                <c:if test="${helper.compareWithAll(requestScope.needs)}">
                                                    checked="checked"
                                                </c:if>
                                                type="checkbox" name="needs" id="needs"  value="all"/>
                                            <label for="needs">Tất cả</label>
                                        </div>
                                        <c:forEach items="${requestScope.allRequirements}" var="allRequirement">
                                            <div class="col-lg-6">
                                                <input
                                                    <c:if test="${helper.checked(allRequirement.name, requestScope.needs)}">
                                                        checked="checked"
                                                    </c:if>
                                                    type="checkbox" name="needs" id="needs${allRequirement.id}" value="${allRequirement.name}"/>
                                                <label for="needs${allRequirement.id}">${allRequirement.name}</label>
                                            </div>
                                        </c:forEach>

                                    </div>

                                    <div class="row">
                                        <p class="filter-title">Kích thước màn hình</p>
                                        <div class="col-12">
                                            <input
                                                <c:if test="${helper.compareWithAll(requestScope.sizes)}">
                                                    checked="checked"
                                                </c:if>
                                                type="checkbox" name="size-screen" id="size-screen1"  value="all"/>
                                            <label for="size-screen1">Tất cả</label>
                                        </div>
                                        <div class="col-12">
                                            <input
                                                <c:if test="${helper.checkSize(1, requestScope.sizes)}">
                                                    checked="checked"
                                                </c:if>
                                                type="checkbox" name="size-screen" id="size-screen2" value="size1"/>
                                            <label for="size-screen2">Dưới 13 inch</label>
                                        </div>
                                        <div class="col-12">
                                            <input 
                                                <c:if test="${helper.checkSize(2, requestScope.sizes)}">
                                                    checked="checked"
                                                </c:if>
                                                type="checkbox" name="size-screen" id="size-screen3" value="size2"/>
                                            <label for="size-screen3">Từ 13 inch đến 15 inch</label>
                                        </div>
                                        <div class="col-12">
                                            <input 
                                                <c:if test="${helper.checkSize(3, requestScope.sizes)}">
                                                    checked="checked"
                                                </c:if>
                                                type="checkbox" name="size-screen" id="size-screen4" value="size3"/>
                                            <label for="size-screen4">Từ 15 inch đến 17 inch</label>
                                        </div>
                                        <div class="col-12">
                                            <input 
                                                <c:if test="${helper.checkSize(4, requestScope.sizes)}">
                                                    checked="checked"
                                                </c:if>
                                                type="checkbox" name="size-screen" id="size-screen5" value="size4"/>
                                            <label for="size-screen5">Trên 17 inch</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="wrapper">
                                            <p class="filter-title">Mức giá</p>
                                            <div class="price-input">
                                                <div class="field">

                                                    <input name="from" type="number" class="input-min" value="${param.from}">
                                                    <span>&nbsp;&#8363</span>
                                                </div>
                                                <div class="separator">&nbsp;<i class="bi bi-arrow-right"></i>&nbsp;</div>
                                                <div class="field">
                                                    <input name="to" type="number" class="input-max" value="${param.to}">
                                                    <span>&nbsp;&#8363</span>
                                                </div>
                                            </div>
                                            <div class="slider">
                                                <div class="progress" style="left: 0%; right: 100%"></div>
                                            </div>
                                            <div class="range-input">
                                                <input  type="range" class="range-min" min="0" max="100000000" value="${requestScope.from}" step="2000000">
                                                <input type="range" class="range-max" min="0" max="100000000" value="${requestScope.to}" step="2000000">
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" name="type" value="${param.type}"/>
                                    <input class="btn-filter" type="submit" value=" Tìm kiếm" />
                                </form>
                            </div>
                            <!-- list of product column -->
                            <div class="list cover-block col-sm-9">
                                <!-- sort method radio check -->
                                <div class="sort-method row">
                                    <div class="col-4 sort-method-title">
                                        <p>Sắp xếp theo:</p>
                                    </div>
                                    <div class="col-md-8">
                                        <form action="" method="get">
                                            <div class="btn-group sort-method-selection" role="group">
                                                <button class="btn btn-outline-danger
                                                        <c:if test="${helper.checkSort(param.sort)==1}">
                                                            active
                                                        </c:if>
                                                        " name="sort" value="none">
                                                    Khuyến mãi
                                                </button>
                                                <button class="btn btn-outline-danger
                                                        <c:if test="${helper.checkSort(param.sort)==2}">
                                                            active
                                                        </c:if>
                                                        " name="sort" value="ASC">
                                                    Giá tăng dần
                                                </button>
                                                <button class="btn btn-outline-danger
                                                        <c:if test="${helper.checkSort(param.sort)==3}">
                                                            active
                                                        </c:if>
                                                        " name="sort" value="DESC">
                                                    Giá giảm dần
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <!-- list all product -->

                                <div class="row">
                                    <c:forEach items="${requestScope.filterList}" var="filter">
                                        <a class="product col-md-4 col-sm-6" href="product_detail?product_id=${filter.id}">
                                            <div class="product-img">
                                                <img
                                                    src="${filter.image[0].url}"
                                                    alt="iphone"
                                                    />
                                            </div>
                                            <div class="product-name">
                                                <p>${filter.name}</p>
                                            </div>
                                            <div class="row price-block">
                                                <div class="col-8">
                                                    <c:if test="${filter.discount>0}">
                                                        <div class="product-old-price">
                                                            <s> ${helper.convertBigNum(filter.original_price)}&nbsp;<span>VNĐ</span></s>
                                                        </div>
                                                    </c:if>

                                                    <div class="product-price">
                                                        <p> ${helper.convertBigNum(filter.current_price)}&nbsp;<span>VNĐ</span></p>
                                                    </div>

                                                    <div class="product-status">
                                                        <c:if test="${filter.qty >= 1}">

                                                            <!--Còn hàng-->
                                                            <div class="text-success">
                                                                <i class="bi bi-check-all"></i>
                                                                <span>Còn hàng</span>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${filter.qty < 1}">
                                                            <!--Hết hàng-->
                                                            <div class="text-danger">
                                                                <i class="bi bi-x-lg"></i>
                                                                <span>Hết hàng</span>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <c:if test="${filter.discount>0}">
                                                    <div class="col-4">
                                                        <p class="sale-percent">${helper.convertBigNum(filter.discount)}%</p>
                                                    </div>
                                                </c:if>   

                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                                <div class="pagination d-flex justify-content-center mt-5">
                                    <form action="" method="get">
                                        <div class="btn-group" role="group">
                                            <c:if test="${requestScope.page!=1}">
                                                <button class="btn btn-outline-danger arrow
                                                        " name="page" value="${requestScope.page-1}">
                                                    <i class="bi bi-chevron-double-left"></i>
                                                </button>
                                            </c:if>

                                            <c:forEach var = "i" begin = "1" end = "${requestScope.totalPage}">
                                                <button class="btn btn-outline-danger
                                                        <c:if test="${requestScope.page==i}">
                                                            active
                                                        </c:if>
                                                        " name="page" value="${i}">
                                                    ${i}
                                                </button>
                                            </c:forEach>
                                            <c:if test="${requestScope.page!=requestScope.totalPage}">
                                                <button class="btn btn-outline-danger arrow

                                                        " name="page" value="${requestScope.page+1}">
                                                    <i class="bi bi-chevron-double-right"></i>
                                                </button>
                                            </c:if>
                                        </div>
                                    </form>
                                </div>
                            </div>
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
