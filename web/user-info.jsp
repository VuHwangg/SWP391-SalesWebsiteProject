
<!--Thẻ này không được bỏ vì giúp gõ tiếng việt trong file-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                <!-- Content Center -->
                <div class="content-center bg-offwhite">
                    <!-- Breadcrumb -->
                    <div class="breadcrumb">
                        <a href="index.jsp">Trang chủ</a>
                        <span>&nbsp;/&nbsp;</span>
                        <a href="user-info.jsp">Thông tin cá nhân</a>
                    </div>
                    <%
                                            String mess = (String)request.getAttribute("err");
                                            if(mess == null) mess="";           
                                        %>
                                        <p><%=mess%></p>
                    <form action="EditProfile" >
                        <div id="profile-content">

                            <div>Customer Name: <br/><input type="text" name="name" value="<%=cus.getCustomerName()%>" required=""></div>
                            <div>Address: <br/><input type="text" name="adress" value="<%=cus.getAddress()%>" required=""></div>
                            <div>Phone: <br/><input type="text" name="phone" value="<%=cus.getPhone()%>" required=""></div>                      
                            <div><input type="submit" value="Edit"/></div>


                        </div>
                    </form>
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
