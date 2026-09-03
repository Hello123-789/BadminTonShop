<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu - BadmintonShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <main class="section">
        <div class="container login-wrap">
            <form class="form login-form"
                  action="${pageContext.request.contextPath}/forgot-password"
                  method="post">

                <h1>Quên mật khẩu</h1>
                <p class="muted">
                    Nhập đúng tên đăng nhập và họ tên để đặt mật khẩu mới.
                </p>

                <% if (request.getAttribute("error") != null) { %>
                    <div class="alert error">
                        <%= request.getAttribute("error") %>
                    </div>
                <% } %>

                <label>Tên đăng nhập</label>
                <input type="text" name="username" required>

                <label>Họ và tên</label>
                <input type="text" name="fullName" required>

                <label>Mật khẩu mới</label>
                <input type="password" name="newPassword" minlength="6" required>

                <label>Xác nhận mật khẩu mới</label>
                <input type="password" name="confirmPassword" minlength="6" required>

                <button class="btn" type="submit">Đặt lại mật khẩu</button>
                <a class="btn secondary"
                   href="${pageContext.request.contextPath}/login">
                    Quay lại đăng nhập
                </a>
            </form>
        </div>
    </main>
</body>
</html>
