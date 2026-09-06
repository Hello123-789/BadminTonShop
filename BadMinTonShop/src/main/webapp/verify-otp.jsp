<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <title>Xác thực mã OTP - BadmintonShop</title>
</head>

<div class="row justify-content-center my-4">
    <div class="col-md-6 col-lg-5">
        <div class="card shadow-sm border-0 rounded-3">
            <div class="card-header bg-dark text-white text-center py-3 rounded-top">
                <h4 class="mb-0 text-warning"><i class="bi bi-shield-check me-2"></i>Xác Thực Mã OTP</h4>
            </div>
            <div class="card-body p-4">

                <p class="text-muted text-center mb-4">
                    Mã OTP 6 chữ số đã được gửi tới email đăng ký của bạn. Vui lòng kiểm tra hộp thư (bao gồm cả thư rác / spam).
                </p>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/verify-otp" method="post">
                    <div class="mb-4">
                        <label class="form-label fw-bold text-center d-block">Nhập Mã OTP (6 Chữ Số)</label>
                        <input type="text" name="otp" class="form-control form-control-lg text-center fs-3 letter-spacing-2" 
                               inputmode="numeric" pattern="[0-9]{6}" maxlength="6" placeholder="000000" required autofocus>
                    </div>

                    <div class="d-grid gap-2">
                        <button class="btn btn-warning text-dark fw-bold py-2" type="submit">
                            <i class="bi bi-check-circle me-1"></i>Xác thực kích hoạt
                        </button>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-secondary py-2">
                            Quay lại trang Đăng nhập
                        </a>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
