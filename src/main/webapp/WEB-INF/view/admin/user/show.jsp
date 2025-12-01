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
                                <h1 class="mt-4">Manage Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Users</li>
                                </ol>

                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <h3>Table User</h3>
                                                <a href="/admin/user/create" class="btn btn-primary">Create a user</a>
                                            </div>

                                            <table class="table table-striped table-bordered table-hover text-center">
                                                <thead class="table-dark">
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Email</th>
                                                        <th>Full Name</th>
                                                        <th>Role</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="user" items="${users1}">
                                                        <tr>
                                                            <td>${user.id}</td>
                                                            <td>${user.email}</td>
                                                            <td>${user.fullName}</td>
                                                            <td>Chưa kiểm tra role</td>
                                                            <td>
                                                                <a href="/admin/user/${user.id}"
                                                                    class="btn btn-info btn-sm">View</a>
                                                                <a href="/admin/user/update/${user.id}"
                                                                    class="btn btn-warning btn-sm mx-1">Update</a>
                                                                <a href="/admin/user/delete/${user.id}"
                                                                    class="btn btn-danger btn-sm">Delete</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                            <!-- Pagination -->
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination justify-content-center">
                                                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                        <a class="page-link"
                                                            href="/admin/user?page=${currentPage - 1}">&laquo;</a>
                                                    </li>
                                                    <c:forEach begin="1" end="${totalPages}" var="i">
                                                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                            <a class="page-link" href="/admin/user?page=${i}">${i}</a>
                                                        </li>
                                                    </c:forEach>
                                                    <li
                                                        class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                                        <a class="page-link"
                                                            href="/admin/user?page=${currentPage + 1}">&raquo;</a>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
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