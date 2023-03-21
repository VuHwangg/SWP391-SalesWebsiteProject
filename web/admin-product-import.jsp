<%-- 
    Document   : admin-product-import
    Created on : Mar 20, 2023, 4:14:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>

    <body  style="height: 100vh">

        <div class="d-flex justify-content-center align-items-center h-100" >
            <form action="ImportProduct" method="POST" style="min-width: 300px">
                <div class="input-group w-100 mb-3">
                    <label class="input-group-text bg-danger text-white" style="font-weight: 700px" for="inputQuantity">Số lượng</label>
                    <input name="productQuantity" type="text" class="form-control text-center" id="inputQuantity" placeholder="VD: 16" maxlength="6" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');" required>
                    <input name="productId" value="${requestScope.productId}" type="text" hidden>
                    <span class="input-group-text bg-danger text-white" style="font-weight: 700px; width: 100px" >sản phẩm</span>
                </div>
                <div class="input-group w-100 mb-3">
                    <label class="input-group-text bg-danger text-white" style="font-weight: 700px" for="inputPrice">Giá nhập</label>
                    <input name="productPrice" type="text" class="form-control text-center" id="inputPrice" placeholder="VD: 19000000" maxlength="10" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');" required>
                    <span class="input-group-text bg-danger text-white" style="font-weight: 700px; width: 100px" >VNĐ</span>
                </div>
                <p class="text-danger m-0" style="text-align: center">* THAO TÁC LƯU SẼ KHÔNG THỂ HOÀN TÁC *<br>bạn vui lòng kiểm tra kỹ thông tin trước khi ấn nút lưu</p>
                <input type="submit" class="btn btn-danger w-100" value="Lưu">
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>

</html>
