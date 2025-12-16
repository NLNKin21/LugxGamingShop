<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <html lang="vi">

            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>${product.name} - GamingHouse</title>

                <!-- Thay đổi font chữ Google Fonts -->
                <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
                    rel="stylesheet" />

                <link href="/client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="/client/css/fontawesome.css">
                <link rel="stylesheet" href="/client/css/templatemo-lugx-gaming.css">
                <link rel="stylesheet" href="/client/css/owl.css">
                <link rel="stylesheet" href="/client/css/animate.css">

                <style>
                    body {
                        font-family: 'Roboto', sans-serif;
                        background-color: #f8f9fa;
                        /* Màu nền sáng nhẹ */
                    }

                    /* Header và footer */
                    .header-text h3 {
                        font-weight: 700;
                        font-size: 2rem;
                        margin-bottom: 10px;
                    }

                    .breadcrumb a {
                        color: #007bff;
                        text-decoration: none;
                    }

                    .breadcrumb a:hover {
                        text-decoration: underline;
                    }

                    /* Sản phẩm chính */
                    .single-product {
                        background-color: #ffffff;
                        padding: 40px 20px;
                        border-radius: 15px;
                        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
                        margin-bottom: 50px;
                    }

                    .left-image img {
                        border-radius: 15px;
                        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
                        transition: transform 0.3s ease;
                    }

                    .left-image img:hover {
                        transform: scale(1.05);
                    }

                    /* Thông tin sản phẩm */
                    h4 {
                        font-weight: 700;
                        margin-bottom: 20px;
                        font-size: 2rem;
                    }

                    .price {
                        font-family: 'Arial Rounded MT Bold', sans-serif;
                    }

                    /* Nút mua hàng */
                    .main-button {
                        background-color: #007bff;
                        color: #fff;
                        border: none;
                        border-radius: 8px;
                        transition: background-color 0.3s ease, transform 0.2s;
                    }

                    .main-button:hover {
                        background-color: #0056b3;
                        transform: translateY(-2px);
                    }

                    /* Thông tin chung */
                    ul {
                        list-style: none;
                        padding: 0;
                    }

                    ul li {
                        margin-bottom: 8px;
                    }

                    ul li span {
                        font-weight: 600;
                    }

                    /* Tab */
                    .tabs-content {
                        margin-top: 30px;
                    }

                    /* Sản phẩm liên quan */
                    .related-games {
                        background-color: #f0f0f0;
                        padding: 50px 20px;
                    }

                    .item {
                        background-color: #fff;
                        border-radius: 10px;
                        padding: 15px;
                        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                        transition: transform 0.3s ease, box-shadow 0.3s ease;
                    }

                    .item:hover {
                        transform: translateY(-5px);
                        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
                    }

                    .item h4 {
                        font-size: 1.2rem;
                        margin-top: 10px;
                        margin-bottom: 8px;
                    }

                    /* Thư viện font-awesome */
                    .fa-shopping-bag {
                        margin-right: 8px;
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

                <!-- Page Heading -->
                <div class="page-heading header-text">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <h3>${product.name}</h3>
                                <span class="breadcrumb">
                                    <a href="/">Trang chủ</a> &gt;
                                    <a href="/shop">Shop</a> &gt;
                                    ${product.name}
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Product -->
                <div class="single-product section">
                    <div class="container">
                        <div class="row">
                            <!-- Hình ảnh sản phẩm -->
                            <div class="col-lg-6">
                                <div class="left-image">
                                    <img src="/images/product/${product.image}" alt="${product.name}">
                                </div>
                            </div>

                            <!-- Thông tin + Mua hàng -->
                            <div class="col-lg-6 align-self-center">
                                <h4>${product.name}</h4>

                                <!-- Giá tiền -->
                                <c:choose>
                                    <c:when test="${product.price == 0}">
                                        <span class="price" style="font-size: 36px; color: #28a745;">MIỄN PHÍ</span>
                                    </c:when>
                                    <c:when test="${product.discount > 0}">
                                        <span class="price">
                                            <em style="color: #888; font-size: 24px;"><del>
                                                    <fmt:formatNumber value="${product.price}" pattern="#,##0" />₫
                                                </del></em>
                                            <strong style="color: #e75e8d; font-size: 32px;">
                                                <fmt:formatNumber
                                                    value="${product.price * (1 - product.discount / 100.0)}"
                                                    pattern="#,##0" />₫
                                            </strong>
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="price" style="font-size: 32px; color: #e75e8d;">
                                            <fmt:formatNumber value="${product.price}" pattern="#,##0" />₫
                                        </span>
                                    </c:otherwise>
                                </c:choose>

                                <p style="margin-top: 20px; line-height: 1.8; color: #0d0d0d;">
                                    ${product.shortDesc}
                                </p>

                                <!-- Đã bán -->
                                <div style="margin: 25px 0;">
                                    <span style="color: #ffc107; font-weight: bold;"><i class="fa fa-star"></i> Đã bán:
                                        <strong>${product.sold}</strong>+</span>
                                </div>

                                <!-- Nút thêm vào giỏ -->
                                <form action="/add-product-to-cart" method="post" style="margin-top: 30px;">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <input type="hidden" name="productId" value="${product.id}" />
                                    <button type="submit" class="main-button">
                                        <i class="fa fa-shopping-bag"></i> THÊM VÀO GIỎ HÀNG
                                    </button>
                                </form>

                                <ul style="margin-top:30px;">
                                    <c:if test="${product.discount > 0}">
                                        <li><span>Giảm giá:</span> <strong
                                                style="color: #dc3545;">-${product.discount}%</strong>
                                        </li>
                                    </c:if>
                                    <li><span>Danh mục:</span> <strong>${product.category}</strong></li>
                                    <li><span>Thể loại:</span>
                                        <c:choose>
                                            <c:when test="${product.category == 'Account'}"><span
                                                    style="color:#ff9500;">Tài khoản Game</span></c:when>
                                            <c:when test="${product.category == 'BattleRoyale'}"><span
                                                    style="color:#ff2d55;">Battle Royale</span></c:when>
                                            <c:when test="${product.category == 'MOBA'}"><span
                                                    style="color:#007aff;">MOBA</span></c:when>
                                            <c:when test="${product.category == 'FPS'}"><span
                                                    style="color:#ff3b30;">FPS</span></c:when>
                                            <c:when test="${product.category == 'RPG'}"><span
                                                    style="color:#af52de;">RPG</span></c:when>
                                            <c:otherwise>${product.category}</c:otherwise>
                                        </c:choose>
                                    </li>
                                </ul>
                            </div>

                            <div class="col-lg-12">
                                <div class="sep"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Mô tả chi tiết + Reviews -->
                <div class="more-info">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="tabs-content">
                                    <div class="row">
                                        <div class="nav-wrapper">
                                            <ul class="nav nav-tabs" role="tablist">
                                                <li class="nav-item"><button class="nav-link active"
                                                        data-bs-toggle="tab" data-bs-target="#description">Mô tả chi
                                                        tiết</button></li>
                                                <li class="nav-item"><button class="nav-link" data-bs-toggle="tab"
                                                        data-bs-target="#reviews">Đánh giá (sắp có)</button></li>
                                            </ul>
                                        </div>
                                        <div class="tab-content">
                                            <div class="tab-pane fade show active" id="description">
                                                <p style="white-space: pre-line; line-height:2;">${product.detailDesc}
                                                </p>
                                            </div>
                                            <div class="tab-pane fade" id="reviews">
                                                <p style="color:#aaa; font-style:italic;">Hệ thống đánh giá đang được
                                                    phát triển... Stay tuned!</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sản phẩm liên quan -->
                <div class="section categories related-games">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section-heading">
                                    <h6>Sản phẩm tương tự</h6>
                                    <h2>Có thể bạn thích</h2>
                                </div>
                            </div>


                            <c:forEach var="related" items="${relatedProducts}" varStatus="loop">
                                <c:if test="${loop.index < 5}">
                                    <div class="col-lg col-sm-6 col-xs-12">
                                        <div class="item">
                                            <h4>${related.category}</h4>
                                            <div class="thumb">
                                                <a href="/product/${related.id}">
                                                    <img src="/images/product/${related.image}" alt="${related.name}">
                                                </a>
                                            </div>
                                            <div class="down-content" style="padding-top:10px;">
                                                <h5 style="font-size:14px;">${related.name}</h5>
                                                <c:choose>
                                                    <c:when test="${related.price == 0}"><span class="price"
                                                            style="color:#28a745;">FREE</span></c:when>
                                                    <c:otherwise><span class="price">
                                                            <fmt:formatNumber value="${related.price}"
                                                                pattern="#,##0" />₫
                                                        </span></c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <jsp:include page="../layout/footer.jsp" />

                <!-- Scripts -->
                <script src="/client/vendor/jquery/jquery.min.js"></script>
                <script src="/client/vendor/bootstrap/js/bootstrap.min.js"></script>
                <script src="/client/js/isotope.min.js"></script>
                <script src="/client/js/owl-carousel.js"></script>
                <script src="/client/js/counter.js"></script>
                <script src="/client/js/custom.js"></script>
            </body>

            </html>