<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="LaptopAZ" />
                <meta name="author" content="Kin" />
                <title>Update - LaptopAZ</title>
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
                                <h1 class="mt-4">Update Product</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/product">Product</a></li>
                                    <li class="breadcrumb-item active">Update</li>
                                </ol>
                                <div class="row justify-content-center">
                                    <div class="col-lg-8 col-md-10">
                                        <div class="card shadow mb-4">
                                            <div class="card-header bg-warning text-white">
                                                <h5 class="mb-0">Update Product Information</h5>
                                            </div>
                                            <div class="card-body">
                                                <form:form method="post" action="/admin/product/update"
                                                    modelAttribute="newPro" enctype="multipart/form-data">
                                                    <form:input type="hidden" path="id" />
                                                    <div class="row g-3">
                                                        <div class="col-md-6">
                                                            <label class="form-label">Name</label>
                                                            <form:input type="text" class="form-control" path="name" />
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="form-label">Price</label>
                                                            <form:input type="text" class="form-control" path="price" />
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label class="form-label">Detail Description</label>
                                                            <form:textarea class="form-control" path="detailDesc"
                                                                rows="3" />
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label class="form-label">Short Description</label>
                                                            <form:input type="text" class="form-control"
                                                                path="shortDesc" />
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label class="form-label">discount (%)</label>
                                                            <form:input type="number" class="form-control"
                                                                path="discount" />
                                                        </div>

                                                        <div class="col-md-6">
                                                            <label class="form-label">Category</label>
                                                            <form:select class="form-select" path="category">
                                                                <form:option value="BattleRoyale">BattleRoyale
                                                                </form:option>
                                                                <form:option value="MOBA">MOBA</form:option>
                                                                <form:option value="Sports">Sports</form:option>
                                                                <form:option value="FPS">FPS</form:option>
                                                                <form:option value="RPG">RPG</form:option>
                                                                <form:option value="Adventure">Adventure</form:option>
                                                                <form:option value="Account">Account</form:option>
                                                            </form:select>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <label for="avatarFile" class="form-label">Image</label>
                                                            <input class="form-control" type="file" id="avatarFile"
                                                                accept=".png, .jpg, .jpeg" name="nameFile">
                                                        </div>
                                                        <div class="col-md-6 d-flex align-items-center">
                                                            <img style="max-height: 120px; display: none;"
                                                                alt="avatar preview" id="avatarPreview">
                                                            <c:if test="${not empty newPro.image}">
                                                                <img src="/images/product/${newPro.image}"
                                                                    style="max-height: 120px;" alt="Current Image" />
                                                            </c:if>
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