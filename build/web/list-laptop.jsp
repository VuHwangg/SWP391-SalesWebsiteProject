
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
        <title>Laptop</title>
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
                        <a href="#">Laptop</a>
                    </div>
                    <!-- carousel -->
                    <div class="small-main-carousel">
                        <img src="img/small-main-carousel-demo.png" alt="" />
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
                                            <input type="checkbox" name="brand" id="brand1" checked value="all"/>
                                            <label for="brand1">Tất cả</label>
                                        </div>
                                        <c:forEach items="${requestScope.allBrands}" var="allBrand">
                                            <div class="col-lg-6">
                                                <input type="checkbox" name="brand" id="brand2" value="${allBrand.name}" />
                                                <label for="brand2">${allBrand.name}</label>
                                            </div>
                                        </c:forEach>

                                    </div>

                                    <div class="row">
                                        <p class="filter-title">Nhu cầu sử dụng</p>
                                        <div class="col-lg-6">
                                            <input type="checkbox" name="needs" id="needs1" checked value="all"/>
                                            <label for="needs1">Tất cả</label>
                                        </div>
                                        <c:forEach items="${requestScope.allRequirements}" var="allRequirement">
                                            <div class="col-lg-6">
                                                <input type="checkbox" name="needs" id="needs2" value="${allRequirement.name}"/>
                                                <label for="needs2">${allRequirement.name}</label>
                                            </div>
                                        </c:forEach>
                                        
                                    </div>

                                    <div class="row">
                                        <p class="filter-title">Kích thước màn hình</p>
                                        <div class="col-12">
                                            <input type="checkbox" name="size-screen" id="size-screen1" checked value="all"/>
                                            <label for="size-screen1">Tất cả</label>
                                        </div>
                                        <div class="col-12">
                                            <input type="checkbox" name="size-screen" id="size-screen2" value="size1"/>
                                            <label for="size-screen2">Dưới 13 inch</label>
                                        </div>
                                        <div class="col-12">
                                            <input type="checkbox" name="size-screen" id="size-screen3" value="size2"/>
                                            <label for="size-screen3">Từ 13 inch đến 15 inch</label>
                                        </div>
                                        <div class="col-12">
                                            <input type="checkbox" name="size-screen" id="size-screen4" value="size3"/>
                                            <label for="size-screen4">Từ 15 inch đến 17 inch</label>
                                        </div>
                                        <div class="col-12">
                                            <input type="checkbox" name="size-screen" id="size-screen5" value="size4"/>
                                            <label for="size-screen5">Trên 17 inch</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <p class="filter-title">Mức giá</p>
                                        <div class="price-input">
                                            <div class="field">

                                                <input name="from" type="number" class="input-min" value="10000000">
                                                <span>&nbsp;VNĐ</span>
                                            </div>
                                            <div class="separator">&nbsp;<i class="bi bi-arrow-right"></i>&nbsp;</div>
                                            <div class="field">
                                                <input name="to" type="number" class="input-max" value="80000000">
                                                <span>&nbsp;VNĐ</span>
                                            </div>
                                        </div>
                                        <div class="slider">
                                            <div class="progress"></div>
                                        </div>
                                        <div class="range-input">
                                            <input  type="range" class="range-min" min="0" max="100000000" value="10000000" step="2000000">
                                            <input " type="range" class="range-max" min="0" max="100000000" value="80000000" step="2000000">
                                        </div>
                                    </div>
                                    <input type="hidden" name="type" value="${param.type}"/>
                                    <input class="btn-filter" type="submit" value=" Tìm kiếm " />
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
                                        <div class="btn-group sort-method-selection" role="group">
                                            <a class="btn btn-outline-danger active" href="search?txtSearch=${param.txtSearch}&sort=none">
                                                Khuyến mãi
                                            </a>
                                            <a class="btn btn-outline-danger" href="search?txtSearch=${param.txtSearch}&sort=ASC">
                                                Giá tăng dần
                                            </a>
                                             <a class="btn btn-outline-danger" href="search?txtSearch=${param.txtSearch}&sort=DESC">
                                                Giá giảm dần
                                            </a>
                                        </div>
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
                                                </div>
                                                <c:if test="${filter.discount>0}">
                                                    <div class="col-4">
                                                        <p class="sale-percent">-${filter.discount}%</p>
                                                    </div>
                                                </c:if>   

                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                                <%@include file="components/pagination.jsp" %>  
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
