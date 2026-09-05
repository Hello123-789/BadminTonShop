<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <title>Quản lý danh mục - Admin</title>
</head>

<body>
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3 class="fw-bold text-primary mb-0">
            <i class="bi bi-tags-fill me-2"></i>Quản Lý Danh Mục
        </h3>
        <form action="${pageContext.request.contextPath}/admin/category/list" method="post" style="display:flex;gap:8px;">
            <input name="cateName" placeholder="Tên danh mục" required>
            <input name="icons" placeholder="Icon URL (tuỳ chọn)">
            <button type="submit" class="btn btn-success">
            <i class="bi bi-plus-lg me-1"></i>Thêm
            </button>
        </form>
    </div>

    <div class="table-responsive">
        <table class="table table-hover table-striped align-middle border">
            <thead class="table-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Tên danh mục</th>
                    <th scope="col">Hình ảnh / Icon</th>
                    <th scope="col" class="text-center">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty categories}">
                        <c:forEach var="category" items="${categories}">
                            <tr>
                                <td><strong>#${category.cateId}</strong></td>
                                <td><span class="fw-semibold text-dark">${category.cateName}</span></td>
                                <td>
                                    <c:if test="${not empty category.icons}">
                                        <img src="${category.icons}" alt="${category.cateName}" style="max-height: 40px;" class="img-thumbnail me-2">
                                    </c:if>
                                    ${category.icons}
                                </td>
                                <td class="text-center">
                                    <a href="#" class="btn btn-sm btn-outline-warning me-1">
                                        <i class="bi bi-pencil-square me-1"></i>Sửa
                                    </a>
                                    <a href="#" class="btn btn-sm btn-outline-danger" onclick="return confirm('Bạn có chắc muốn xóa?')">
                                        <i class="bi bi-trash-fill me-1"></i>Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="4" class="text-center text-muted py-4">
                                <i class="bi bi-inbox fs-2 d-block mb-2"></i>
                                Chưa có danh mục nào trong hệ thống
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</body>