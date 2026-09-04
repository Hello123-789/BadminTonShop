<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="list-group shadow-sm">
    <div class="list-group-item bg-dark text-white fw-bold">
        <i class="bi bi-grid-fill me-2"></i>MENU QUẢN TRỊ
    </div>
    <a href="${pageContext.request.contextPath}/admin/category/list" class="list-group-item list-group-item-action">
        <i class="bi bi-tags-fill me-2 text-primary"></i>Quản lý Danh mục
    </a>
    <a href="${pageContext.request.contextPath}/admin/product/list" class="list-group-item list-group-item-action">
        <i class="bi bi-box-seam-fill me-2 text-success"></i>Quản lý Sản phẩm
    </a>
    <a href="${pageContext.request.contextPath}/admin/product/add" class="list-group-item list-group-item-action">
        <i class="bi bi-plus-circle-fill me-2 text-warning"></i>Thêm sản phẩm mới
    </a>
</div>
