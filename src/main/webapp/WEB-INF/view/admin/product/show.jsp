<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="LaptopAZ" />
                <meta name="author" content="Kin" />
                <title>Product - LaptopAZ</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class=" mt-4">Manage Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">products</li>
                                </ol>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>Table products</h3>
                                                <a href="/admin/product/create" class="btn btn-primary">Create a
                                                    products</a>
                                            </div>
                                            <hr />

                                            <table class="table table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Price</th>
                                                        <th scope="col">CATEGORY</th>
                                                        <th scope="col">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${not empty pro}">
                                                        <c:forEach var="product" items="${pro}">
                                                            <tr>
                                                                <td>${product.id}</td>
                                                                <td>${product.name}</td>
                                                                <td>${product.price}</td>
                                                                <td>${product.category}</td>
                                                                <td>
                                                                    <a href="/admin/product/${product.id}"
                                                                        class="btn btn-primary">View</a>
                                                                    <a href="/admin/product/update/${product.id}"
                                                                        class="btn btn-warning mx-2">Update</a>
                                                                    <a href="/admin/product/delete/${product.id}"
                                                                        class="btn btn-danger">Delete</a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${empty pro}">
                                                        <tr>
                                                            <td colspan="5" class="text-center text-muted py-4">Không có
                                                                sản phẩm nào!</td>
                                                        </tr>
                                                    </c:if>
                                                </tbody>
                                            </table>

                                            <c:if test="${totalPages > 1}">
                                                <nav aria-label="Page navigation example">
                                                    <ul class="pagination justify-content-center">

                                                        <!-- Prev -->
                                                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                            <a class="page-link"
                                                                href="/admin/product?page=${currentPage - 1}"
                                                                aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>

                                                        <!-- Page numbers -->
                                                        <c:forEach begin="1" end="${totalPages}" var="i">
                                                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                                <a class="page-link" href="/admin/product?page=${i}">
                                                                    ${i}
                                                                </a>
                                                            </li>
                                                        </c:forEach>

                                                        <!-- Next -->
                                                        <li
                                                            class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                                            <a class="page-link"
                                                                href="/admin/product?page=${currentPage + 1}"
                                                                aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                        </li>

                                                    </ul>
                                                </nav>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/chart-area-demo.js"></script>
                <script src="js/chart-bar-demo.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/datatables-simple-demo.js"></script>
            </body>

            </html>