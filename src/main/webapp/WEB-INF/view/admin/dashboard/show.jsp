<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="GamingHouse Dashboard" />
                <meta name="author" content="Kin" />
                <title>Dashboard - GamingHouse</title>
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
                                <h1 class="mt-4">Dashboard</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active">Dashboard</li>
                                </ol>
                                <div class="row">
                                    <div class="col-xl-3 col-md-6">
                                        <div class="card bg-primary text-white mb-4">
                                            <div class="card-body">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div>
                                                        <div class="text-white-75 small">Users</div>
                                                        <div class="fs-4 fw-bold">${countUsers}</div>
                                                    </div>
                                                    <i class="fas fa-users fa-2x text-white-50"></i>
                                                </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <a class="small text-white stretched-link" href="/admin/user">View
                                                    Details</a>
                                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-6">
                                        <div class="card bg-success text-white mb-4">
                                            <div class="card-body">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div>
                                                        <div class="text-white-75 small">Total Earnings</div>
                                                        <div class="fs-4 fw-bold">
                                                            <fmt:formatNumber value="${totalEarnings}" type="number" />
                                                            đ
                                                            VND
                                                        </div>
                                                    </div>
                                                    <i class="fas fa-dollar-sign fa-2x text-white-50"></i>
                                                </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <a class="small text-white stretched-link" href="/admin/order">View
                                                    Details</a>
                                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-6">
                                        <div class="card bg-warning text-white mb-4">
                                            <div class="card-body">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div>
                                                        <div class="text-white-75 small">Products</div>
                                                        <div class="fs-4 fw-bold">${countProducts}</div>
                                                    </div>
                                                    <i class="fas fa-gamepad fa-2x text-white-50"></i>
                                                </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <a class="small text-white stretched-link" href="/admin/product">View
                                                    Details</a>
                                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-6">
                                        <div class="card bg-danger text-white mb-4">
                                            <div class="card-body">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div>
                                                        <div class="text-white-75 small">Orders</div>
                                                        <div class="fs-4 fw-bold">${countOrders}</div>
                                                    </div>
                                                    <i class="fas fa-shopping-cart fa-2x text-white-50"></i>
                                                </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <a class="small text-white stretched-link" href="/admin/order">View
                                                    Details</a>
                                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-6">
                                        <div class="card mb-4">
                                            <div class="card-header">
                                                <i class="fas fa-chart-bar me-1"></i>
                                                Earnings Chart
                                            </div>
                                            <div class="card-body"><canvas id="myBarChart" width="100%"
                                                    height="40"></canvas></div>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="card mb-4">
                                            <div class="card-header">
                                                <i class="fas fa-chart-pie me-1"></i>
                                                Order Status
                                            </div>
                                            <div class="card-body"><canvas id="myPieChart" width="100%"
                                                    height="40"></canvas></div>
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
                <script src="/js/scripts.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>

                <!-- Pie Chart -->
                <script>
                    var ctx = document.getElementById("myPieChart");
                    var myPieChart = new Chart(ctx, {
                        type: 'pie',
                        data: {
                            labels: [<c:forEach items="${orderStatusCounts}" var="entry" varStatus="loop">'${entry.key}'<c:if test="${!loop.last}">, </c:if></c:forEach>],
                            datasets: [{
                                data: [<c:forEach items="${orderStatusCounts}" var="entry" varStatus="loop">${entry.value}<c:if test="${!loop.last}">, </c:if></c:forEach>],
                                backgroundColor: ['#ffc107', '#28a745', '#dc3545', '#007bff'],
                            }],
                        },
                    });
                </script>

                <!-- Bar Chart -->
                <script>
                    var ctxBar = document.getElementById("myBarChart");
                    var myBarChart = new Chart(ctxBar, {
                        type: 'bar',
                        data: {
                            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                            datasets: [{
                                label: "Earnings",
                                backgroundColor: "rgba(2,117,216,1)",
                                borderColor: "rgba(2,117,216,1)",
                                data: [<c:forEach items="${monthlyEarnings}" var="entry" varStatus="loop">${entry.value}<c:if test="${!loop.last}">, </c:if></c:forEach>],
                            }],
                        },
                        options: {
                            scales: {
                                xAxes: [{
                                    time: { unit: 'month' },
                                    gridLines: { display: false },
                                    ticks: { maxTicksLimit: 12 }
                                }],
                                yAxes: [{ ticks: { min: 0, callback: function (value) { return value.toLocaleString('en-US') + ' VND'; } }, gridLines: { display: true } }],
                            },
                            legend: { display: false }
                        }
                    });
                </script>

            </body>

            </html>