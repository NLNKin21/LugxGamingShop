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
                <title>Create - GamingHouse</title>

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
                                <h3 class="mb-4 fw-bold">Create New User</h3>

                                <!-- Success Message -->
                                <c:if test="${not empty success}">
                                    <div class="alert alert-success">${success}</div>
                                </c:if>

                                <!-- Error Message -->
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger">${error}</div>
                                </c:if>

                                <div class="card mb-4 shadow border-0">
                                    <div class="card-body">
                                        <form:form action="/admin/user/create" method="post" modelAttribute="newUser">
                                            <div class="mb-3">
                                                <label class="form-label">Email</label>
                                                <form:input type="email" path="email" class="form-control"
                                                    placeholder="Enter email" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Password</label>
                                                <form:password path="password" class="form-control"
                                                    placeholder="Enter password" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Full Name</label>
                                                <form:input type="text" path="fullName" class="form-control"
                                                    placeholder="Enter full name" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Address</label>
                                                <form:input type="text" path="address" class="form-control"
                                                    placeholder="Enter address" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Phone</label>
                                                <form:input type="text" path="phone" class="form-control"
                                                    placeholder="Enter phone number" />
                                            </div>
                                            <div class="d-flex justify-content-between mt-4">
                                                <button type="submit" class="btn btn-primary">Create User</button>
                                                <a href="/admin/user" class="btn btn-secondary">Back to List</a>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>

                            </div>
                        </main>
                    </div>
                    <jsp:include page="../layout/footer.jsp" />
                </div>

                <!-- Scripts -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                <script src="<c:url value='/js/scripts.js'/>"></script>
            </body>

            </html>