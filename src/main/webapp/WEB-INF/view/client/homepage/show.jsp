<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="GamingHouse" />
                <meta name="author" content="Kin" />
                <title>Show - GamingHouse</title>
                <!-- Bootstrap core CSS -->
                <link href="/client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


                <!-- Additional CSS Files -->
                <link rel="stylesheet" href="/client/css/fontawesome.css">
                <link rel="stylesheet" href="/client/css/templatemo-lugx-gaming.css">
                <link rel="stylesheet" href="/client/css/owl.css">
                <link rel="stylesheet" href="/client/css/animate.css">
                <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
                <!--
            </head>

            <body>

                <!-- ***** Preloader Start ***** -->
                <div id="js-preloader" class="js-preloader">
                    <div class="preloader-inner">
                        <span class="dot"></span>
                        <div class="dots">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                    </div>
                </div>
                <!-- ***** Preloader End ***** -->

                <!-- ***** Header Area Start ***** -->
                <jsp:include page="../layout/header.jsp" />
                <!-- ***** Header Area End ***** -->

                <jsp:include page="../layout/banner.jsp" />

                <jsp:include page="../layout/feature.jsp" />

                <div class="section trending">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="section-heading">
                                    <h6>Trending</h6>
                                    <h2>Trending Games</h2>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="main-button">
                                    <a href="shop.html">View All</a>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="/client/images/trending-01.jpg"
                                                alt=""></a>
                                        <span class="price"><em>$28</em>$20</span>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Action</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html"><i class="fa fa-shopping-bag"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="/client/images/trending-02.jpg"
                                                alt=""></a>
                                        <span class="price">$44</span>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Action</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html"><i class="fa fa-shopping-bag"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="/client/images/trending-03.jpg"
                                                alt=""></a>
                                        <span class="price"><em>$64</em>$44</span>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Action</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html"><i class="fa fa-shopping-bag"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="/client/images/trending-04.jpg"
                                                alt=""></a>
                                        <span class="price">$32</span>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Action</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html"><i class="fa fa-shopping-bag"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="section most-played">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="section-heading">
                                    <h6>TOP GAMES</h6>
                                    <h2>Most Played</h2>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="main-button">
                                    <a href="shop.html">View All</a>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="/client/images/top-game-01.jpg"
                                                alt=""></a>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Adventure</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html">Explore</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="/client/images/top-game-02.jpg"
                                                alt=""></a>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Adventure</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html">Explore</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="/client/images/top-game-03.jpg"
                                                alt=""></a>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Adventure</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html">Explore</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="/client/images/top-game-04.jpg"
                                                alt=""></a>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Adventure</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html">Explore</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="/client/images/top-game-05.jpg"
                                                alt=""></a>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Adventure</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html">Explore</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="/client/images/top-game-06.jpg"
                                                alt=""></a>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Adventure</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html">Explore</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="section categories">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <div class="section-heading">
                                    <h6>Categories</h6>
                                    <h2>Top Categories</h2>
                                </div>
                            </div>
                            <div class="col-lg col-sm-6 col-xs-12">
                                <div class="item">
                                    <h4>Action</h4>
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="/client/images/categories-01.jpg"
                                                alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg col-sm-6 col-xs-12">
                                <div class="item">
                                    <h4>Action</h4>
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="/client/images/categories-05.jpg"
                                                alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg col-sm-6 col-xs-12">
                                <div class="item">
                                    <h4>Action</h4>
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="/client/images/categories-03.jpg"
                                                alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg col-sm-6 col-xs-12">
                                <div class="item">
                                    <h4>Action</h4>
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="/client/images/categories-04.jpg"
                                                alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg col-sm-6 col-xs-12">
                                <div class="item">
                                    <h4>Action</h4>
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="/client/images/categories-05.jpg"
                                                alt=""></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="section cta">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="shop">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="section-heading">
                                                <h6>Our Shop</h6>
                                                <h2>Go Pre-Order Buy & Get Best <em>Prices</em> For You!</h2>
                                            </div>
                                            <p>Lorem ipsum dolor consectetur adipiscing, sed do eiusmod tempor
                                                incididunt.</p>
                                            <div class="main-button">
                                                <a href="shop.html">Shop Now</a>
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
                                                <h2>Get Up To $100 Off Just Buy <em>Subscribe</em> Newsletter!</h2>
                                            </div>
                                            <div class="search-input">
                                                <form id="subscribe" action="#">
                                                    <input type="email" class="form-control" id="exampleInputEmail1"
                                                        aria-describedby="emailHelp" placeholder="Your email...">
                                                    <button type="submit">Subscribe Now</button>
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
                <!-- Bootstrap core JavaScript -->
                <script src="/client/vendor/jquery/jquery.min.js"></script>
                <script src="/client/vendor/bootstrap/js/bootstrap.min.js"></script>
                <script src="/client/js/isotope.min.js"></script>
                <script src="/client/js/owl-carousel.js"></script>
                <script src="/client/js/counter.js"></script>
                <script src="/client/js/custom.js"></script>

                </body>

            </html>