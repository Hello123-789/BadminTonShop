<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - BadmintonShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <main class="section">
        <div class="container login-wrap">
            <form class="form login-form"
                  action="${pageContext.request.contextPath}/login"
                  method="post">

                <h1>Đăng nhập</h1>

                <% if ("1".equals(request.getParameter("registered"))) { %>
                    <div class="alert">
                        Đăng ký thành công. Hãy đăng nhập.
                    </div>
                <% } %>

                <% if ("1".equals(request.getParameter("reset"))) { %>
                    <div class="alert">
                        Đổi mật khẩu thành công. Hãy đăng nhập.
                    </div>
                <% } %>

                <% if (request.getAttribute("error") != null) { %>
                    <div class="alert error">
                        <%= request.getAttribute("error") %>
                    </div>
                <% } %>

                <% if ("admin".equals(request.getParameter("error"))) { %>
                    <div class="alert error">
                        Bạn cần đăng nhập bằng tài khoản Admin để vào khu vực quản trị.
                    </div>
                <% } %>

                <label>Tên đăng nhập</label>
                <input type="text" name="username" required autofocus>

                <label>Mật khẩu</label>
                <input type="password" name="password" required>

                <label class="check">
                    <input type="checkbox" name="remember">
                    Ghi nhớ đăng nhập trong 30 ngày
                </label>

                <button class="btn" type="submit">Đăng nhập</button>

                <p>
                    <a href="${pageContext.request.contextPath}/forgot-password">
                        Quên mật khẩu?
                    </a>
                </p>

                <a class="btn secondary"
                   href="${pageContext.request.contextPath}/register">
                    Đăng ký tài khoản
                </a>

                <a class="btn secondary"
                   href="${pageContext.request.contextPath}/home">
                    Về trang chủ
                </a>

                <p class="muted">
                    Demo Admin: <b>admin</b> / <b>admin123</b>
                </p>
            </form>
        </div>
    </main>
</body>
</html>
