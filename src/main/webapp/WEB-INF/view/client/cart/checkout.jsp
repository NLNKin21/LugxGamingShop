<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>Thanh toán - GamingHouse</title>

                <!-- Bootstrap & Font Awesome -->
                <link href="/client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
                <link rel="stylesheet" href="/client/css/fontawesome.css" />
                <link rel="stylesheet" href="/client/css/templatemo-lugx-gaming.css" />
                <link rel="stylesheet" href="/client/css/owl.css" />
                <link rel="stylesheet" href="/client/css/animate.css" />
                <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

                <style>
                    .checkout-summary {
                        background-color: #f8f9fa;
                        border: 1px solid #dee2e6;
                        border-radius: 10px;
                        padding: 30px;
                    }

                    .qr-code-container {
                        text-align: center;
                        padding: 20px;
                        border: 2px dashed #007bff;
                        border-radius: 10px;
                        background-color: #fff;
                    }

                    .qr-code-container img {
                        max-width: 200px;
                        margin-bottom: 15px;
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

                <!-- Page Header -->
                <div class="page-heading header-text py-4 bg-light mb-4">
                    <div class="container">
                        <h3 class="mb-2">Thanh Toán Đơn Hàng</h3>
                        <span class="breadcrumb">
                            <a href="/">Trang chủ</a> &gt; <a href="/cart">Giỏ hàng</a> &gt; Thanh toán
                        </span>
                    </div>
                </div>

                <!-- Checkout Content -->
                <div class="container py-5">
                    <c:choose>
                        <c:when test="${empty cartDetails}">
                            <div class="text-center p-5">
                                <h4 class="mb-3">Giỏ hàng của bạn đang trống.</h4>
                                <a href="/" class="btn btn-primary">Quay lại cửa hàng</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="row g-5">
                                <!-- Payment Info -->
                                <div class="col-md-5 col-lg-4 order-md-last">
                                    <div class="checkout-summary">
                                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                                            <span class="text-primary">Tóm tắt đơn hàng</span>
                                            <span class="badge bg-primary rounded-pill">${cartDetails.size()}</span>
                                        </h4>
                                        <ul class="list-group mb-3">
                                            <c:forEach var="item" items="${cartDetails}">
                                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                                    <div>
                                                        <h6 class="my-0">${item.product.name}</h6>
                                                        <small class="text-muted">${item.product.category}</small>
                                                    </div>
                                                    <span class="text-muted">
                                                        <fmt:formatNumber value="${item.price}" pattern="#,##0" />đ
                                                    </span>
                                                </li>
                                            </c:forEach>
                                            <li class="list-group-item d-flex justify-content-between">
                                                <span>Tổng cộng (VND)</span>
                                                <strong>
                                                    <fmt:formatNumber value="${totalPrice}" pattern="#,##0" />đ
                                                </strong>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <!-- QR Code and Finalize -->
                                <div class="col-md-7 col-lg-8">
                                    <h4 class="mb-3">Thông tin thanh toán</h4>
                                    <div class="qr-code-container">
                                        <h5>Quét mã QR để thanh toán</h5>
                                        <p class="text-muted">Sử dụng ứng dụng ngân hàng hoặc ví điện tử của bạn.</p>
                                        <img src="https://api.vietqr.io/image/970422-10210000999999-2n2rI14.jpg?accountName=LU%20GIA%20XUAN&amount=${totalPrice}&addInfo=GamingHouse%20${sessionScope.id}"
                                            alt="QR Code Thanh toán">
                                        <p>Nội dung chuyển khoản: <strong>GamingHouse ${sessionScope.id}</strong></p>
                                        <hr>
                                        <p>Sau khi hoàn tất chuyển khoản, vui lòng nhấn nút bên dưới để hoàn tất đơn
                                            hàng.</p>
                                        <form action="/place-order" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <button type="submit" class="w-100 btn btn-primary btn-lg">Hoàn tất đơn
                                                hàng</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Footer -->
                <jsp:include page="../layout/footer.jsp" />

                <!-- Scripts -->
                <script src="/client/vendor/jquery/jquery.min.js"></script>
                <script src="/client/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="/client/js/custom.js"></script>

            </body>

            </html>