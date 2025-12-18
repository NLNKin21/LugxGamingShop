<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>GamingHouse - Shop Game & Account Uy Tín #1 Việt Nam</title>

                <link href="/client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="/client/css/fontawesome.css">
                <link rel="stylesheet" href="/client/css/templatemo-lugx-gaming.css">
                <link rel="stylesheet" href="/client/css/owl.css">
                <link rel="stylesheet" href="/client/css/animate.css">
                <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
            </head>

            <body>

                <!-- Preloader -->
                <div id="js-preloader" class="js-preloader">
                    <div class="preloader-inner">
                        <span class="dot"></span>
                        <div class="dots">
                            <span></span><span></span><span></span>
                        </div>
                    </div>
                </div>

                <!-- Header -->
                <jsp:include page="../layout/header.jsp" />

                <!-- Banner -->
                <jsp:include page="../layout/banner.jsp" />

                <!-- Trending Games -->
                <div class="section trending">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="section-heading">
                                    <h6>Hot Nhất Tháng</h6>
                                    <h2>Trending Games & Acc</h2>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="main-button">
                                    <a href="/products">Xem Tất Cả</a>
                                </div>
                            </div>

                            <c:forEach var="p" items="${trendingProducts}" varStatus="loop">
                                <c:if test="${loop.index < 4}">
                                    <div class="col-lg-3 col-md-6">
                                        <div class="item">
                                            <div class="thumb">
                                                <a href="/product/${p.id}"><img src="/images/product/${p.image}"
                                                        alt="${p.name}"
                                                        style="width:100%; height:220px; object-fit:cover;"></a>
                                                <c:choose>
                                                    <c:when test="${p.price == 0}">
                                                        <span class="price">FREE</span>
                                                    </c:when>
                                                    <c:when test="${p.discount > 0}">
                                                        <span class="price">
                                                            <em><del>
                                                                    <fmt:formatNumber value="${p.price}"
                                                                        pattern="#,##0" />₫
                                                                </del></em>
                                                            <fmt:formatNumber
                                                                value="${p.price * (1 - p.discount / 100.0)}"
                                                                pattern="#,##0" />₫
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="price">
                                                            <fmt:formatNumber value="${p.price}" pattern="#,##0" />₫
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="down-content">
                                                <span class="category">${p.category}</span>
                                                <h4>${p.name}</h4>
                                            </div>
                                            <div class="add-to-cart-container"
                                                style="padding: 0 20px 20px; text-align: right;">
                                                <form action="/add-product-to-cart" method="post"
                                                    style="display: inline-block;">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <input type="hidden" name="productId" value="${p.id}" />
                                                    <a href="javascript:;"
                                                        onclick="this.closest('form').submit(); return false;">Thêm vào
                                                        giỏ <i class="fa fa-shopping-cart"></i></a>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <!-- Most Played (Top Games) -->
                <div class="section most-played">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="section-heading">
                                    <h6>TOP GAMES</h6>
                                    <h2>Được Chơi Nhiều Nhất</h2>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="main-button">
                                    <a href="/products">Xem Tất Cả</a>
                                </div>
                            </div>

                            <c:forEach var="p" items="${mostPlayedProducts}" varStatus="loop">
                                <c:if test="${loop.index < 6}">
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <div class="item">
                                            <div class="thumb">
                                                <a href="/product/${p.id}"><img src="/images/product/${p.image}"
                                                        alt="${p.name}" style="height:140px; object-fit:cover;"></a>
                                            </div>
                                            <div class="down-content">
                                                <span class="category">${p.category}</span>
                                                <h4>${p.name}</h4>
                                                <a href="/product/${p.id}">Xem chi tiết</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <!-- Categories -->
                <div class="section categories">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <div class="section-heading">
                                    <h6>Danh Mục</h6>
                                    <h2>Top Categories</h2>
                                </div>
                            </div>

                            <div class="col-lg col-sm-6 col-xs-12">
                                <div class="item">
                                    <h4>Battle Royale</h4>
                                    <div class="thumb">
                                        <a href="/products?name=&category=BattleRoyale&maxPrice=0&sort="><img
                                                src="/client/images/c1.jpg" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg col-sm-6 col-xs-12">
                                <div class="item">
                                    <h4>MOBA</h4>
                                    <div class="thumb">
                                        <a href="/products?name=&category=MOBA&maxPrice=0&sort="><img src="/client/images/c2.jpg"
                                                alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg col-sm-6 col-xs-12">
                                <div class="item">
                                    <h4>FPS</h4>
                                    <div class="thumb">
                                        <a href=/products?name=&category=FPS&maxPrice=0&sort=><img src="/client/images/c3.jpg"
                                                alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg col-sm-6 col-xs-12">
                                <div class="item">
                                    <h4>Sports</h4>
                                    <div class="thumb">
                                        <a href="/products?name=&category=Sports&maxPrice=0&sort="><img src="/client/images/c4.jpg"
                                                alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg col-sm-6 col-xs-12">
                                <div class="item">
                                    <h4>Adventure</h4>
                                    <div class="thumb">
                                        <a href="/products?name=&category=Adventure&maxPrice=0&sort="><img src="/client/images/c5.jpg"
                                                alt=""></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- CTA -->
                <div class="section cta">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="shop">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="section-heading">
                                                <h6>Our Shop</h6>
                                                <h2>Pre-Order Ngay Hôm Nay <em>Giá Rẻ Nhất</em> Việt Nam!</h2>
                                            </div>
                                            <p>Acc Valorant Radiant, Steam khủng, FC Online VIP... có hết!</p>
                                            <div class="main-button">
                                                <a href="/shop">Mua Ngay</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5 offset-lg-2 align-self-end">
                                <div class="subscribe">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="section-heading">
                                                <h6>NEWSLETTER</h6>
                                                <h2>Giảm Thêm 100k Khi <em>Subscribe</em> Ngay!</h2>
                                            </div>
                                            <div class="search-input">
                                                <form id="subscribe" action="#">
                                                    <input type="email" placeholder="Email của bạn...">
                                                    <button type="submit">Nhận ưu đãi</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

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