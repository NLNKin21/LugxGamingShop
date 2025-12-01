<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="LaptopAZ" />
                <meta name="author" content="Kin" />
                <title>Show - GamingHouse</title>

                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />

                <!-- Your custom styles -->
                <link href="<c:url value='/css/styles.css'/>" rel="stylesheet" />

                <!-- Font Awesome -->
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">

                <jsp:include page="../layout/header.jsp" />

                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />

                    <!-- Nội dung chính -->
                    <div class="flex-grow-1 p-4" style="overflow-y: auto;">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Update a User</h1>
                                <form action="/admin/user/update" method="post" class="mt-4">
                                    <div class="mb-3" style="display: none;">
                                        <label for="id" class="form-label">ID</label>
                                        <input type="text" path="id" name="id" class="form-control" value="${id}"
                                            readonly />
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" path="email" name="email" class="form-control"
                                            value="${user.email}" disabled="true" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="phoneNumber" class="form-label">Phone Number</label>
                                        <input type="text" path="phone" name="phoneNumber" class="form-control"
                                            value="${user.phone}" required />
                                    </div>
                                    <div class="mb-3">
                                        <label for="fullName" class="form-label">Full Name</label>
                                        <input type="text" path="fullName" name="fullName" class="form-control"
                                            value="${user.fullName}" required />
                                    </div>
                                    <div class="mb-3">
                                        <label for="address" class="form-label">Address</label>
                                        <textarea path="address" name="address" class="form-control" rows="3"
                                            required>${user.address}</textarea>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Cập Nhật</button>
                                    <a href="/admin/user" class="btn btn-secondary ms-2">Hủy bỏ</a>
                                </form>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>

                <!-- Scripts -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                <script src="<c:url value='/js/scripts.js'/>"></script>
            </body>

            </html>