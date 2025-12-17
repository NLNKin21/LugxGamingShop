<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <style>
            .profile-menu {
                position: relative;
            }

            .profile-menu .dropdown-menu {
                display: none;
                position: absolute;
                top: 100%;
                right: 0;
                background-color: #fff;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1050;
                border-radius: .25rem;
                border: 1px solid rgba(0, 0, 0, .15);
                list-style: none;
                padding: 5px 0;
            }

            .profile-menu:hover .dropdown-menu {
                display: block;
            }

            .profile-menu .dropdown-menu li a {
                display: block;
                width: 100%;
                padding: .5rem 1.5rem;
                clear: both;
                font-weight: 400;
                color: #212529 !important;
                text-align: left;
                white-space: nowrap;
                background-color: transparent;
                border: 0;
            }

            .profile-menu .dropdown-menu li a i,
            .profile-menu .dropdown-menu li button i {
                margin-right: 10px;
            }

            .profile-menu .dropdown-menu li a:hover {
                background-color: #2288ee;
            }

            .profile-avatar {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                object-fit: cover;
                margin-left: 10px;
                vertical-align: middle;
            }

            .cart-badge {
                background-color: #ee626b;
                color: white;
                padding: 2px 6px;
                border-radius: 50%;
                font-size: 12px;
                vertical-align: top;
            }
        </style>

        <header class="header-area header-sticky">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <a href="/" class="logo">
                                <img src="/client/images/logo.png" alt="" style="width: 158px;">
                            </a>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li><a href="/" class="active">Home</a></li>
                                <li><a href="/products">Products</a></li>
                                <li><a href="/cart">Cart<c:if test="${sessionScope.sum > 0}"><span
                                                class="cart-badge">${sessionScope.sum}</span></c:if></a></li>
                                <li><a href="/contact">Contact</a></li>

                                <c:choose>
                                    <c:when test="${not empty sessionScope.id}">
                                        <li class="profile-menu">
                                            <a href="javascript:void(0)">${sessionScope.fullName}
                                                <img src="/images/avatar/${sessionScope.avatar}" alt="Avatar"
                                                    class="profile-avatar"
                                                    onerror="this.onerror=null; this.src='/images/avatar/default-avatar.png';">
                                            </a>
                                            <ul class="dropdown-menu">
                                                <c:if test="${sessionScope.fullName == 'ADMIN'}">
                                                    <li><a href="/admin"><i
                                                                class="fas fa-tachometer-alt fa-fw"></i>Admin
                                                            Page</a></li>
                                                </c:if>
                                                <li><a href="/order-history"><i class="fas fa-history fa-fw"></i>Order
                                                        History</a></li>
                                                <li>
                                                    <form action="/logout" method="post" style="margin: 0;">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                        <button type="submit" class="dropdown-item"><i
                                                                class="fas fa-sign-out-alt fa-fw"></i>Logout</button>
                                                    </form>
                                                </li>
                                            </ul>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="/login">Sign In</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>