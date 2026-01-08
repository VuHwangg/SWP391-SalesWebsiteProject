<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer class="page-footer">
    
    <style>
        /* Class riêng cho nút đăng ký */
        .btn-premium-service {
            /* Reset lại các thuộc tính đang làm nút bị méo/tròn */
            width: auto !important;       /* Bỏ chiều rộng cố định của icon */
            height: auto !important;      /* Bỏ chiều cao cố định của icon */
            line-height: normal !important; /* Reset line-height */
            
            /* Style mới cho nút */
            display: inline-block !important;
            background-color: white !important;
            color: #6f42c1 !important; /* Màu tím */
            padding: 8px 20px !important; /* Tạo độ dày cho nút */
            border-radius: 25px !important; /* Bo tròn kiểu viên thuốc thay vì hình tròn 50% */
            text-decoration: none !important;
            font-weight: bold !important;
            font-size: 14px !important;
            margin-left: 15px !important; /* Cách icon Google ra một chút */
            
            /* Hiệu ứng mượt mà */
            transition: transform 0.3s ease, box-shadow 0.3s ease !important;
            white-space: nowrap !important; /* Không cho chữ xuống dòng */
            border: 2px solid white !important; /* Viền trắng */
        }

        /* Hiệu ứng khi di chuột vào */
        .btn-premium-service:hover {
            transform: scale(1.1) !important;
            background-color: #f0f0f0 !important;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3) !important;
            color: #5a32a3 !important; /* Tím đậm hơn chút khi hover */
            cursor: pointer;
        }
        
        /* Căn chỉnh lại khung chứa icon để chúng nằm ngang hàng */
        .media-icons-container {
            display: flex !important;
            align-items: center !important; /* Căn giữa theo chiều dọc */
            flex-wrap: wrap !important;
            gap: 10px; /* Khoảng cách giữa các phần tử */
        }
    </style>

    <div class="footer-content">

        <div class="footer-section footer-about">
            <div class="footer-logo">
                <h1 style="color: white">ApexTec</h1>
            </div>
            <div class="description">
                <p>
                    ApexTec là cửa hàng chuyên cũng cấp các mặt hàng về công nghệ như điện thoại và laptop với mức giá tốt nhất trên thị trường, miễn phí giao hàng trên toàn quốc. 
                </p>
            </div>
            
            <div class="media-icons media-icons-container">
                <a target="_blank" rel="noopener noreferrer" href="#" hidden><i class="bi bi-google"></i></a>
                <a target="_blank" rel="noopener noreferrer" href="#" hidden><i class="bi bi-twitter"></i></a>
                <a target="_blank" rel="noopener noreferrer" href="#" hidden><i class="bi bi-instagram" ></i></a>
                
                <a onclick="mailto()" style="cursor: pointer;"><i class="bi bi-google"></i></a>

                <a href="https://forms.gle/64qVr67pcCJR2LRLA" target="_blank" class="btn-premium-service">
                    Đăng ký dịch vụ cao cấp
                </a>

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
            </ul>
        </div>
    </div>

    <div class="footer-copyright">
        <p>Made by ThoVu<br><span style="color: #fff;">VNU-IS Group 1 Website Project</span></p>
    </div>
</footer>
