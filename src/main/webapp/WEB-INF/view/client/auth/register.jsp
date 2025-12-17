<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <title>Register | LUGX Gaming</title>
                <meta name="viewport" content="width=device-width, initial-scale=1">

                <!-- Bootstrap -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

                <style>
                    body {
                        min-height: 100vh;
                        background: linear-gradient(135deg, #a28a9b, #6052fb);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-family: 'Segoe UI', sans-serif;
                    }

                    .register-wrapper {
                        width: 100%;
                        max-width: 520px;
                    }

                    .register-card {
                        background: rgba(255, 255, 255, 0.15);
                        backdrop-filter: blur(18px);
                        border-radius: 22px;
                        padding: 40px 35px;
                        box-shadow: 0 25px 50px rgba(0, 0, 0, 0.25);
                        color: #fff;
                    }

                    .register-card h3 {
                        text-align: center;
                        font-weight: 700;
                        margin-bottom: 25px;
                    }

                    .form-control {
                        background: rgba(255, 255, 255, 0.2);
                        border: none;
                        border-radius: 14px;
                        color: #fff;
                        padding: 12px 14px;
                    }

                    .form-control::placeholder {
                        color: rgba(255, 255, 255, 0.7);
                    }

                    .form-control:focus {
                        background: rgba(255, 255, 255, 0.3);
                        box-shadow: none;
                        color: #fff;
                    }

                    .form-floating label {
                        color: rgba(255, 255, 255, 0.85);
                    }

                    .btn-register {
                        background: #ffc107;
                        color: #000;
                        border-radius: 16px;
                        font-weight: 600;
                        padding: 12px;
                        border: none;
                    }

                    .btn-register:hover {
                        background: #ffb300;
                    }

                    .invalid-feedback {
                        display: block;
                        font-size: 13px;
                        color: #ffdddd;
                    }

                    .extra-link {
                        text-align: center;
                        margin-top: 20px;
                        font-size: 14px;
                    }

                    .extra-link a {
                        color: #ffd54f;
                        text-decoration: none;
                    }
                </style>
            </head>

            <body>

                <div class="register-wrapper">
                    <div class="register-card">

                        <h3>Create Account</h3>

                        <form:form method="post" action="/register" modelAttribute="registerUser">

                            <c:set var="errorFirstName">
                                <form:errors path="firstName" cssClass="invalid-feedback" />
                            </c:set>
                            <c:set var="errorEmail">
                                <form:errors path="email" cssClass="invalid-feedback" />
                            </c:set>
                            <c:set var="errorPassword">
                                <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                            </c:set>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <form:input class="form-control${not empty errorFirstName ? ' is-invalid' : ''}"
                                            path="firstName" placeholder="First name" />
                                        <label>First name</label>
                                        ${errorFirstName}
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <form:input class="form-control" path="lastName" placeholder="Last name" />
                                        <label>Last name</label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-floating mb-3">
                                <form:input class="form-control${not empty errorEmail ? ' is-invalid' : ''}"
                                    path="email" placeholder="name@example.com" />
                                <label>Email address</label>
                                ${errorEmail}
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <form:input class="form-control${not empty errorPassword ? ' is-invalid' : ''}"
                                            path="password" type="password" placeholder="Password" />
                                        <label>Password</label>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <form:input class="form-control" path="confirmPassword" type="password"
                                            placeholder="Confirm Password" />
                                        <label>Confirm password</label>
                                        ${errorPassword}
                                    </div>
                                </div>
                            </div>

                            <div class="d-grid mt-4">
                                <button type="submit" class="btn btn-register">
                                    Create Account
                                </button>
                            </div>
                        </form:form>

                        <div class="extra-link">
                            Already have an account?
                            <a href="/login">Login</a>
                        </div>

                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>