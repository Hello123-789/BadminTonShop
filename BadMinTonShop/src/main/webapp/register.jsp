<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký - BadmintonShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <main class="section">
        <div class="container login-wrap">
            <form class="form login-form"
                  action="${pageContext.request.contextPath}/register"
                  method="post">

                <h1>Đăng ký tài khoản</h1>

                <% if (request.getAttribute("error") != null) { %>
                    <div class="alert error">
                        <%= request.getAttribute("error") %>
                    </div>
                <% } %>

                <label>Họ và tên</label>
                <input type="text" name="fullName" required>

                <label>Tên đăng nhập</label>
                <input type="text" name="username" required>

                <label>Mật khẩu</label>
                <input type="password" name="password" minlength="6" required>

                <label>Xác nhận mật khẩu</label>
                <input type="password" name="confirmPassword" minlength="6" required>

                <button class="btn" type="submit">Đăng ký</button>
                <a class="btn secondary"
                   href="${pageContext.request.contextPath}/login">
                    Đã có tài khoản? Đăng nhập
                </a>
            </form>
        </div>
    </main>
</body>
</html>
