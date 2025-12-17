<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="GamingHouse" />
                    <meta name="author" content="Kin" />
                    <title>Product - GamingHouse</title>
                    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
                        rel="stylesheet" />
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Orders</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="/admin/order">Order</a></li>
                                        <li class="breadcrumb-item active">Update</li>
                                    </ol>
                                    <div class="row justify-content-center">
                                        <div class="col-lg-8 col-md-10">
                                            <div class="card shadow mb-4">
                                                <div class="card-header bg-warning text-white">
                                                    <h5 class="mb-0">Update a order</h5>
                                                </div>
                                                <div class="card-body">
                                                    <form:form method="post" action="/admin/order/update"
                                                        modelAttribute="newOrder" enctype="multipart/form-data">
                                                        <form:input type="hidden" path="id" />
                                                        <div class="row g-3">
                                                            <div class="col-12 mb-3">
                                                                <label class="form-label fw-bold">Order ID:</label>
                                                                <span>${newOrder.id}</span>
                                                                <br />
                                                                <label class="form-label fw-bold">Price:</label>
                                                                <span>
                                                                    <fmt:formatNumber value="${newOrder.totalPrice}"
                                                                        type="number" /> VND
                                                                </span>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label">User</label>
                                                                <input type="text" class="form-control"
                                                                    value="${newOrder.user.fullName}" readonly />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label">Status</label>
                                                                <form:select class="form-select" path="status">
                                                                    <form:option value="PENDING">PENDING</form:option>
                                                                    <form:option value="PROCESSING">PROCESSING
                                                                    </form:option>
                                                                    <form:option value="COMPLETE">COMPLETE</form:option>
                                                                    <form:option value="CANCELLED">CANCELLED
                                                                    </form:option>
                                                                </form:select>
                                                            </div>

                                                            <div class="col-12 mb-5">
                                                                <button type="submit"
                                                                    class="btn btn-warning">Submit</button>
                                                            </div>
                                                    </form:form>
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