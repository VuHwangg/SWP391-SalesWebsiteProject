<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/head.jsp" %>
        <%@include file="styles/css/login-style.jsp" %>
        <title>Đăng nhập cho admin</title>
    </head>
    <body>
        <!-- Section: Design Block -->
        <section
            class="text-center h-100 w-100 d-inline-block"
            style="min-height: 100vh"
            >
            <!-- Background image -->
            <div
                class="p-4 bg-image"
                >
                <div class="d-flex justify-content-start align-items-start">
                    <a
                        class="btn btn-outline-light"
                        href="home"
                        style="font-weight: 500"
                        >
                        <i class="bi bi-house me-1"></i>Trang chủ
                    </a>
                </div>
                <h1 style="color: white">FTECH</h1>
                <h4 style="color: white">
                    Store chuyên cung cấp đồ công nghệ hàng đầu Việt Nam
                </h4>
            </div>
            <!-- Background image -->

            <div class="container-fluid d-inline-block">
                <div class="row">

                    <!--Col-6-->
                    <div class="col-md-8" style="padding: 0; margin: auto">
                        <div
                            class="card rounded-5 shadow-5-strong"
                            style="
                            background: hsla(0, 0%, 100%, 0.7);
                            backdrop-filter: blur(30px);
                            "
                            >
                            <div class="card-body py-5 px-md-5">
                                <div class="row d-flex justify-content-center">
                                    <div class="col-lg-8">
                                        <h1 class="fw-bold mb-2">
                                            ĐĂNG NHẬP
                                        </h1>
                                        <!--Đăng nhập cho user-->


                                        <!--Login with account password-->
                                        <div class="border-top border-dark border-3 my-3"></div>
                                        <p class="mb-3" style="color: #fb1514; font-size: 20px">
                                            Phần đăng nhập chỉ dành cho nhân viên
                                        </p>
                                        
                                        <form action="LoginEmpt" method="post">
                                            <%
                                            String mess = (String)request.getAttribute("err");
                                            if(mess == null) mess="";           
                                        %>
                                        <p><%=mess%></p>
                                            <div class="mb-3">
                                                <input
                                                    name="email"
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="Username"
                                                    />
                                            </div>
                                            <div class="mb-3">
                                                <input
                                                    name="pass"
                                                    type="password"
                                                    class="form-control"
                                                    id="exampleInputPassword1"
                                                    placeholder="Password"
                                                    />
                                            </div>

                                            <button
                                                type="submit"
                                                class="btn w-100 btn-submit"
                                                style=""
                                                >
                                                LOGIN
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!--JS bootstrap 5 include -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"
        ></script>
    </body>
</html>