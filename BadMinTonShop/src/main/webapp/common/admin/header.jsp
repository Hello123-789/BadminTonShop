<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm mb-4">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/admin/category/list">
            <i class="bi bi-speedometer2 me-2"></i>Admin Dashboard
        </a>
        <div class="d-flex align-items-center ms-auto">
            <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-light btn-sm me-3" target="_blank">
                <i class="bi bi-globe me-1"></i>Xem trang web
            </a>
            <span class="text-white me-3">
                <i class="bi bi-person-circle me-1"></i>Xin chào, <strong>${sessionScope.account != null ? sessionScope.account.username : 'Admin'}</strong>
            </span>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-light btn-sm text-primary fw-bold">
                <i class="bi bi-box-arrow-right me-1"></i>Đăng xuất
            </a>
        </div>
    </div>
</nav>
