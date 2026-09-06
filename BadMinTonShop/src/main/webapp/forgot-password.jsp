<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <title>Khôi phục mật khẩu - BadmintonShop</title>
</head>

<div class="row justify-content-center my-4">
    <div class="col-md-6 col-lg-5">
        <div class="card shadow-sm border-0 rounded-3">
            <div class="card-header bg-dark text-white text-center py-3 rounded-top">
                <h4 class="mb-0 text-warning"><i class="bi bi-key-fill me-2"></i>Khôi Phục Mật Khẩu</h4>
            </div>
            <div class="card-body p-4">

                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <c:choose>
                    <c:when test="${verifyMode}">
                        <p class="text-muted text-center mb-3">Mã OTP đã gửi tới email. Nhập mã OTP và mật khẩu mới để cài đặt lại.</p>
                        <form action="${pageContext.request.contextPath}/forgot-password" method="post">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Mã OTP (6 Chữ Số)</label>
                                <input type="text" name="otp" class="form-control form-control-lg text-center fs-4" 
                                       inputmode="numeric" pattern="[0-9]{6}" maxlength="6" placeholder="000000" required autofocus>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Mật khẩu mới</label>
                                <input type="password" name="newPassword" class="form-control" minlength="6" placeholder="Tối thiểu 6 ký tự" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Xác nhận mật khẩu mới</label>
                                <input type="password" name="confirmPassword" class="form-control" minlength="6" placeholder="Nhập lại mật khẩu mới" required>
                            </div>

                            <div class="d-grid gap-2 mt-4">
                                <button class="btn btn-warning text-dark fw-bold py-2" type="submit">
                                    <i class="bi bi-check-lg me-1"></i>Xác nhận & Đổi mật khẩu
                                </button>
                            </div>
                        </form>
                    </c:when>

                    <c:otherwise>
                        <p class="text-muted text-center mb-3">Nhập tên đăng nhập hoặc email tài khoản của bạn để nhận mã OTP khôi phục.</p>
                        <form action="${pageContext.request.contextPath}/forgot-password" method="post">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Tên đăng nhập hoặc Email</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-person-bounding-box"></i></span>
                                    <input type="text" name="usernameOrEmail" class="form-control" placeholder="Tên đăng nhập hoặc email" required autofocus>
                                </div>
                            </div>

                            <div class="d-grid gap-2 mt-4">
                                <button class="btn btn-warning text-dark fw-bold py-2" type="submit">
                                    <i class="bi bi-send me-1"></i>Gửi Mã OTP Đến Email
                                </button>
                                <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-secondary py-2">
                                    <i class="bi bi-arrow-left me-1"></i>Quay lại đăng nhập
                                </a>
                            </div>
                        </form>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>
</div>
