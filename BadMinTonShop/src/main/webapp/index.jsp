<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%
    if (request.getAttribute("products") == null) {
        response.sendRedirect(request.getContextPath() + "/home");
        return;
    }
%>

<head>
    <title>Trang Chủ - BadmintonShop Vợt & Giày Cầu Lông Chính Hãng</title>
</head>

<!-- Hero Banner -->
<div class="p-4 p-md-5 mb-4 rounded-3 text-white bg-dark shadow-sm position-relative overflow-hidden">
    <div class="col-md-8 p-lg-3 my-2 position-relative z-1">
        <span class="badge bg-warning text-dark px-3 py-2 fs-6 mb-3 fw-bold">
            <i class="bi bi-star-fill me-1"></i>Hệ Thống Shop Cầu Lông Hàng Đầu
        </span>
        <h1 class="display-4 fw-bold text-warning">Vợt & Giày Cầu Lông Chính Hãng</h1>
        <p class="lead my-3">
            Chuyên phân phối các thương hiệu hàng đầu thế giới: <b>Yonex</b>, <b>Victor</b>, <b>Li-Ning</b>, <b>Mizuno</b> và <b>Apacs</b>.
        </p>
        <div class="d-flex flex-wrap gap-2 mt-4">
            <a class="btn btn-warning btn-lg text-dark fw-bold px-4 me-md-2" href="${pageContext.request.contextPath}/product">
                <i class="bi bi-bag-check-fill me-2"></i>Xem Tất Cả Sản Phẩm
            </a>
            <a class="btn btn-outline-light btn-lg px-4" href="${pageContext.request.contextPath}/product?categoryId=1">
                <i class="bi bi-lightning-fill me-1 text-warning"></i>Vợt Cầu Lông
            </a>
        </div>
    </div>
</div>

<!-- Section: Category Overview (Vợt, Giày, Phụ Kiện) -->
<div class="container my-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold text-dark mb-0">
            <i class="bi bi-grid-fill text-primary me-2"></i>Danh Mục Sản Phẩm
        </h3>
    </div>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <!-- Category 1: Vợt Cầu Lông -->
        <div class="col">
            <div class="card h-100 border-0 shadow-sm rounded-3 overflow-hidden text-white bg-primary position-relative">
                <div class="card-body p-4 d-flex flex-column justify-content-between">
                    <div>
                        <span class="fs-1"><i class="bi bi-lightning-charge-fill text-warning"></i></span>
                        <h4 class="fw-bold text-white mt-2">Vợt Cầu Lông</h4>
                        <p class="card-text text-white-50">Tất cả mẫu vợt công, thủ, toàn diện từ Yonex, Victor, Li-Ning, Mizuno, Apacs.</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/product?categoryId=1" class="btn btn-light text-primary fw-bold mt-3 align-self-start rounded-pill">
                        Khám phá Vợt <i class="bi bi-arrow-right ms-1"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- Category 3: Giày Cầu Lông -->
        <div class="col">
            <div class="card h-100 border-0 shadow-sm rounded-3 overflow-hidden text-white bg-success position-relative">
                <div class="card-body p-4 d-flex flex-column justify-content-between">
                    <div>
                        <span class="fs-1"><i class="bi bi-badge-ad-fill text-white"></i></span>
                        <h4 class="fw-bold text-white mt-2">Giày Cầu Lông</h4>
                        <p class="card-text text-white-50">Giày êm ái, bám sân cực tốt, công nghệ đế giảm chấn tối ưu.</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/product?categoryId=3" class="btn btn-light text-success fw-bold mt-3 align-self-start rounded-pill">
                        Khám phá Giày <i class="bi bi-arrow-right ms-1"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- Category 2: Phụ Kiện -->
        <div class="col">
            <div class="card h-100 border-0 shadow-sm rounded-3 overflow-hidden text-white bg-info position-relative">
                <div class="card-body p-4 d-flex flex-column justify-content-between">
                    <div>
                        <span class="fs-1"><i class="bi bi-box-seam-fill text-white"></i></span>
                        <h4 class="fw-bold text-white mt-2">Phụ Kiện Cầu Lông</h4>
                        <p class="card-text text-white-50">Cầu lông, quấn cán vợt, vớ thể thao, túi bao vợt chính hãng.</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/product?categoryId=2" class="btn btn-light text-info fw-bold mt-3 align-self-start rounded-pill">
                        Khám phá Phụ Kiện <i class="bi bi-arrow-right ms-1"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Section: Brands Showcase -->
<div class="container my-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold text-dark mb-0"><i class="bi bi-award-fill text-warning me-2"></i>Thương Hiệu Nổi Bật</h3>
    </div>
    <div class="row row-cols-2 row-cols-sm-3 row-cols-md-5 g-3">
        <div class="col">
            <a href="${pageContext.request.contextPath}/product?brand=Yonex" class="card h-100 text-decoration-none text-center shadow-sm border-0 p-3 rounded-3 brand-card">
                <img src="${pageContext.request.contextPath}/images/uploads/yonex.jpg" class="img-fluid rounded mb-2" style="height: 50px; object-fit: contain;" alt="Yonex">
                <span class="fw-bold text-dark">Yonex</span>
            </a>
        </div>
        <div class="col">
            <a href="${pageContext.request.contextPath}/product?brand=Victor" class="card h-100 text-decoration-none text-center shadow-sm border-0 p-3 rounded-3 brand-card">
                <img src="${pageContext.request.contextPath}/images/uploads/victor.png" class="img-fluid rounded mb-2" style="height: 50px; object-fit: contain;" alt="Victor">
                <span class="fw-bold text-dark">Victor</span>
            </a>
        </div>
        <div class="col">
            <a href="${pageContext.request.contextPath}/product?brand=Li-Ning" class="card h-100 text-decoration-none text-center shadow-sm border-0 p-3 rounded-3 brand-card">
                <img src="${pageContext.request.contextPath}/images/uploads/lining.jpg" class="img-fluid rounded mb-2" style="height: 50px; object-fit: contain;" alt="Li-Ning">
                <span class="fw-bold text-dark">Li-Ning</span>
            </a>
        </div>
        <div class="col">
            <a href="${pageContext.request.contextPath}/product?brand=Mizuno" class="card h-100 text-decoration-none text-center shadow-sm border-0 p-3 rounded-3 brand-card">
                <img src="${pageContext.request.contextPath}/images/uploads/mizuno.jpg" class="img-fluid rounded mb-2" style="height: 50px; object-fit: contain;" alt="Mizuno">
                <span class="fw-bold text-dark">Mizuno</span>
            </a>
        </div>
        <div class="col">
            <a href="${pageContext.request.contextPath}/product?brand=Apacs" class="card h-100 text-decoration-none text-center shadow-sm border-0 p-3 rounded-3 brand-card">
                <img src="${pageContext.request.contextPath}/images/uploads/apacs.jpg" class="img-fluid rounded mb-2" style="height: 50px; object-fit: contain;" alt="Apacs">
                <span class="fw-bold text-dark text-info">Apacs</span>
            </a>
        </div>
    </div>
</div>

<!-- Section: Products Grid -->
<div class="container my-5" id="products">
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center mb-4 bg-white p-3 rounded shadow-sm border">
        <h3 class="fw-bold text-dark mb-2 mb-md-0">
            <i class="bi bi-fire text-danger me-2"></i>
            <c:choose>
                <c:when test="${not empty selectedBrand}">Sản Phẩm Thương Hiệu: ${selectedBrand}</c:when>
                <c:otherwise>Sản Phẩm Mới Nhất</c:otherwise>
            </c:choose>
        </h3>
        <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-warning text-dark fw-bold btn-sm rounded-pill">
            Xem tất cả sản phẩm <i class="bi bi-arrow-right"></i>
        </a>
    </div>

    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
        <c:forEach var="p" items="${products}">
            <div class="col">
                <div class="card h-100 shadow-sm border-0 rounded-3">
                    <div class="position-relative text-center bg-light p-3 rounded-top">
                        <c:choose>
                            <c:when test="${not empty p.category}">
                                <span class="position-absolute top-0 start-0 m-2 badge bg-primary">${p.category.cateName}</span>
                            </c:when>
                            <c:otherwise>
                                <span class="position-absolute top-0 start-0 m-2 badge bg-secondary">Sản phẩm</span>
                            </c:otherwise>
                        </c:choose>
                        <span class="position-absolute top-0 end-0 m-2 badge bg-dark">${p.brand}</span>
                        <img src="${pageContext.request.contextPath}/images/${p.image}"
                             class="card-img-top img-fluid"
                             alt="${p.productName}"
                             style="height: 180px; object-fit: contain;">
                    </div>
                    <div class="card-body d-flex flex-column">
                        <h6 class="card-title fw-bold text-truncate text-dark mb-1" title="${p.productName}">${p.productName}</h6>
                        <p class="card-text text-muted small mb-2">Hãng: <span class="fw-semibold">${p.brand}</span></p>
                        <div class="mt-auto">
                            <div class="text-danger fw-bold fs-5 mb-2">
                                <fmt:formatNumber value="${p.price}" pattern="#,###"/> ₫
                            </div>
                            <div class="d-flex gap-2">
                                <a href="${pageContext.request.contextPath}/product-detail?id=${p.productId}"
                                   class="btn btn-outline-primary btn-sm flex-grow-1">
                                    Chi tiết
                                </a>
                                <form action="${pageContext.request.contextPath}/cart" method="post">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="id" value="${p.productId}">
                                    <button class="btn btn-warning btn-sm text-dark" type="submit" title="Thêm vào giỏ hàng">
                                        <i class="bi bi-cart-plus-fill"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
