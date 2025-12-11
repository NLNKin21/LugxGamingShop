<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>Liên hệ - GamingHouse</title>

                <link href="/client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="/client/css/fontawesome.css">
                <link rel="stylesheet" href="/client/css/templatemo-lugx-gaming.css">
                <link rel="stylesheet" href="/client/css/owl.css">
                <link rel="stylesheet" href="/client/css/animate.css">
            </head>

            <body>

                <!-- Preloader -->
                <div id="js-preloader" class="js-preloader">
                    <div class="preloader-inner">
                        <span class="dot"></span>
                        <div class="dots"><span></span><span></span><span></span></div>
                    </div>
                </div>

                <!-- HEADER -->
                <jsp:include page="../layout/header.jsp" />

                <!-- PAGE TITLE -->
                <div class="page-heading header-text">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <h3>Liên hệ chúng tôi</h3>
                                <span class="breadcrumb"><a href="/">Trang chủ</a> > Liên hệ</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- CONTACT PAGE -->
                <div class="contact-page section">
                    <div class="container">
                        <div class="row">
                            <!-- LEFT CONTENT -->
                            <div class="col-lg-6 align-self-center">
                                <div class="left-text">
                                    <div class="section-heading">
                                        <h6>Liên hệ</h6>
                                        <h2>Gửi lời nhắn cho chúng tôi!</h2>
                                    </div>
                                    <p>
                                        Đây là trang liên hệ của GamingHouse. Nếu bạn có thắc mắc hoặc cần hỗ trợ,
                                        hãy gửi tin nhắn cho chúng tôi. Chúng tôi sẽ phản hồi sớm nhất có thể.
                                    </p>
                                    <ul>
                                        <li><span>Địa chỉ</span> Hà Nội, Việt Nam</li>
                                        <li><span>Số điện thoại</span> +84 123 456 789</li>
                                        <li><span>Email</span> support@gaminghouse.com</li>
                                    </ul>
                                </div>
                            </div>

                            <!-- RIGHT CONTENT -->
                            <div class="col-lg-6">
                                <div class="right-content">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div id="map">
                                                <iframe
                                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.910067684873!2d105.78020407512712!3d21.035736487575024!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab26062ea091%3A0x6dab66f0c03b0880!2zTmFtIEPhu6UgTOG7o28!5e0!3m2!1svi!2s!4v1700000000000"
                                                    width="100%" height="325" frameborder="0"
                                                    style="border:0; border-radius: 20px;" allowfullscreen="">
                                                </iframe>
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <form id="contact-form" action="/contact/send" method="post">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <fieldset>
                                                            <input type="text" name="name" id="name"
                                                                placeholder="Tên của bạn..." required>
                                                        </fieldset>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <fieldset>
                                                            <input type="text" name="surname" id="surname"
                                                                placeholder="Họ của bạn..." required>
                                                        </fieldset>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <fieldset>
                                                            <input type="email" name="email" id="email"
                                                                placeholder="Email..." required>
                                                        </fieldset>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <fieldset>
                                                            <input type="text" name="subject" id="subject"
                                                                placeholder="Tiêu đề...">
                                                        </fieldset>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <fieldset>
                                                            <textarea name="message" id="message"
                                                                placeholder="Nội dung tin nhắn..." required></textarea>
                                                        </fieldset>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <fieldset>
                                                            <button type="submit" class="orange-button">Gửi tin
                                                                nhắn</button>
                                                        </fieldset>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- FOOTER -->
                <jsp:include page="../layout/footer.jsp" />

                <!-- SCRIPTS -->
                <script src="/client/vendor/jquery/jquery.min.js"></script>
                <script src="/client/vendor/bootstrap/js/bootstrap.min.js"></script>
                <script src="/client/js/isotope.min.js"></script>
                <script src="/client/js/owl-carousel.js"></script>
                <script src="/client/js/counter.js"></script>
                <script src="/client/js/custom.js"></script>
            </body>

            </html>