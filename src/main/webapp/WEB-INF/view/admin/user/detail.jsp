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
                <title>User Detail ${id}</title>

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
                                <h1 class="mt-4">Manage Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Detail User with id ${id}</li>
                                </ol>

                                <h1 class="mt-4">Chi Tiết Người Dùng</h1>
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <h5>Thông tin User</h5>
                                    </div>
                                    <div class="card-body">
                                        <p><strong>ID:</strong> ${user.id}</p>
                                        <p><strong>Email:</strong> ${user.email}</p>
                                        <p><strong>Full Name:</strong> ${user.fullName}</p>
                                        <p><strong>Address:</strong> ${user.address}</p>
                                    </div>
                                </div>
                                <a href="/admin/user" class="btn btn-secondary">Quay lại danh sách</a>
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