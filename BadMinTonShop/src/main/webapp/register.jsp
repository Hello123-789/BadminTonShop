<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <title>Đăng ký tài khoản - BadmintonShop</title>
</head>

<div class="row justify-content-center my-4">
    <div class="col-md-6 col-lg-5">
        <div class="card shadow-sm border-0 rounded-3">
            <div class="card-header bg-dark text-white text-center py-3 rounded-top">
                <h4 class="mb-0 text-warning"><i class="bi bi-person-plus-fill me-2"></i>Đăng Ký Tài Khoản</h4>
            </div>
            <div class="card-body p-4">

                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/register" method="post" class="needs-validation">
                    <div class="mb-3">
                        <label class="form-label fw-bold"><i class="bi bi-person-vcard me-1 text-primary"></i>Họ và tên</label>
                        <input type="text" name="fullName" class="form-control" placeholder="Nhập họ và tên của bạn" required autofocus>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold"><i class="bi bi-envelope me-1 text-primary"></i>Email</label>
                        <input type="email" name="email" class="form-control" placeholder="example@gmail.com" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold"><i class="bi bi-person me-1 text-primary"></i>Tên đăng nhập</label>
                        <input type="text" name="username" class="form-control" placeholder="Tên đăng nhập" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold"><i class="bi bi-lock me-1 text-primary"></i>Mật khẩu</label>
                        <input type="password" name="password" class="form-control" minlength="6" placeholder="Tối thiểu 6 ký tự" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold"><i class="bi bi-shield-lock me-1 text-primary"></i>Xác nhận mật khẩu</label>
                        <input type="password" name="confirmPassword" class="form-control" minlength="6" placeholder="Nhập lại mật khẩu" required>
                    </div>

                    <div class="d-grid gap-2 mt-4">
                        <button class="btn btn-warning text-dark fw-bold py-2" type="submit">
                            <i class="bi bi-envelope-paper-heart me-1"></i>Đăng ký và Nhận mã OTP
                        </button>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-secondary py-2">
                            <i class="bi bi-box-arrow-in-right me-1"></i>Đã có tài khoản? Đăng nhập
                        </a>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
