<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <title>Thông tin cá nhân - BadmintonShop</title>
</head>

<div class="row justify-content-center my-4">
    <div class="col-md-10 col-lg-8">
        <div class="card shadow-sm border-0 rounded-3">
            <div class="card-header bg-dark text-white py-3 rounded-top d-flex justify-content-between align-items-center">
                <h4 class="mb-0 text-warning"><i class="bi bi-person-badge-fill me-2"></i>Thông Tin Cá Nhân</h4>
                <span class="badge bg-warning text-dark"><i class="bi bi-shield-check me-1"></i>Tài khoản ${user.role}</span>
            </div>
            <div class="card-body p-4">

                <c:if test="${param.success == '1'}">
                    <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
                        <i class="bi bi-check-circle-fill me-2"></i>Cập nhật thông tin cá nhân và ảnh đại diện thành công!
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/profile"
                      method="post"
                      enctype="multipart/form-data"
                      class="needs-validation">

                    <div class="row g-4">
                        <!-- Left Column: Avatar & File Upload -->
                        <div class="col-md-4 text-center border-end pe-md-4">
                            <div class="mb-3 position-relative display-inline-block">
                                <c:choose>
                                    <c:when test="${not empty user.image}">
                                        <img id="avatarPreview"
                                             src="${pageContext.request.contextPath}/${user.image}"
                                             alt="Avatar"
                                             class="rounded-circle img-thumbnail shadow-sm border border-3 border-warning"
                                             style="width: 150px; height: 150px; object-fit: cover;">
                                    </c:when>
                                    <c:otherwise>
                                        <img id="avatarPreview"
                                             src="https://via.placeholder.com/150?text=User"
                                             alt="Avatar"
                                             class="rounded-circle img-thumbnail shadow-sm border border-3 border-secondary"
                                             style="width: 150px; height: 150px; object-fit: cover;">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="mb-3">
                                <label for="imageInput" class="form-label fw-bold small text-muted">
                                    <i class="bi bi-camera-fill me-1"></i>Thay đổi ảnh đại diện
                                </label>
                                <input class="form-control form-control-sm"
                                       type="file"
                                       id="imageInput"
                                       name="image"
                                       accept="image/png, image/jpeg, image/jpg, image/webp"
                                       onchange="previewImage(this)">
                                <div class="form-text text-muted small">Hỗ trợ JPG, PNG, WEBP (Tối đa 5MB)</div>
                            </div>
                        </div>

                        <!-- Right Column: User Profile Fields -->
                        <div class="col-md-8 ps-md-4">
                            <div class="mb-3">
                                <label class="form-label fw-bold text-muted"><i class="bi bi-person me-1"></i>Tên đăng nhập</label>
                                <input type="text" class="form-control bg-light" value="${user.username}" readonly>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold text-muted"><i class="bi bi-envelope me-1"></i>Email địa chỉ</label>
                                <input type="text" class="form-control bg-light" value="${user.email}" readonly>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold"><i class="bi bi-person-vcard-fill me-1 text-primary"></i>Họ và tên <span class="text-danger">*</span></label>
                                <input type="text" name="fullName" class="form-control" value="${user.fullName}" required placeholder="Nhập họ và tên">
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold"><i class="bi bi-telephone-fill me-1 text-primary"></i>Số điện thoại</label>
                                <input type="tel" name="phone" class="form-control" value="${user.phone}" placeholder="Ví dụ: 0912345678" pattern="[0-9]{10}">
                                <div class="form-text">Nhập số điện thoại 10 chữ số.</div>
                            </div>

                            <div class="d-grid gap-2 mt-4">
                                <button type="submit" class="btn btn-warning text-dark fw-bold py-2">
                                    <i class="bi bi-floppy-fill me-1"></i>Cập nhật thông tin cá nhân
                                </button>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<script>
    function previewImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('avatarPreview').src = e.target.result;
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>