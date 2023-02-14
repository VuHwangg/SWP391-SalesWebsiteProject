<%-- 
    Document   : order-confirmation-page
    Created on : Feb 14, 2023, 9:15:21 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous" />

        <!-- bootstrap icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />

        <title>OrderLookup</title>
    </head>

    <body>
        <div class="container mt-2">
            <div>
                <div class="row">
                    <div class="col-md-6">
                        <h3>GEARVN.COM</h3>
                    </div>
                    <div class="col-md-6 d-flex justify-content-end">
                        <h5>ĐƠN HÀNG#1000249704</h5>
                    </div>
                </div>
            </div>

            <div>
                <h3 class="mt-3">Cám ơn quý khách đã mua hàng tại GearVN</h3>
                <p>Xin chào Nghĩa, GearVN rất vui đã nhận được đơn đặt hàng của quý khách</p>
                <p>Chúng tôi sẽ liên hệ lai ngay để xác nhận đơn hàng.</p>
            </div>

            

            <div class=" border-top border-secondary border-1 my-3"></div>
            <div>
                <h3 class="mb-3">Thông tin đơn hàng</h3>
            </div>

            <div>
                <table class="table">
                    <tbody>
                        <tr>
                            <td scope="col">
                                <img style="height: 100px;" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfNkICMpIhE08rDgHgaB80AVc5mTXkoywhSQ&usqp=CAU">
                            </td>
                            <td scope="col">Bàn phím Rapoo V500L Rainbow x 1</td>
                            <td class="p-0" scope="col"> <span class="d-flex justify-content-end">500000VNĐ</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div>
                <div class="row">
                    <div class="col-6"></div>
                    <div class="col-6">
                        <div class="row col">
                            <div class="col ">Tổng giá trị sản phẩm</div>
                            <div class="col d-flex justify-content-end fw-bold ">490000VNĐ</div>
                        </div>
                        <div class="row">
                            <div class="col ">Khuyến mãi</div>
                            <div class="col d-flex justify-content-end fw-bold">0VNĐ</div>
                        </div>

                        <div class="row">
                            <div class="col">Phí vận chuyển</div>
                            <div class="col d-flex justify-content-end fw-bold">0VNĐ</div>
                        </div>
                        <div style="max-width: 100%;" class=" border-top border-secondary border-1 my-3"></div>
                        <div class="row">
                            <div class="col">Tổng cộng</div>
                            <div class="col d-flex justify-content-end fw-bold fs-3">100,000VNĐ</div>
                        </div>

                    </div>
                </div>
            </div>


        </div>

        <div>

        </div>
    </div>



    <script src=" https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js " integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN " crossorigin="anonymous "></script>
</body>

</html>
