<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>Lịch sử mua hàng - GamingHouse</title>

                <!-- Bootstrap & Font Awesome -->
                <link href="/client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
                <link rel="stylesheet" href="/client/css/fontawesome.css" />
                <link rel="stylesheet" href="/client/css/templatemo-lugx-gaming.css" />
                <link rel="stylesheet" href="/client/css/owl.css" />
                <link rel="stylesheet" href="/client/css/animate.css" />
                <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
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
                        <h3 class="mb-2">Lịch sử mua hàng</h3>
                        <span class="breadcrumb"><a href="/">Trang chủ</a> &gt; Lịch sử mua hàng</span>
                    </div>
                </div>

                <!-- Order History Content -->
                <div class="container py-5">
                    <c:choose>
                        <c:when test="${empty orders}">
                            <div class="text-center p-5 border rounded">
                                <h4 class="mb-3">Bạn chưa có đơn hàng nào.</h4>
                                <p class="text-muted mb-4">Hãy khám phá các sản phẩm tuyệt vời của chúng tôi!</p>
                                <a href="/products" class="btn btn-primary">Bắt đầu mua sắm</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table class="table table-hover align-middle text-center">
                                    <thead class="table-light">
                                        <tr>
                                            <th scope="col">Mã Đơn Hàng</th>
                                            <th scope="col">Ngày Đặt</th>
                                            <th scope="col">Tổng Tiền</th>
                                            <th scope="col">Trạng Thái</th>
                                            <th scope="col">Hành Động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="order" items="${orders}">
                                            <tr>
                                                <td>#${order.id}</td>
                                                <td>${order.formattedDate}</td>
                                                <td>
                                                    <fmt:formatNumber value="${order.totalPrice}" pattern="#,##0" />đ
                                                </td>
                                                <td><span class="badge bg-info text-dark">${order.status}</span>
                                                </td>
                                                <td><a href="/order-history/${order.id}"
                                                        class="btn btn-sm btn-outline-primary">Xem chi tiết</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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