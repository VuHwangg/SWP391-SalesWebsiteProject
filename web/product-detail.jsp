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

        <!-- Light Slider CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/css/lightslider.css" integrity="sha512-+1GzNJIJQ0SwHimHEEDQ0jbyQuglxEdmQmKsu8KI7QkMPAnyDrL9TAnVyLPEttcTxlnLVzaQgxv2FpLCLtli0A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <title>Chi tiết sản phẩm</title>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        <main>
            <!--navigation bar-->
            <%@include file="components/navbar.jsp" %>

            <div class="main-container">

                <!-- Content Center -->
                <div class="content-center">
                    <!-- Breadcrumb -->
                    <div class="breadcrumb">
                        <a href="home">Trang chủ</a>
                        <span>&nbsp;/&nbsp;</span>
                        <a href="filter?type=${requestScope.product.type}">${helper.typeName(requestScope.product.type)}</a>
                        <span>&nbsp;/&nbsp;</span>
                        <a href="#">${requestScope.product.name}</a>
                    </div>

                    <div class="row product-detail-title">
                        <h1 class="col-sm-8 fw-bold">${requestScope.product.name}</h1>
                        <div class="col-sm-4 sub-vote">
                            <div class="stars">
                                <c:forEach var = "i" begin = "1" end = "5">
                                    <c:choose>
                                        <c:when test="${i <= helper.getAvgRate(requestScope.product)}">
                                            <i class="bi bi-star-fill active"></i>
                                        </c:when>    
                                        <c:otherwise>
                                            <i class="bi bi-star-fill"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                            <h6>${helper.totalVote(requestScope.product)} đánh giá</h6>
                        </div>
                        <div class="border-top border-3 my-2"></div>
                    </div>

                    <div class="row mt-3 w-100 mx-auto product-detail">
                        <div class="col-md-8">
                            <div class="slider-img">
                                <div class="main-slider-img text-center p-4"> <img id="main-image" src="${requestScope.product.image[0].url}"/> </div>
                                <div class="thumbnail text-center"> 
                                    <c:forEach items="${requestScope.product.image}" var="image">
                                        <img onclick="change_image(this)" src="${image.url}"> 
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <h3 class="price fw-bold">${helper.convertBigNum(requestScope.product.current_price)} &#8363</h3>
                            <c:if test="${requestScope.product.discount>0}">
                                <h4 class="sale-price text-decoration-line-through">${helper.convertBigNum(requestScope.product.original_price)} &#8363</h4>
                            </c:if>   
                            <div class="row filter-product-group">
                                <h5>Chọn dung lượng sản phẩm (RAM-ROM):</h5>
                                <c:forEach items="${requestScope.optionList}" var="optionList">
                                    <a class="col-4 fp-btn <c:if test="${helper.compareProperties(optionList, requestScope.product)}">
                                       active
                                        </c:if>" href="product_detail?product_id=${optionList.id}">
                                        ${optionList.ram}GB-${optionList.memory}GB
                                    </a>
                                </c:forEach>
                            </div>

                            <div class="row filter-product-group">
                                <h5>Chọn màu sắc cho sản phẩm:</h5>
                                <c:forEach items="${requestScope.colorList}" var="colorList">
                                    <a class="col-4 fp-btn
                                       <c:if test="${helper.compareString(colorList.color, requestScope.product.color)}">
                                           active
                                       </c:if>" href="product_detail?product_id=${colorList.id}">
                                        ${colorList.color}
                                    </a>
                                </c:forEach>
                            </div>
                            <c:if test="${requestScope.qty >= 1}">
                                <!--Khi sản phẩm còn hàng-->    
                                <div class="row">
                                    <div class="col-12" style="padding: 0">
                                        <form action="AddToCart" method="GET">
                                            <!--Here-->
                                            <input type="number" name="quantity" class="numberInputHidden" value="1" hidden>
                                            <input type="text" name="product_id" value="${requestScope.product.id}" hidden>
                                            <button type="submit" class="buy-btn btn btn-danger w-100" >
                                                Mua ngay
                                            </button>
                                        </form>
                                    </div>
                                    <div class="col-4" style="padding: 0">
                                        <div class="quantity-input quantity-input-pd">
                                            <button class="minus-btn" type="button">-</button>
                                            
                                            <input type="number" class="quantity" id="quantityInput" name="quantity" value="1" min="1" max="${requestScope.maxQuantity}" readonly/>
                                            <button class="plus-btn" type="button">+</button>
                                        </div>
                                    </div>    
                                    <div class="col-8" style="padding: 0 0 0 8px">
                                        <form action="AddToCart" method="POST">
                                            <input type="number" name="quantity" class="numberInputHidden" value="1" hidden>
                                            <input type="text" name="product_id" value="${requestScope.product.id}" hidden>
                                            <button type="submit" class="add-cart-btn btn w-100">
                                                <table>
                                                    <tr>
                                                        <td style="width: 30%"><i class="bi bi-cart-plus-fill"></i></td>
                                                        <td style="width: 70%">Thêm vào giỏ hàng</td>
                                                    </tr>
                                                </table>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${requestScope.qty < 1}">
                                <!--Khi sản phẩm hết hàng-->            
                                <div class="row ">
                                    <div class="col-12" style="padding: 0;">
                                        <div class="sold-out-box p-3">
                                            <h4 class="text-center">Sản phẩm đang tạm hết hàng</h4>
                                            <p class="text-start" style="margin-bottom: 8px">Liên hệ với chúng tôi để biết thêm thông tin chi tiết</p>
                                            <div class="d-flex justify-content-between flex-column">
                                                <a class="btn btn-danger mb-2 fw-bold" href="mailto:awnsshop@gmail.com">awnsshop@gmail.com</a>
                                                <a class="btn btn-secondary fw-bold" href="tel:0833232520">+84 833 232 520</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <div style="padding: 0 12px">
                        <div class="cover-block similar-product">
                            <h3>Sản phẩm tương tự: </h3>
                            <ul class="list-slider autoWidth cs-hidden">
                                <c:forEach items="${requestScope.sameList}" var="sameList">
                                    <li>
                                        <a class="slider-product slider-product-similar product" href="product_detail?product_id=${sameList.id}">
                                            <div class="product-img">
                                                <img
                                                    src="${sameList.image[0].url}"
                                                    alt="iphone"
                                                    />
                                            </div>
                                            <div class="product-name">
                                                <p>${sameList.name}</p>
                                            </div>
                                            <div class="row price-block">
                                                <div class="col-8">
                                                    <c:if test="${sameList.discount>0}">
                                                        <div class="product-old-price">
                                                            <s> ${helper.convertBigNum(sameList.original_price)}&nbsp;<span>VNĐ</span></s>
                                                        </div>
                                                    </c:if>

                                                    <div class="product-price">
                                                        <p> ${helper.convertBigNum(sameList.current_price)}&nbsp;<span>VNĐ</span></p>
                                                    </div>
                                                    <div class="product-status">
                                                            <c:if test="${sameList.qty >= 1}">

                                                                <!--Còn hàng-->
                                                                <div class="text-success">
                                                                    <i class="bi bi-check-all"></i>
                                                                    <span>Còn hàng</span>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${sameList.qty < 1}">
                                                                <!--Hết hàng-->
                                                                <div class="text-danger">
                                                                    <i class="bi bi-x-lg"></i>
                                                                    <span>Hết hàng</span>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                </div>
                                                <c:if test="${sameList.discount>0}">
                                                    <div class="col-4">
                                                        <p class="sale-percent">${helper.convertBigNum(sameList.discount)}%</p>
                                                    </div>
                                                </c:if>   
                                            </div>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="row mt-3 w-100 mx-auto product-description">

                            <div class="cover-block product-description-left col-md-7 bg-danger">
                                <h3>Đặc điểm nổi bật của ${requestScope.product.name}:</h3>
                                <p>${requestScope.product.description}</p>
                            </div>

                            <div class="cover-block col-md-4">
                                <h3>Thông số kỹ thuật: </h3>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <tr>
                                            <th>Hệ điều hành:</th>
                                            <td>${requestScope.product.os}</td>
                                        </tr>
                                        <tr>
                                            <th>Kích thước màn hình: </th>
                                            <td>${requestScope.product.size} inches</td>
                                        </tr>
                                        <tr>
                                            <th>Dung lượng RAM:</th>
                                            <td>${requestScope.product.ram} GB</td>
                                        </tr>
                                        <tr>
                                            <th>Bộ nhớ trong:</th>
                                            <td>${requestScope.product.memory} GB</td>
                                        </tr>
                                        <tr>
                                            <th>CPU:</th>
                                            <td>${requestScope.product.cpu}</td>
                                        </tr>
                                        <tr>
                                            <th>Card đồ họa:</th>
                                            <td>${requestScope.product.graphic_card}</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="vote cover-block mt-3 w-100 mx-auto">
                            <div class="row">
                                <div class="vote-left col-4 text-center">
                                    <h6>Đánh giá trung bình</h6>
                                    <h3>${helper.getAvgRate(requestScope.product)}/5</h3>
                                    <div class="stars">
                                        <c:forEach var = "i" begin = "1" end = "5">
                                            <c:choose>
                                                <c:when test="${i <= helper.getAvgRate(requestScope.product)}">
                                                    <i class="bi bi-star-fill active"></i>
                                                </c:when>    
                                                <c:otherwise>
                                                    <i class="bi bi-star-fill"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                    </div>
                                    <h6>${helper.totalVote(requestScope.product)} đánh giá</h6>
                                </div>
                                <div class="col-8">
                                    <c:forEach var = "i" begin = "1" end = "5">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <span>${i}<i class="bi bi-star-fill active"></i></span>
                                            <!--old-->
                                            <!--                                        <div class="progress">
                                                                                     <div class="progress-bar bg-danger" style="width: 80%;"></div>
                                                                                    </div>-->
                                            <!--new-->
                                            <progress max="${helper.totalVote(requestScope.product)}" value="${helper.getNumofVote(requestScope.product, i)}" class="progress is-small m-0"></progress>
                                            <span>${helper.getNumofVote(requestScope.product, i)}</span>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center align-items-center flex-column">
                                <div class="border-top border-3 mt-4 mb-3 p-1 w-100" style="margin-bottom: 4px !important"></div>
                                <h5 class="text-center">Bạn thấy sao về sản phẩm này ?</h5>
                                <!-- Khi người dùng đã đăng nhập -->
                                <button type="button" class="btn btn-danger fs-5 w-100" style="max-width: 400px" data-bs-toggle="modal" data-bs-target="#feedbackModal">
                                    Đánh giá ngay
                                </button>
                                <!-- Khi người dùng chưa đăng nhập -->
                                <a href="login-user.jsp" class="btn btn-danger fs-5 w-100" style="max-width: 600px">
                                    Đăng nhập ngay để có thể đánh giá sản phẩm
                                </a>
                            </div>

                            <!-- Modal -->
                            <div class="modal fade" id="feedbackModal" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <form>
                                            <div class="modal-header justify-content-center">
                                                <h1 class="modal-title fs-5 text-center">Đánh giá và nhận xét sản phẩm <br> ${requestScope.product.name}</h1>
                                            </div>
                                            <div class="modal-body">
                                                <textarea class="form-control" rows="5" placeholder="Bạn nghĩ sao về sản phẩm này" minlength="1" maxlength="1000"></textarea>
                                                <div class="mb-3 mt-3">
                                                    <h5 class="fs-5">Bình chọn số sao cho sản phẩm</h5>
                                                </div>
                                                <div class="rating">
                                                    <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label>
                                                    <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label>
                                                    <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label>
                                                    <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label>
                                                    <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <input type="submit" class="btn btn-danger w-100" value="Gửi đánh giá">
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

        <%@include file="styles/js/script.jsp" %>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"
        ></script>

        <!--JQuery 3.6.3 (used for Light Slider)-->
        <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

        <!--Light Slider JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/js/lightslider.min.js" integrity="sha512-Gfrxsz93rxFuB7KSYlln3wFqBaXUc1jtt3dGCp+2jTb563qYvnUBM/GP2ZUtRC27STN/zUamFtVFAIsRFoT6/w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </body>
</html>
