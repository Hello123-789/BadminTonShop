<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<head>
    <title>Danh Sách Sản Phẩm - BadmintonShop</title>
</head>

<div class="container my-4">

    <!-- Page Title & Filter Bar -->
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center bg-white p-3 rounded shadow-sm mb-4 border">
        <div>
            <h3 class="mb-1 text-dark fw-bold">
                <i class="bi bi-grid-3x3-gap-fill text-warning me-2"></i>
                <c:choose>
                    <c:when test="${selectedCategoryId == 1}">Vợt Cầu Lông</c:when>
                    <c:when test="${selectedCategoryId == 3}">Giày Cầu Lông</c:when>
                    <c:when test="${selectedCategoryId == 2}">Phụ Kiện Cầu Lông</c:when>
                    <c:when test="${not empty selectedBrand}">Thương hiệu: ${selectedBrand}</c:when>
                    <c:when test="${not empty keyword}">Kết quả tìm kiếm: "${keyword}"</c:when>
                    <c:otherwise>Tất Cả Sản Phẩm</c:otherwise>
                </c:choose>
            </h3>
            <p class="text-muted mb-0 small">Tìm thấy <span class="fw-bold text-primary">${totalProducts}</span> sản phẩm phù hợp</p>
        </div>

        <!-- Category Nav Filter Badges -->
        <div class="mt-3 mt-md-0 d-flex flex-wrap gap-2">
            <a href="${pageContext.request.contextPath}/product" 
               class="btn btn-sm ${empty selectedCategoryId && empty selectedBrand ? 'btn-primary' : 'btn-outline-secondary'} rounded-pill">
                Tất cả
            </a>
            <a href="${pageContext.request.contextPath}/product?categoryId=1" 
               class="btn btn-sm ${selectedCategoryId == 1 ? 'btn-warning text-dark fw-bold' : 'btn-outline-warning text-dark'} rounded-pill">
                <i class="bi bi-lightning-fill me-1"></i>Vợt Cầu Lông
            </a>
            <a href="${pageContext.request.contextPath}/product?categoryId=3" 
               class="btn btn-sm ${selectedCategoryId == 3 ? 'btn-success fw-bold' : 'btn-outline-success'} rounded-pill">
                <i class="bi bi-badge-ad-fill me-1"></i>Giày Cầu Lông
            </a>
            <a href="${pageContext.request.contextPath}/product?categoryId=2" 
               class="btn btn-sm ${selectedCategoryId == 2 ? 'btn-info text-white fw-bold' : 'btn-outline-info'} rounded-pill">
                <i class="bi bi-box-seam-fill me-1"></i>Phụ Kiện
            </a>
        </div>
    </div>

    <!-- Product Grid -->
    <c:choose>
        <c:when test="${not empty products}">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
                <c:forEach var="p" items="${products}">
                    <div class="col">
                        <div class="card h-100 shadow-sm border-0 rounded-3 product-card">
                            <div class="position-relative text-center bg-light p-3 rounded-top">
                                <c:choose>
                                    <c:when test="${not empty p.category}">
                                        <span class="position-absolute top-0 start-0 m-2 badge bg-primary">
                                            ${p.category.cateName}
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="position-absolute top-0 start-0 m-2 badge bg-secondary">
                                            Sản phẩm
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                                <span class="position-absolute top-0 end-0 m-2 badge bg-dark">
                                    ${p.brand}
                                </span>
                                <img src="${pageContext.request.contextPath}/images/${p.image}" 
                                     class="card-img-top img-fluid" 
                                     alt="${p.productName}"
                                     style="height: 200px; object-fit: contain;">
                            </div>
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title text-truncate fw-bold text-dark mb-1" title="${p.productName}">${p.productName}</h5>
                                <p class="card-text text-muted small mb-2">Thương hiệu: <span class="fw-semibold">${p.brand}</span></p>
                                <div class="mt-auto d-flex justify-content-between align-items-center">
                                    <span class="text-danger fw-bold fs-5">
                                        <fmt:formatNumber value="${p.price}" pattern="#,###"/> ₫
                                    </span>
                                    <a href="${pageContext.request.contextPath}/product-detail?id=${p.productId}" 
                                       class="btn btn-outline-primary btn-sm rounded-pill px-3">
                                        <i class="bi bi-eye-fill me-1"></i>Chi tiết
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Pagination Controls -->
            <c:if test="${totalPages > 1}">
                <nav class="mt-5" aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <c:if test="${currentPage > 1}">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/product?page=${currentPage - 1}&categoryId=${selectedCategoryId}&brand=${selectedBrand}&keyword=${keyword}">
                                    &laquo; Trước
                                </a>
                            </li>
                        </c:if>

                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a class="page-link ${i == currentPage ? 'bg-warning text-dark border-warning' : ''}" 
                                   href="${pageContext.request.contextPath}/product?page=${i}&categoryId=${selectedCategoryId}&brand=${selectedBrand}&keyword=${keyword}">
                                    ${i}
                                </a>
                            </li>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages}">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/product?page=${currentPage + 1}&categoryId=${selectedCategoryId}&brand=${selectedBrand}&keyword=${keyword}">
                                    Sau &raquo;
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </c:if>
        </c:when>
        <c:otherwise>
            <div class="text-center py-5 bg-white rounded shadow-sm">
                <i class="bi bi-search display-1 text-muted"></i>
                <h4 class="mt-3 text-muted">Không tìm thấy sản phẩm nào!</h4>
                <a href="${pageContext.request.contextPath}/product" class="btn btn-warning text-dark mt-2 fw-bold">
                    Xem tất cả sản phẩm
                </a>
            </div>
        </c:otherwise>
    </c:choose>
</div>
