<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <title>Đăng nhập - BadmintonShop</title>
</head>

<div class="row justify-content-center my-4">
    <div class="col-md-6 col-lg-5">
        <div class="card shadow-sm border-0 rounded-3">
            <div class="card-header bg-dark text-white text-center py-3 rounded-top">
                <h4 class="mb-0 text-warning"><i class="bi bi-box-arrow-in-right me-2"></i>Đăng Nhập Tài Khoản</h4>
            </div>
            <div class="card-body p-4">

                <c:if test="${param.registered == '1'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="bi bi-check-circle-fill me-2"></i>Đăng ký thành công! Vui lòng đăng nhập.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <c:if test="${param.reset == '1'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="bi bi-check-circle-fill me-2"></i>Đổi mật khẩu thành công! Hãy đăng nhập bằng mật khẩu mới.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <c:if test="${param.error == 'admin'}">
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <i class="bi bi-shield-lock-fill me-2"></i>Bạn cần đăng nhập bằng tài khoản Admin để truy cập trang Quản trị.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/login" method="post" class="needs-validation">
                    <div class="mb-3">
                        <label class="form-label fw-bold"><i class="bi bi-person-fill me-1 text-primary"></i>Tên đăng nhập</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-person"></i></span>
                            <input type="text" name="username" class="form-control" placeholder="Nhập tên đăng nhập" required autofocus>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold"><i class="bi bi-key-fill me-1 text-primary"></i>Mật khẩu</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-lock"></i></span>
                            <input type="password" name="password" class="form-control" placeholder="Nhập mật khẩu" required>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="remember" id="rememberMe">
                            <label class="form-check-label text-muted" for="rememberMe">Ghi nhớ đăng nhập</label>
                        </div>
                        <a href="${pageContext.request.contextPath}/forgot-password" class="text-decoration-none small text-primary fw-bold">Quên mật khẩu?</a>
                    </div>

                    <div class="d-grid gap-2">
                        <button class="btn btn-warning text-dark fw-bold py-2" type="submit">
                            <i class="bi bi-box-arrow-in-right me-1"></i>Đăng nhập
                        </button>
                        <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-secondary py-2">
                            <i class="bi bi-person-plus me-1"></i>Tạo tài khoản mới
                        </a>
                    </div>
                </form>

                <div class="mt-3 text-center text-muted small bg-light p-2 rounded border">
                    <i class="bi bi-info-circle me-1"></i>Demo Admin: <b>admin</b> / <b>admin123</b>
                </div>
            </div>
        </div>
    </div>
</div>
