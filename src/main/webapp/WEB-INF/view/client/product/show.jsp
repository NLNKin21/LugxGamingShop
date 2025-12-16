<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>Sản phẩm - GamingHouse</title>

                <link href="/client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="/client/css/fontawesome.css">
                <link rel="stylesheet" href="/client/css/templatemo-lugx-gaming.css">
                <link rel="stylesheet" href="/client/css/owl.css">
                <link rel="stylesheet" href="/client/css/animate.css">

                <style>
                    .filter-section {
                        background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
                        padding: 30px;
                        border-radius: 15px;
                        margin-bottom: 30px;
                    }

                    .filter-title {
                        color: #fff;
                        font-size: 18px;
                        margin-bottom: 15px;
                        border-bottom: 2px solid #ee626b;
                        padding-bottom: 10px;
                    }

                    .form-check-label {
                        color: #ccc;
                    }

                    .form-check-input:checked {
                        background-color: #ee626b;
                        border-color: #ee626b;
                    }

                    .btn-filter {
                        background: linear-gradient(135deg, #ee626b 0%, #c94b52 100%);
                        border: none;
                        padding: 10px 30px;
                        border-radius: 25px;
                        color: #fff;
                        font-weight: 600;
                        transition: all 0.3s ease;
                    }

                    .btn-filter:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 5px 20px rgba(238, 98, 107, 0.4);
                        color: #fff;
                    }

                    .product-card {
                        background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
                        border-radius: 15px;
                        overflow: hidden;
                        transition: all 0.3s ease;
                        margin-bottom: 30px;
                    }

                    .product-card:hover {
                        transform: translateY(-10px);
                        box-shadow: 0 15px 40px rgba(238, 98, 107, 0.3);
                    }

                    .product-image {
                        position: relative;
                        overflow: hidden;
                    }

                    .product-image img {
                        width: 100%;
                        height: 200px;
                        object-fit: cover;
                        transition: transform 0.3s ease;
                    }

                    .product-card:hover .product-image img {
                        transform: scale(1.1);
                    }

                    .product-price {
                        position: absolute;
                        bottom: 10px;
                        right: 10px;
                        background: #ee626b;
                        color: #fff;
                        padding: 5px 15px;
                        border-radius: 20px;
                        font-weight: bold;
                    }

                    .discount-badge {
                        position: absolute;
                        top: 10px;
                        left: 10px;
                        background: #28a745;
                        /* Green color for discount */
                        color: #fff;
                        padding: 3px 10px;
                        border-radius: 5px;
                        font-size: 12px;
                        font-weight: bold;
                    }

                    .product-info {
                        padding: 20px;
                    }

                    .product-category {
                        color: #ee626b;
                        font-size: 12px;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                    }

                    .product-name {
                        color: #fff;
                        font-size: 16px;
                        margin: 10px 0;
                        display: -webkit-box;
                        -webkit-line-clamp: 2;
                        -webkit-box-orient: vertical;
                        overflow: hidden;
                    }

                    .product-name a {
                        color: #fff;
                        text-decoration: none;
                    }

                    .product-name a:hover {
                        color: #ee626b;
                    }

                    .btn-add-cart {
                        background: transparent;
                        border: 2px solid #ee626b;
                        color: #ee626b;
                        padding: 8px 20px;
                        border-radius: 25px;
                        transition: all 0.3s ease;
                    }

                    .btn-add-cart:hover {
                        background: #ee626b;
                        color: #fff;
                    }

                    .pagination-custom {
                        display: flex;
                        justify-content: center;
                        gap: 10px;
                        margin-top: 40px;
                    }

                    .pagination-custom a {
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        width: 40px;
                        height: 40px;
                        background: #1a1a2e;
                        color: #fff;
                        border-radius: 50%;
                        text-decoration: none;
                        transition: all 0.3s ease;
                    }

                    .pagination-custom a:hover,
                    .pagination-custom a.active {
                        background: #ee626b;
                        color: #fff;
                    }

                    .sort-select {
                        background: #1a1a2e;
                        border: 1px solid #333;
                        color: #fff;
                        padding: 10px 20px;
                        border-radius: 25px;
                    }

                    .no-products {
                        text-align: center;
                        padding: 50px;
                        color: #ccc;
                    }

                    .no-products i {
                        font-size: 60px;
                        color: #ee626b;
                        margin-bottom: 20px;
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
                <div class="page-heading header-text">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <h3>Cửa Hàng Game</h3>
                                <span class="breadcrumb">
                                    <a href="/">Trang chủ</a> > Sản phẩm
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Products Section -->
                <div class="section trending">
                    <div class="container">
                        <div class="row">
                            <!-- Sidebar Filter -->
                            <div class="col-lg-3">
                                <form action="/products" method="get" id="filterForm">
                                    <div class="filter-section">
                                        <!-- Search -->
                                        <h5 class="filter-title">
                                            <i class="fa fa-search"></i> Tìm kiếm
                                        </h5>
                                        <div class="mb-4">
                                            <input type="text" name="name" class="form-control"
                                                placeholder="Nhập tên sản phẩm..." value="${param.name}">
                                        </div>

                                        <!-- Category Filter -->
                                        <h5 class="filter-title">
                                            <i class="fa fa-gamepad"></i> Thể loại
                                        </h5>
                                        <div class="mb-4">
                                            <div class="form-check mb-2">
                                                <input class="form-check-input" type="checkbox" name="category"
                                                    value="BattleRoyale" id="catBR" <c:if
                                                    test="${param.category != null && param.category.contains('BattleRoyale')}">checked
                                                </c:if>>
                                                <label class="form-check-label" for="catBR">Battle Royale</label>
                                            </div>
                                            <div class="form-check mb-2">
                                                <input class="form-check-input" type="checkbox" name="category"
                                                    value="MOBA" id="catMOBA" <c:if
                                                    test="${param.category != null && param.category.contains('MOBA')}">checked
                                                </c:if>>
                                                <label class="form-check-label" for="catMOBA">MOBA</label>
                                            </div>
                                            <div class="form-check mb-2">
                                                <input class="form-check-input" type="checkbox" name="category"
                                                    value="FPS" id="catFPS" <c:if
                                                    test="${param.category != null && param.category.contains('FPS')}">checked
                                                </c:if>>
                                                <label class="form-check-label" for="catFPS">FPS</label>
                                            </div>
                                            <div class="form-check mb-2">
                                                <input class="form-check-input" type="checkbox" name="category"
                                                    value="RPG" id="catRPG" <c:if
                                                    test="${param.category != null && param.category.contains('RPG')}">checked
                                                </c:if>>
                                                <label class="form-check-label" for="catRPG">RPG</label>
                                            </div>
                                            <div class="form-check mb-2">
                                                <input class="form-check-input" type="checkbox" name="category"
                                                    value="Sports" id="catSports" <c:if
                                                    test="${param.category != null && param.category.contains('Sports')}">checked
                                                </c:if>>
                                                <label class="form-check-label" for="catSports">Sports</label>
                                            </div>
                                            <div class="form-check mb-2">
                                                <input class="form-check-input" type="checkbox" name="category"
                                                    value="Adventure" id="catAdv" <c:if
                                                    test="${param.category != null && param.category.contains('Adventure')}">checked
                                                </c:if>>
                                                <label class="form-check-label" for="catAdv">Adventure</label>
                                            </div>
                                            <div class="form-check mb-2">
                                                <input class="form-check-input" type="checkbox" name="category"
                                                    value="Account" id="catAcc" <c:if
                                                    test="${param.category != null && param.category.contains('Account')}">checked
                                                </c:if>>
                                                <label class="form-check-label" for="catAcc">Account</label>
                                            </div>
                                        </div>

                                        <!-- Price Filter -->
                                        <h5 class="filter-title">
                                            <i class="fa fa-dollar-sign"></i> Mức giá
                                        </h5>
                                        <div class="mb-4">
                                            <div class="form-check mb-2">
                                                <input class="form-check-input" type="radio" name="maxPrice" value="0"
                                                    id="priceAll" <c:if
                                                    test="${param.maxPrice == null || param.maxPrice == '0'}">checked
                                                </c:if>>
                                                <label class="form-check-label" for="priceAll">Tất cả</label>
                                            </div>
                                            <div class="form-check mb-2">
                                                <input class="form-check-input" type="radio" name="maxPrice"
                                                    value="100000" id="price1" <c:if
                                                    test="${param.maxPrice == '100000'}">checked</c:if>>
                                                <label class="form-check-label" for="price1">Dưới 100.000đ</label>
                                            </div>
                                            <div class="form-check mb-2">
                                                <input class="form-check-input" type="radio" name="maxPrice"
                                                    value="500000" id="price2" <c:if
                                                    test="${param.maxPrice == '500000'}">checked</c:if>>
                                                <label class="form-check-label" for="price2">Dưới 500.000đ</label>
                                            </div>
                                            <div class="form-check mb-2">
                                                <input class="form-check-input" type="radio" name="maxPrice"
                                                    value="1000000" id="price3" <c:if
                                                    test="${param.maxPrice == '1000000'}">checked</c:if>>
                                                <label class="form-check-label" for="price3">Dưới 1.000.000đ</label>
                                            </div>
                                            <div class="form-check mb-2">
                                                <input class="form-check-input" type="radio" name="maxPrice"
                                                    value="5000000" id="price4" <c:if
                                                    test="${param.maxPrice == '5000000'}">checked</c:if>>
                                                <label class="form-check-label" for="price4">Dưới 5.000.000đ</label>
                                            </div>
                                        </div>

                                        <!-- Sort -->
                                        <h5 class="filter-title">
                                            <i class="fa fa-sort"></i> Sắp xếp
                                        </h5>
                                        <div class="mb-4">
                                            <select name="sort" class="form-select sort-select">
                                                <option value="" <c:if test="${param.sort == null || param.sort == ''}">
                                                    selected</c:if>>Mặc định</option>
                                                <option value="asc" <c:if test="${param.sort == 'asc'}">selected</c:if>
                                                    >Giá thấp đến cao</option>
                                                <option value="desc" <c:if test="${param.sort == 'desc'}">selected
                                                    </c:if>>Giá cao đến thấp</option>
                                            </select>
                                        </div>

                                        <!-- Buttons -->
                                        <div class="d-grid gap-2">
                                            <button type="submit" class="btn btn-filter">
                                                <i class="fa fa-filter"></i> Lọc sản phẩm
                                            </button>
                                            <a href="/products" class="btn btn-outline-light btn-sm">
                                                <i class="fa fa-refresh"></i> Xóa bộ lọc
                                            </a>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <!-- Products Grid -->
                            <div class="col-lg-9">
                                <!-- Results Info -->
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <p class="text-white mb-0">
                                        <c:choose>
                                            <c:when test="${not empty pro}">
                                                Hiển thị <strong>${pro.size()}</strong> sản phẩm
                                            </c:when>
                                            <c:otherwise>
                                                Không tìm thấy sản phẩm
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>

                                <div class="row">
                                    <c:choose>
                                        <c:when test="${not empty pro}">
                                            <c:forEach var="product" items="${pro}">
                                                <div class="col-lg-4 col-md-6">
                                                    <div class="product-card">
                                                        <div class="product-image">
                                                            <a href="/product/${product.id}">
                                                                <img src="/images/product/${product.image}"
                                                                    alt="${product.name}"
                                                                    onerror="this.src='/images/default-product.jpg'">
                                                                <c:if test="${product.discount > 0}">
                                                                    <span
                                                                        class="discount-badge">-${product.discount}%</span>
                                                                </c:if>
                                                            </a>
                                                            <span class="product-price">
                                                                <c:choose>
                                                                    <c:when test="${product.discount > 0}">
                                                                        <em><del>
                                                                                <fmt:formatNumber
                                                                                    value="${product.price}"
                                                                                    pattern="#,##0" />đ
                                                                            </del></em><br>
                                                                        <fmt:formatNumber
                                                                            value="${product.price * (1 - product.discount / 100.0)}"
                                                                            pattern="#,##0" />đ
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <fmt:formatNumber value="${product.price}"
                                                                            pattern="#,##0" />đ
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </span>
                                                        </div>
                                                        <div class="product-info">
                                                            <span class="product-category">${product.category}</span>
                                                            <h4 class="product-name">
                                                                <a href="/product/${product.id}">${product.name}</a>
                                                            </h4>
                                                            <p class="small mb-3 text-white-50" title="Số lượt đã bán">
                                                                <i class="fa fa-star text-warning"></i> Đã bán:
                                                                ${product.sold}
                                                            </p>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center">
                                                                <a href="/product/${product.id}"
                                                                    class="btn btn-add-cart btn-sm">
                                                                    <i class="fa fa-eye"></i> Chi tiết
                                                                </a>
                                                                <form action="/add-product-to-cart" method="post"
                                                                    style="display: inline;">
                                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                                        value="${_csrf.token}" />
                                                                    <input type="hidden" name="productId"
                                                                        value="${product.id}" />
                                                                    <button type="submit"
                                                                        class="btn btn-add-cart btn-sm"
                                                                        title="Thêm vào giỏ hàng"><i
                                                                            class="fa fa-shopping-cart"></i></button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-12">
                                                <div class="no-products">
                                                    <i class="fa fa-search"></i>
                                                    <h4>Không tìm thấy sản phẩm</h4>
                                                    <p>Hãy thử thay đổi bộ lọc hoặc từ khóa tìm kiếm</p>
                                                    <a href="/products" class="btn btn-filter mt-3">
                                                        <i class="fa fa-refresh"></i> Xem tất cả sản phẩm
                                                    </a>
                                                </div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <!-- Pagination -->
                                <c:if test="${totalPages > 1}">
                                    <div class="pagination-custom">
                                        <!-- Previous -->
                                        <c:if test="${currentPage > 1}">
                                            <a
                                                href="/products?page=${currentPage - 1}&name=${param.name}&category=${param.category}&maxPrice=${param.maxPrice}&sort=${param.sort}">
                                                <i class="fa fa-chevron-left"></i>
                                            </a>
                                        </c:if>

                                        <!-- Page Numbers -->
                                        <c:forEach begin="1" end="${totalPages}" var="i">
                                            <c:choose>
                                                <c:when test="${i == currentPage}">
                                                    <a href="#" class="active">${i}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a
                                                        href="/products?page=${i}&name=${param.name}&category=${param.category}&maxPrice=${param.maxPrice}&sort=${param.sort}">${i}</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                        <!-- Next -->
                                        <c:if test="${currentPage < totalPages}">
                                            <a
                                                href="/products?page=${currentPage + 1}&name=${param.name}&category=${param.category}&maxPrice=${param.maxPrice}&sort=${param.sort}">
                                                <i class="fa fa-chevron-right"></i>
                                            </a>
                                        </c:if>
                                    </div>
                                </c:if>
                            </div>
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