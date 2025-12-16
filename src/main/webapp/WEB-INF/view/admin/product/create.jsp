<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Create Product - Game Shop</title>

                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(function () {
                        $("#avatarFile").change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL).show();
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Game Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Create Product</li>
                                </ol>

                                <div class="container mt-4">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3 class="fw-bold">Add New Game Item</h3>
                                            <hr />

                                            <form:form method="post" action="/admin/product/create"
                                                modelAttribute="newProduct" class="row" enctype="multipart/form-data">

                                                <!-- Name -->
                                                <div class="mb-3 col-12">
                                                    <label class="form-label">Item Name *</label>
                                                    <form:input type="text" class="form-control" path="name"
                                                        placeholder="Ex: Sword of Legends" />
                                                    <form:errors path="name" cssClass="text-danger" />
                                                </div>

                                                <!-- Price -->
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Price *</label>
                                                    <form:input type="number" class="form-control" path="price"
                                                        placeholder="Ex: 500" />
                                                </div>

                                                <!-- Short Description -->
                                                <div class="mb-3 col-12">
                                                    <label class="form-label">Short Description *</label>
                                                    <form:input type="text" class="form-control" path="shortDesc"
                                                        placeholder="Quick stats or main effect" />
                                                    <form:errors path="shortDesc" cssClass="text-danger" />
                                                </div>

                                                <!-- Detail Description -->
                                                <div class="mb-3 col-12">
                                                    <label class="form-label">Detailed Description *</label>
                                                    <form:textarea class="form-control" rows="4" path="detailDesc"
                                                        placeholder="Explain item effects and lore" />
                                                    <form:errors path="detailDesc" cssClass="text-danger" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Phần trăm giảm giá (%)</label>
                                                    <form:input type="number" class="form-control" path="discount"
                                                        min="0" max="100" />
                                                </div>

                                                <!-- Category -->
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Category *</label>
                                                    <form:select class="form-select" path="category">
                                                        <form:option value="BattleRoyale">BattleRoyale</form:option>
                                                        <form:option value="MOBA">MOBA</form:option>
                                                        <form:option value="Sports">Sports</form:option>
                                                        <form:option value="FPS">FPS</form:option>
                                                        <form:option value="RPG">RPG</form:option>
                                                        <form:option value="Adventure">Adventure</form:option>
                                                        <form:option value="Account">Account</form:option>
                                                    </form:select>
                                                </div>

                                                <!-- Image upload -->
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Item Image *</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="nameFile">
                                                </div>

                                                <!-- Preview -->
                                                <div class="col-12 mb-3 text-center">
                                                    <img id="avatarPreview" style="max-height: 200px; display: none;" />
                                                </div>

                                                <div class="col-12">
                                                    <button type="submit" class="btn btn-success w-100">Create
                                                        Item</button>
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

                <script src="/js/scripts.js"></script>
            </body>

            </html>