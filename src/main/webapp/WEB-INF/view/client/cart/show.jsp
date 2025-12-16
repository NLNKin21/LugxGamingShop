<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>GamingHouse - Shop Game & Account Uy Tín #1 Việt Nam</title>

                <!-- Bootstrap & Font Awesome -->
                <link href="/client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
                <link rel="stylesheet" href="/client/css/fontawesome.css" />
                <link rel="stylesheet" href="/client/css/templatemo-lugx-gaming.css" />
                <link rel="stylesheet" href="/client/css/owl.css" />
                <link rel="stylesheet" href="/client/css/animate.css" />
                <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

                <style>
                    body {
                        font-family: 'Roboto', sans-serif;
                        background-color: #f8f9fa;
                        line-height: 1.6;
                    }

                    /* Header & breadcrumb */
                    .page-heading h3 {
                        font-weight: 700;
                        font-size: 2rem;
                    }

                    .breadcrumb a {
                        color: #007bff;
                        text-decoration: none;
                    }

                    .breadcrumb a:hover {
                        text-decoration: underline;
                    }

                    /* Table styles */
                    .table th,
                    .table td {
                        vertical-align: middle;
                    }

                    img {
                        max-width: 100%;
                        height: auto;
                    }

                    .img-fluid {
                        display: block;
                        max-width: 100%;
                        height: auto;
                    }

                    /* Cart items */
                    .cart-img {
                        width: 80px;
                        height: 80px;
                        object-fit: cover;
                        border-radius: 50%;
                    }

                    .cart-row {
                        margin-bottom: 15px;
                    }

                    .cart-summary {
                        background-color: #fff;
                        padding: 20px;
                        border-radius: 10px;
                        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
                    }

                    .cart-summary h4 {
                        font-weight: 700;
                    }

                    .cart-summary .total {
                        font-size: 1.25rem;
                        font-weight: 700;
                    }

                    .btn-primary {
                        background-color: #007bff;
                        border: none;
                    }

                    .btn-primary:hover {
                        background-color: #0069d9;
                    }

                    .btn-outline-secondary {
                        border-color: #6c757d;
                        color: #6c757d;
                    }

                    .btn-outline-secondary:hover {
                        background-color: #6c757d;
                        color: #fff;
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
                        <h3 class="mb-2">Cửa Hàng Game</h3>
                        <span class="breadcrumb">
                            <a href="/">Trang chủ</a> &gt; Giỏ hàng
                        </span>
                    </div>
                </div>

                <!-- Giỏ hàng -->
                <div class="container-fluid py-5">
                    <div class="container py-4">
                        <c:choose>
                            <c:when test="${empty cartDetails}">
                                <div class="text-center p-5">
                                    <h4 class="mb-3">Bạn chưa có sản phẩm nào trong giỏ hàng.</h4>
                                    <a href="/" class="btn btn-primary">Quay lại cửa hàng</a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="table-responsive">
                                    <table class="table align-middle">
                                        <thead>
                                            <tr>
                                                <th scope="col">Sản phẩm</th>
                                                <th scope="col">Tên</th>
                                                <th scope="col">Giá cả</th>
                                                <th scope="col">discount</th>
                                                <th scope="col">Thành tiền</th>
                                                <th scope="col">Xử lý</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="cartDetail" items="${cartDetails}">
                                                <tr>
                                                    <td>
                                                        <img src="/images/product/${cartDetail.product.image}"
                                                            alt="${cartDetail.product.name}" class="cart-img">
                                                    </td>
                                                    <td>
                                                        <a href="/product/${cartDetail.product.id}"
                                                            target="_blank">${cartDetail.product.name}</a>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${cartDetail.product.discount > 0}">
                                                                <del>
                                                                    <fmt:formatNumber
                                                                        value="${cartDetail.product.price}"
                                                                        pattern="#,##0" /> đ
                                                                </del>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <fmt:formatNumber value="${cartDetail.product.price}"
                                                                    pattern="#,##0" /> đ
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        ${cartDetail.product.discount} %
                                                    </td>

                                                    <td>
                                                        <span class="text-danger fw-bold">
                                                            <fmt:formatNumber value="${cartDetail.price}"
                                                                pattern="#,##0" /> đ
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <form method="post"
                                                            action="/delete-cart-product/${cartDetail.id}">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                            <button class="btn btn-sm btn-outline-danger rounded-circle"
                                                                type="submit">
                                                                <i class="fa fa-times"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <!-- Thông tin thanh toán -->
                                <div class="row justify-content-center mt-5">
                                    <div class="col-lg-8">
                                        <div class="cart-summary bg-white rounded shadow-sm">
                                            <h4 class="mb-4">Thông tin <span class="fw-normal">Đơn hàng</span></h4>
                                            <div class="d-flex justify-content-between mb-3">
                                                <h5 class="mb-0">Tạm tính:</h5>
                                                <p class="mb-0" data-cart-total-price="${totalPrice}">
                                                    <fmt:formatNumber value="${totalPrice}" pattern="#,##0" /> đ
                                                </p>
                                            </div>
                                            <div class="d-flex justify-content-between mb-3">
                                                <h5 class="mb-0">VAT:</h5>
                                                <p class="mb-0">0 đ</p>
                                            </div>
                                            <div
                                                class="border-top border-bottom py-3 d-flex justify-content-between mt-3">
                                                <h5 class="mb-0">Tổng tiền:</h5>
                                                <p class="mb-0 total" data-cart-total-price="${totalPrice}">
                                                    <fmt:formatNumber value="${totalPrice}" pattern="#,##0" /> đ
                                                </p>
                                            </div>
                                            <div class="mt-4 d-grid">
                                                <a href="/checkout"
                                                    class="btn btn-primary w-100 py-3 rounded-pill text-uppercase">
                                                    Đến trang thanh toán
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- Footer -->
                <jsp:include page="../layout/footer.jsp" />

                <!-- Scripts -->
                <script src="/client/vendor/jquery/jquery.min.js"></script>
                <script src="/client/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="/client/js/isotope.min.js"></script>
                <script src="/client/js/owl-carousel.js"></script>
                <script src="/client/js/counter.js"></script>
                <script src="/client/js/custom.js"></script>

                <!-- Optional: thêm script xử lý tăng giảm số lượng -->
                <script>
                    $(document).ready(function () {
                        $('.btn-minus').click(function () {
                            var input = $(this).siblings('input');
                            var currentVal = parseInt(input.val());
                            if (currentVal > 1) {
                                input.val(currentVal - 1).change();
                            }
                        });
                        $('.btn-plus').click(function () {
                            var input = $(this).siblings('input');
                            var currentVal = parseInt(input.val());
                            input.val(currentVal + 1).change();
                        });
                    });
                </script>

            </body>

            </html>