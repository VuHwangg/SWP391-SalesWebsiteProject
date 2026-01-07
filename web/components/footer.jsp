<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Footer -->
<footer class="page-footer">
    <div class="footer-content">

        <div class="footer-section footer-about">
            <div class="footer-logo">
                <!--              <img src="index.jsp" alt="Logo">-->
                <h1 style="color: white">ApexTec</h1>
            </div>
            <div class="description">
                <p>
                    ApexTec là cửa hàng chuyên cũng cấp các mặt hàng về công nghệ như điện thoại và laptop với mức giá tốt nhất trên thị trường, miễn phí giao hàng trên toàn quốc. 
                </p>
            </div>
            <div class="media-icons">
                <a target="_blank" rel="noopener noreferrer" href="#" hidden><i class="bi bi-google"></i></a>
                <a target="_blank" rel="noopener noreferrer" href="#" hidden><i class="bi bi-twitter"></i></a>
                <a target="_blank" rel="noopener noreferrer" href="#" hidden><i class="bi bi-instagram" ></i></a>
                <a target="_blank" rel="noopener noreferrer" href="#"><i class="bi bi-github"></i></a>
                <a onclick="mailto()"><i class="bi bi-google"></i></a>
                <script>
                    function mailto() {
                        Swal.fire({
                            icon: 'info',
                            title: 'apextec@gmail.com',
                            text: 'Gửi mail cho chúng tôi để được hỗ trợ !!'
                        })
                    }
                </script>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            </div>
        </div>

        <div class="footer-section footer-links">
            <h2>Truy Cập</h2>
            <ul>
                <li><a href="filter?type=0">Điện thoại</a></li>
                <li><a href="filter?type=1">Laptop</a></li>
                <li><a href="topsaler">Sản phẩm bán chạy</a></li>
                <li><a href="topdiscount">Sản phẩm khuyến mại</a></li>
                <li><a href="order-lookup-guest.jsp">Tra cứu đơn hàng</a></li>
            </ul>
        </div> 

        <div class="footer-section footer-contact">
            <h2>Liên Hệ</h2>
            <ul class="info">
                <li>
                    <span><i class="bi bi-geo-alt-fill" aria-hidden="true"></i>&nbsp;</span>
                    <span>
                        Trường Quốc Tế <br>
                        Đại Học Quốc Gia Hà Nội<br>
                        Việt Nam
                    </span>
                </li>
                <li>
                    <span><i class="bi bi-telephone-fill" aria-hidden="true"></i>&nbsp;</span>
                    <span>
                        <a href="tel:0833232520">+84 328 696 018</a>
                    </span>
                </li>
                <li>
                    <span><i class="bi bi-envelope-fill" aria-hidden="true"></i>&nbsp;</span>
                    <span><a href="mailto:apectex@gmail.com">apextec@gmail.com</a></span>
                </li>
        </div>
    </div>

    <div class="footer-copyright">
        <p>Made by ThoVu<br><span style="color: #fff;">VNU-IS Group 1 Website Project</span></p>
    </div>
</footer>
