<%-- 
    Document   : list-topsaler
    Created on : Mar 20, 2023, 2:39:10 PM
    Author     : admin
--%>


<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="helper" class="util.Helper"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Sản phẩm </title>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        <main>
            <!--navigation bar-->
            <%@include file="components/navbar.jsp" %>

            <div class="main-container">
                <!--Side banner-->
                <%@include file="components/side-banner.jsp" %>
                <!-- Content Center -->
                <div class="content-center">
                    <!-- Breadcrumb -->
                    <div class="breadcrumb" style="border-radius: 0 0 20px 20px">
                        <a href="home">Trang chủ</a>
                        <span>&nbsp;/&nbsp;</span>
                        <c:if test="${requestScope.namePage==0}">
                            <a href="#">Sản phẩm bán chạy</a>
                        </c:if>
                        <c:if test="${requestScope.namePage==1}">
                            <a href="#">Sản phẩm khuyến mại</a>
                        </c:if>
                        
                    </div>
                    <!-- list product block -->
                    <div class="list-product">
                        <!-- list of product column -->
                        <div class="list cover-block">
                            <!-- sort method radio check -->
                            <div class="sort-method row">
                                <div class="col-4 sort-method-title">
                                    <p>Sắp xếp theo:</p>
                                </div>
                                <div class="col-md-8">
                                    <form
                                        class="d-flex search-box"
                                        role="search"
                                        action=""
                                        method="GET"
                                        >
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
                                        <input type="hidden" name="page" value="${param.page}" />
                                    </form>
                                </div>
                            </div>

                            <!-- list all product -->
                            <div class="row">
                                <c:forEach items="${requestScope.topList}" var="search">
                                    <a class="product col-md-3 col-sm-6" href="product_detail?product_id=${search.id}">
                                        <div class="product-img">
                                            <img
                                                src="data:image/png;base64,${search.image[0].url}"
                                                alt="iphone"
                                                />
                                        </div>
                                        <div class="product-name">
                                            <p>${search.name}</p>
                                        </div>
                                        <div class="row price-block">
                                            <div class="col-8">
                                                <c:if test="${search.discount>0}">
                                                    <div class="product-old-price">
                                                        <s> ${helper.convertBigNum(search.original_price)}&nbsp;<span>VNĐ</span></s>
                                                    </div>
                                                </c:if>

                                                <div class="product-price">
                                                    <p> ${helper.convertBigNum(search.current_price)}&nbsp;<span>VNĐ</span></p>
                                                </div>
                                                
                                                <div class="product-status">
                                                        <c:if test="${search.qty >= 1}">

                                                            <!--Còn hàng-->
                                                            <div class="text-success">
                                                                <i class="bi bi-check-all"></i>
                                                                <span>Còn hàng</span>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${search.qty < 1}">
                                                            <!--Hết hàng-->
                                                            <div class="text-danger">
                                                                <i class="bi bi-x-lg"></i>
                                                                <span>Hết hàng</span>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                            </div>
                                            <c:if test="${search.discount>0}">
                                                <div class="col-4">
                                                    <p class="sale-percent">${helper.convertBigNum(search.discount)}%</p>
                                                </div>
                                            </c:if>   

                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                            <form action="" method="get">
                                <div class="pagination d-flex justify-content-center mt-5">

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
                                </div>
                                <input type="hidden" name="sort" value="${param.sort}" />
                            </form>

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
        <!--Vanta.js Animation Background-->
        <%@include file="components/vantajs-link.jsp" %>
    </body>
</html>

