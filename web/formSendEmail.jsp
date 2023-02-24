

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Gửi HTML</title>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Fredoka+One&family=Pacifico&family=Tourney&display=swap');
        
        * {
            box-sizing: border-box;
        }
        html {
            font-family: 'Roboto', sans-serif;
        }
        body {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container{
            width: 600px;
        }

        .content{
            padding: 12px 32px;
            border-bottom: 2px solid gray;
        }

        .content:last-child {
            border-bottom: 0;
        }

        .name-brand {
            text-decoration: none; 
            color: #DC4546;
        }

        .name-brand:hover {
            text-decoration: underline;
        }

        .row {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
        }

        .row-2 {
            display: flex;
            flex-direction: row;
        }

        .row-2 div:first-child {
            padding-right: 80px;
        }

        .product-block {
            display: flex;
            flex-direction: row;
        }

        .img-product {
            width: 70px;
            height: 70px;
        }

        img {
            width: 100%;
            height: 100%;
        }

        table {
            border-collapse:collapse;
        }

        table.list-product {
            width: 100%;
        }

        table.list-product tr {
            border-bottom: 1px solid gray;
        }

        table tr td:last-child {
            text-align: end;
            font-weight: bold;
            color: #DC4546; 
        }

        .the-line {
            width: 100%;
            border: 1px solid gray;
        }

        .total-price {
            display: flex;
            flex-direction: column;
            align-items: end;
            padding-top: 12px;
        }

        .total-price .cal-price {
            border-bottom: 1px solid gray;
            padding-bottom: 16px;
            margin-bottom: 16px;
        }

        .total-price .cal-price tr{
            line-height: 2;
        }

        .vnd {
            font-weight: 700;
            text-decoration: underline;
        }
    </style>

</head>
<body>
    <div class="container">
        <div class="content">
            <div class="row">
                <h1 style="font-family: 'Fredoka One', cursive; color: #DC4546;">Awns's Store</h1>
                <h3 style="color: #DC4546; text-decoration: underline;">#10000001</h3>
            </div>
            <h2>Cảm ơn quý khách đã mua hàng tại <a href="#" class="name-brand">Awns's Store</a></h2>
            <p>Xin chào <span style="font-weight: bold;">Nghĩa</span>, Awns's Store rất vui đã nhận được đơn đặt hàng của quý khách. Chúng tôi sẽ liên hệ ngay để xác nhận đơn hàng</p>
        </div>
        <div class="content">
            <h3>Thông tin đơn hàng</h3>
            <table class="list-product">
                <tr>
                    <td>
                        <div class="img-product">
                            <img src="https://lh3.googleusercontent.com/RdeXEY3YxcBdisJpe5tjuwaXC8Lywor77bEC7V5rnB5ywvYfIpAA8Jd1lDoIic30M3MLcw_vp0WNdC-WFG0">
                        </div>
                    </td>
                    <td>
                        Bàn phím Rapoo V500L Rainbow
                    </td>
                    <td>
                        x1
                    </td>
                    <td>
                        490,000&nbsp;<span class="vnd">đ</span>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <div class="img-product">
                            <img src="https://lh3.googleusercontent.com/RdeXEY3YxcBdisJpe5tjuwaXC8Lywor77bEC7V5rnB5ywvYfIpAA8Jd1lDoIic30M3MLcw_vp0WNdC-WFG0">
                        </div>
                    </td>
                    <td>
                        Bàn phím Rapoo V500L Rainbow
                    </td>
                    <td>
                        x1
                    </td>
                    <td>
                        490,000&nbsp;<span class="vnd">đ</span>
                    </td>
                </tr>
                
            </table>
            <div class="total-price">
                <table class="cal-price" style="width: 370px;">
                    <tr>
                        <td>Tổng giá trị sản phẩm: </td>
                        <td>980,000&nbsp;<span class="vnd">đ</span></td>
                    </tr>
                    <tr>
                        <td>Phí vận chuyển: </td>
                        <td>0&nbsp;<span class="vnd">đ</span></td>
                    </tr>
                </table>
                <table style="width: 370px;">
                    <tr>
                        <td>Tổng cộng: </td>
                        <td style="font-size: 24px;">
                            980,000&nbsp;<span>VNĐ</span>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="content">
            <h3>Thông tin khách hàng</h3>
            <div class="row-2">
                <div>
                    <h4>Địa chỉ giao hàng</h4>
                    <p>Trần Đại Nghĩa</p>
                    <p>Huyện Thạch Thất, Hà Nội</p>
                    <p>0812345678</p>
                </div>
                <div>
                    <h4>Phương thức thanh toán</h4>
                    <p>Thanh toán khi giao hàng COD</p>
                </div>
            </div>
        </div>
        <div class="content">
            <p>
                Nếu quý khách có bất cứ câu hỏi nào, đừng ngần ngại liên lạc với chúng tôi thông qua tổng đài 
                <a href="tel:0833232520" style="color: #DC4546; font-weight: bold; text-decoration: none;">0833 232 520</a>. 
                Chúng tôi sẽ luôn sẵn sàng hỗ trợ quý khách.
            </p>
        </div>
    </div>
</body>
</html>
