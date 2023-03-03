<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.Helper"/>

<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/user-style.jsp" %>
        <title>Thanh toán</title>
    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        <main>
            <!--navigation bar-->
            <%@include file="components/navbar.jsp" %>

            <div class="py-5"></div>
            <div class="container min-vh-100">
                <!-- Breadcrumb -->
                <div class="breadcrumb" style="padding-top: 20px">
                    <a href="home">Trang chủ</a>
                    <span>&nbsp;/&nbsp;</span>
                    <a href="cart.jsp">Giỏ hàng</a>
                    <span>&nbsp;/&nbsp;</span>
                    <a href="#">Thanh toán</a>
                </div>

                <!--Main info-->
                <div class="row mt-3 w-100 mx-auto">
                    <!--Shipment Details-->
                    <div class="col-md-6 border border-2 rounded-1 p-4">
                        <div>
                            <h3 class="fw-bold mb-4">THÔNG TIN GIAO HÀNG</h3>
                        </div>
                        <%
                            Customer cus1 = (Customer) session.getAttribute("cust");
                            String email = "";
                            String name = "";
                            String address = "";
                            String phone = "";
                            if (cus != null) {
                                email = cus1.getEmail();
                                name = cus1.getCustomerName();
                                address = cus1.getAddress();
                                phone = cus1.getPhone();
                            }
                            int total_price = 0;
                            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
                            if (carts != null) {
                                for (Map.Entry<Integer, Cart> cart : carts.entrySet()) {
                                    total_price += Float.parseFloat(cart.getValue().getProduct().getCurrent_price() + "") * cart.getValue().getQuantity();
                                }
                            }

                        %>
                        <form action="Payment2" method="post">

                            <div class="mb-3">
                                <input type="text" class="form-control" id="name" name="name" aria-describedby="emailHelp" placeholder="Họ và tên" value="<%=name%>" required <%=name == null ? "readonly" : ""%>>

                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" id="phone" name="phone" aria-describedby="emailHelp" placeholder="Số điện thoại" value="<%=phone%>" required <%=phone == null ? "readonly" : ""%>>

                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Email" value="<%=email%>" required <%=email == null ? "readonly" : ""%>>

                            </div>
                            <div class="mb-3">
                                <textarea class="form-control" id="address" name="address" rows="3" placeholder="Địa chỉ nhận hàng" required <%=address == null ? "readonly" : ""%>><%=address%></textarea>
                            </div>

                            <div>
                                <h3 class="fw-bold">PHƯƠNG THỨC THANH TOÁN</h3>
                            </div>
                            <div>
                                <div class="form-check mt-3">
                                    <input class="form-check-input" checked type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                                    <label class="form-check-label" for="flexRadioDefault1">
                                        Thanh toán trực tiếp khi nhận hàng
                                    </label>
                                </div>
                            </div>
                       
                    </div>



                    <!--Payment-->
                    <div class="col-md-6 border border-2 rounded-1 p-4">
                        <div>
                            <h3 class="fw-bold mb-4">HÓA ĐƠN ĐẶT HÀNG</h3>
                        </div>
                        <div class="border-top border-dark border-3 my-3"></div>

                        <c:forEach items="${carts}" var="cart">
                            <div class="row">
                                <div class="col-md-6">
                                    <span class="fw-bolder fs-5" style="color: #555555;">${cart.getValue().getProduct().getName()}</span>
                                    <br>
                                    <span class="fw-light fs-6">Màu sắc: ${cart.getValue().getProduct().getColor()}</span>
                                    <br>
                                    <span class="fw-light fs-6">Số lượng: ${cart.getValue().getQuantity()}</span>
                                </div>
                                <div class="col-md-6 d-flex justify-content-end ">
                                    <span class="fw-light fs-6">${Helper.convertBigNum(cart.getValue().getQuantity()*cart.getValue().getProduct().getCurrent_price())}</span>
                                </div>
                            </div>
                            <div class="border-top border-dark border-1 my-2"></div>
                        </c:forEach>


                        <!--Like a table just edit it-->
                        <!--                        <div class="row">
                                                    <div class="col-md-6">
                                                        <span class="fw-bolder fs-5" style="color: #555555;">IPhone 14 Pro Max 128GB</span>
                                                        <br>
                                                        <span class="fw-light fs-6">Mầu sắc: Tím</span>
                                                        <br>
                                                        <span class="fw-light fs-6">Số lượng: 2</span>
                                                    </div>
                                                    <div class="col-md-6 d-flex justify-content-end ">
                                                        <span class="fw-light fs-6">55.980.000 VND</span>
                                                    </div>
                                                </div>
                                                <div class="border-top border-dark border-1 my-2"></div>-->




                        <!---Shipment cost-->
                        <div class="row">
                            <div class="col-md-6">
                                <span class="fw-bolder fs-5">Phí vận chuyển</span>
                            </div>
                            <div class="col-md-6 d-flex justify-content-end ">
                                <span class="fw-light fs-6">00.000 VND</span>
                            </div>
                        </div>

                        <div class="border-top border-dark border-3 my-3"></div>

                        <div class="row">
                            <div class="col-md-6">
                                <span class="fw-bolder fs-4">Tổng cộng</span>
                            </div>
                            <div class="col-md-6 d-flex justify-content-end ">
                                <span class="fs-4 fw-bolder" style="color: #dc3545;"><%=helper.convertBigNum(total_price)%> VND</span>
                            </div>

                            <div class="d-flex justify-content-center mt-3">
                                <button type="submit" class="btn btn-danger w-100 fs-4" data-toggle="modal" data-target="#exampleModal">HOÀN TẤT ĐẶT HÀNG</button>
                            </div>
                        </div>
                    </form>
                    </div>

                </div>
            </div>
            <!--footer-->
            <!-- Modal -->
   
            </div>
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
