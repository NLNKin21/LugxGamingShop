<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Login | LUGX Gaming</title>
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <!-- Bootstrap -->
            <link href="/client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

            <style>
                body {
                    min-height: 100vh;
                    background: linear-gradient(135deg, #a28a9b, #6052fb);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-family: 'Segoe UI', sans-serif;
                }

                .login-wrapper {
                    width: 100%;
                    max-width: 420px;
                    position: relative;
                }

                .login-card {
                    backdrop-filter: blur(20px);
                    background: rgba(255, 255, 255, 0.15);
                    border-radius: 20px;
                    padding: 40px 35px;
                    box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
                    color: #fff;
                }

                .login-card h3 {
                    text-align: center;
                    font-weight: 700;
                    margin-bottom: 25px;
                }

                .form-control {
                    background: rgba(255, 255, 255, 0.2);
                    border: none;
                    border-radius: 12px;
                    color: #fff;
                    padding: 12px 15px;
                }

                .form-control::placeholder {
                    color: rgba(255, 255, 255, 0.7);
                }

                .form-control:focus {
                    box-shadow: none;
                    background: rgba(255, 255, 255, 0.3);
                    color: #fff;
                }

                .btn-login {
                    background: #ffc107;
                    color: #000;
                    border-radius: 14px;
                    font-weight: 600;
                    padding: 12px;
                    border: none;
                    transition: 0.3s;
                }

                .btn-login:hover {
                    background: #ffb300;
                }

                .extra-links {
                    text-align: center;
                    margin-top: 20px;
                    font-size: 14px;
                }

                .extra-links a {
                    color: #ffd54f;
                    text-decoration: none;
                }

                .alert {
                    background: rgba(255, 255, 255, 0.2);
                    border: none;
                    color: #fff;
                    border-radius: 10px;
                    font-size: 14px;
                }
            </style>
        </head>

        <body>

            <div class="login-wrapper">
                <div class="login-card">

                    <h3>Login</h3>

                    <c:if test="${param.error != null}">
                        <div class="alert alert-danger text-center">
                            Email hoặc mật khẩu không đúng
                        </div>
                    </c:if>

                    <c:if test="${param.logout != null}">
                        <div class="alert alert-success text-center">
                            Đăng xuất thành công
                        </div>
                    </c:if>

                    <form action="/login" method="post">
                        <div class="mb-3">
                            <input type="email" name="username" class="form-control" placeholder="Email" required>
                        </div>

                        <div class="mb-3">
                            <input type="password" name="password" class="form-control" placeholder="Password" required>
                        </div>

                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="remember-me" id="remember">
                                <label class="form-check-label text-white" for="remember">
                                    Remember me
                                </label>
                            </div>
                            <a href="#" class="text-warning small">Forgot password?</a>
                        </div>

                        <button type="submit" class="btn btn-login w-100">Login</button>
                    </form>

                    <div class="extra-links">
                        Don’t have an account?
                        <a href="/register">Sign up</a>
                    </div>
                </div>
            </div>

            <script src="/client/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>