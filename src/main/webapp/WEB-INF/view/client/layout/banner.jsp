<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <div class="main-banner">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 align-self-center">
                            <div class="caption header-text">
                                <h6>Welcome to Gaming House</h6>
                                <h2>THE ULTIMATE GAME</h2>
                                <p>
                                    Gaming house là nền tảng mua bán game trực tuyến uy tín, cung cấp đa dạng các tựa
                                    game bản
                                    quyền
                                    với mức giá cạnh tranh. Chúng tôi mang đến trải nghiệm mua sắm nhanh chóng, an toàn
                                    cùng
                                    nhiều
                                    ưu đãi hấp dẫn dành cho cộng đồng game thủ.
                                </p>

                                <div class="search-input">
                                    <form id="search" action="#">
                                        <input type="text" placeholder="Type Something" id='searchText'
                                            name="searchKeyword" onkeypress="handle" />
                                        <button role="button">Search Now</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 offset-lg-2">
                            <div class="right-image">
                                <img src="/client/images/banner-image.jpg" alt="">
                                <span class="price">
                                    <fmt:formatNumber type="number" value="${orderDetail.price}" />200.000 đ
                                </span>
                                <span class="offer">-40%</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>