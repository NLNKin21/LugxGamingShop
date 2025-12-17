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

                <div class="container my-5">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header bg-light">
                                    <h4 class="my-2">Chi tiết đơn hàng #${order.id}</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <h5>Thông tin người nhận:</h5>
                                            <p><strong>Họ và tên:</strong> ${order.user.fullName}</p>
                                            <p><strong>Địa chỉ:</strong> ${order.user.address}</p>
                                            <p><strong>Số điện thoại:</strong> ${order.user.phone}</p>
                                        </div>
                                        <div class="col-md-6 text-md-end">
                                            <h5>Thông tin đơn hàng:</h5>
                                            <p><strong>Ngày đặt:</strong> ${formattedDate}
                                            </p>
                                            <p><strong>Trạng thái:</strong> <span class="badge bg-success">Hoàn
                                                    thành</span>
                                            </p>
                                        </div>
                                    </div>

                                    <h5>Sản phẩm đã đặt:</h5>
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-striped">
                                            <thead class="table-dark">
                                                <tr>
                                                    <th scope="col" colspan="2">Sản phẩm</th>
                                                    <th scope="col" class="text-center">Số lượng</th>
                                                    <th scope="col" class="text-end">Đơn giá</th>
                                                    <th scope="col" class="text-end">Thành tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="detail" items="${order.orderDetails}">
                                                    <tr>
                                                        <td style="width: 80px;"><img
                                                                src="/images/product/${detail.product.image}"
                                                                class="img-fluid" alt="${detail.product.name}"></td>
                                                        <td>${detail.product.name}</td>
                                                        <td class="text-center">${detail.quantity}</td>
                                                        <td class="text-end">
                                                            <fmt:formatNumber type="number" maxFractionDigits="0"
                                                                value="${detail.price / detail.quantity}" /> đ
                                                        </td>
                                                        <td class="text-end">
                                                            <fmt:formatNumber type="number" maxFractionDigits="0"
                                                                value="${detail.price}" /> đ
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="4" class="text-end"><strong>Tổng cộng:</strong></td>
                                                    <td class="text-end"><strong>
                                                            <fmt:formatNumber type="number" maxFractionDigits="0"
                                                                value="${order.totalPrice}" /> đ
                                                        </strong></td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="text-center mt-4">
                                        <a href="/order-history" class="btn btn-primary">Quay lại lịch sử mua hàng</a>
                                    </div>
                                </div>
                            </div>
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