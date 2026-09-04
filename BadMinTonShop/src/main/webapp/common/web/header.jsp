<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Web Header Component -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold text-warning" href="${pageContext.request.contextPath}/home">
            <i class="bi bi-trophy-fill me-2"></i>Badminton Shop
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarWeb">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarWeb">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/home">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home?brand=Yonex">Yonex</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home?brand=Lining">Lining</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home?brand=Victor">Victor</a>
                </li>
            </ul>
            
            <form class="d-flex me-3" action="${pageContext.request.contextPath}/home" method="get">
                <div class="input-group">
                    <input class="form-control" type="search" name="keyword" placeholder="Tìm vợt cầu lông..." value="${param.keyword}">
                    <button class="btn btn-outline-warning" type="submit"><i class="bi bi-search"></i></button>
                </div>
            </form>
            
            <ul class="navbar-nav align-items-center">
                <li class="nav-item me-2">
                    <a class="btn btn-outline-light position-relative" href="${pageContext.request.contextPath}/cart">
                        <i class="bi bi-cart3 me-1"></i> Giỏ hàng
                    </a>
                </li>
                <c:choose>
                    <c:when test="${not empty sessionScope.account}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="bi bi-person-circle me-1"></i> ${sessionScope.account.username}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile">Thông tin cá nhân</a></li>
                                <c:if test="${sessionScope.account.role == 'ADMIN'}">
                                    <li><a class="dropdown-item text-danger fw-bold" href="${pageContext.request.contextPath}/admin/category/list">Trang Quản Trị</a></li>
                                </c:if>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="btn btn-warning text-dark me-2" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-outline-warning" href="${pageContext.request.contextPath}/register">Đăng ký</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
