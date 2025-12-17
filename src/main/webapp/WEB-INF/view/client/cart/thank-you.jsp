<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>Đặt hàng thành công - GamingHouse</title>

            <!-- Bootstrap & Font Awesome -->
            <link href="/client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
            <link rel="stylesheet" href="/client/css/fontawesome.css" />
            <link rel="stylesheet" href="/client/css/templatemo-lugx-gaming.css" />
            <link rel="stylesheet" href="/client/css/owl.css" />
            <link rel="stylesheet" href="/client/css/animate.css" />
            <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

            <style>
                .thank-you-page {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                    min-height: 60vh;
                    text-align: center;
                }

                .thank-you-page .icon {
                    font-size: 80px;
                    color: #28a745;
                    margin-bottom: 20px;
                }

                .thank-you-page h2 {
                    font-size: 2.5rem;
                    font-weight: 700;
                    margin-bottom: 15px;
                }

                .thank-you-page p {
                    font-size: 1.1rem;
                    color: #666;
                    margin-bottom: 30px;
                }
            </style>
        </head>

        <body>

            <!-- Preloader -->
            <div id="js-preloader" class="js-preloader">
                <div class="preloader-inner">
                    <span class="dot"></span>
                    <div class="dots"><span></span><span></span><span></span></div>
                </div>
            </div>

            <!-- Header -->
            <jsp:include page="../layout/header.jsp" />

            <!-- Thank You Content -->
            <div class="container">
                <div class="thank-you-page">
                    <div class="icon"><i class="fa fa-check-circle"></i></div>
                    <h2>Cảm ơn bạn đã đặt hàng!</h2>
                    <p>Đơn hàng của bạn đã được xử lý thành công. Bạn có thể xem lại lịch sử mua hàng trong trang cá
                        nhân.</p>
                    <div>
                        <a href="/products" class="btn btn-primary rounded-pill px-4 py-2">Tiếp tục mua sắm</a>
                        <a href="/order-history" class="btn btn-outline-secondary rounded-pill px-4 py-2 ms-2">Xem lịch
                            sử đơn hàng</a>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <jsp:include page="../layout/footer.jsp" />

            <!-- Scripts -->
            <script src="/client/vendor/jquery/jquery.min.js"></script>
            <script src="/client/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="/client/js/custom.js"></script>

        </body>

        </html>