<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Delete User - GamingHouse</title>

                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />

                <!-- Your custom styles -->
                <link href="<c:url value='/css/styles.css'/>" rel="stylesheet" />
            </head>

            <body class="sb-nav-fixed">

                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />

                    <!-- Nội dung chính -->
                    <div class="flex-grow-1 p-4" style="overflow-y: auto;">
                        <main>
                            <div class="container-fluid px-4">
                                <h3 class="mb-4 fw-bold text-danger">Xác nhận xóa người dùng</h3>

                                <!-- Thông báo hoặc dữ liệu người dùng cần xóa -->
                                <div class="card border-danger mb-4 shadow">
                                    <div class="card-body text-center">
                                        <h4 class="card-title text-danger">Bạn có chắc chắn muốn xóa người dùng này?
                                        </h4>
                                        <!-- Hiển thị thông tin người dùng cần xóa -->
                                        <p class="card-text">
                                            <strong>Email:</strong> ${user.email}<br>
                                            <strong>Họ và tên:</strong> ${user.fullName}
                                        </p>
                                    </div>
                                </div>

                                <!-- Form xác nhận xóa -->
                                <form:form action="/admin/user/delete" method="post"
                                    onsubmit="return confirm('Bạn có chắc chắn muốn xóa?')">
                                    <input type="hidden" name="id" value="${user.id}" />
                                    <button type="submit" class="btn btn-danger">Xóa</button>
                                    <a href="/admin/user" class="btn btn-secondary">Hủy</a>
                                </form:form>
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