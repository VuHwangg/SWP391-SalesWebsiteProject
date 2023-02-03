
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
        <title>Kết quả tìm kiếm</title>
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
                        <a href="index.jsp">Trang chủ</a>
                        <span>&nbsp;/&nbsp;</span>
                        <a href="#">Tìm kiếm</a>
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
                                    <div class="btn-group sort-method-selection" role="group">
                                        <input
                                            type="radio"
                                            class="btn-check"
                                            name="btnradio"
                                            id="btnradio1"
                                            autocomplete="off"
                                            checked
                                            />
                                        <a class="btn btn-outline-danger" href="search?txtSearch=${param.txtSearch}&sort=none">
                                            <label for="btnradio1">
                                                Khuyến mãi
                                          </label>
                                        </a>
                                        

                                        <input
                                            type="radio"
                                            class="btn-check"
                                            name="btnradio"
                                            id="btnradio2"
                                            autocomplete="off"
                                            />
                                        <a class="btn btn-outline-danger" href="search?txtSearch=${param.txtSearch}&sort=ASC">
                                            <label  for="btnradio2">
                                                Giá tăng dần
                                            </label>
                                        </a>
                                        

                                        <input
                                            type="radio"
                                            class="btn-check"
                                            name="btnradio"
                                            id="btnradio3"
                                            autocomplete="off"
                                            />
                                         <a class="btn btn-outline-danger" href="search?txtSearch=${param.txtSearch}&sort=DESC">
                                            <label  for="btnradio3">
                                                Giá giảm dần
                                            </label>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- list all product -->
                            <div class="row">
                                <c:forEach items="${requestScope.searchList}" var="search">
                                    <a class="product col-md-3 col-sm-6" href="#">
                                        <div class="product-img">
                                            <img
                                                src="${search.image[0].url}"
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
                                            </div>
                                            <c:if test="${search.discount>0}">
                                                <div class="col-4">
                                                    <p class="sale-percent">-${search.discount}%</p>
                                                </div>
                                            </c:if>   

                                        </div>
                                    </a>
                                </c:forEach>
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

