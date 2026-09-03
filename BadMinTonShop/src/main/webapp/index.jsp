<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Badminton Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <header class="top">
        <div class="container nav">
            <a class="brand" href="${pageContext.request.contextPath}/home">
                BadmintonShop
            </a>

            <nav class="navlinks">
                <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
                <a href="${pageContext.request.contextPath}/cart">Giỏ hàng</a>

                <c:choose>
                  <c:when test="${not empty sessionScope.authUser}">

    <c:if test="${sessionScope.authUser.role == 'ADMIN'}">

        <a href="${pageContext.request.contextPath}/admin/product/list">
            Quản trị
        </a>

    </c:if>

    <a href="${pageContext.request.contextPath}/profile"
       class="user-profile">

        <c:choose>

            <c:when test="${not empty sessionScope.authUser.image}">
                <img
                    src="${pageContext.request.contextPath}/${sessionScope.authUser.image}"
                    alt="Ảnh đại diện"
                    class="user-avatar"
                    style="width: 38px; height: 38px; border-radius: 50%; object-fit: cover; border: 2px solid #ffffff; display: inline-block; vertical-align: middle;">
            </c:when>

            <c:otherwise>
                <div class="user-avatar default-avatar"
                     style="width: 38px; height: 38px; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; vertical-align: middle;">
                    ${sessionScope.authUser.fullName.substring(0,1)}
                </div>
            </c:otherwise>

        </c:choose>

        <span class="user-name">
            ${sessionScope.authUser.fullName}
        </span>

    </a>

    <a href="${pageContext.request.contextPath}/logout">
        Đăng xuất
    </a>

</c:when>

                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login">
                            Đăng nhập
                        </a>
                    </c:otherwise>
                </c:choose>
            </nav>
        </div>
    </header>

    <section class="hero">
        <div class="container">
            <h1>Vợt cầu lông chính hãng</h1>
            <p>
                Khám phá vợt Yonex, Victor, Li-Ning, Mizuno và Apacs.
            </p>
            <a class="btn" href="#products">Xem sản phẩm</a>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <h2>Thương hiệu</h2>

            <div class="grid">
                <div class="card">
                    <img class="brand-img"
                         src="${pageContext.request.contextPath}/images/uploads/yonex.jpg"
                         alt="Yonex">
                    <h3>Yonex</h3>
                    <a class="btn secondary"
                       href="${pageContext.request.contextPath}/home?brand=Yonex#products">
                        Xem sản phẩm
                    </a>
                </div>

                <div class="card">
                    <img class="brand-img"
                         src="${pageContext.request.contextPath}/images/uploads/victor.png"
                         alt="Victor">
                    <h3>Victor</h3>
                    <a class="btn secondary"
                       href="${pageContext.request.contextPath}/home?brand=Victor#products">
                        Xem sản phẩm
                    </a>
                </div>

                <div class="card">
                    <img class="brand-img"
                         src="${pageContext.request.contextPath}/images/uploads/lining.jpg"
                         alt="Li-Ning">
                    <h3>Li-Ning</h3>
                    <a class="btn secondary"
                       href="${pageContext.request.contextPath}/home?brand=Li-Ning#products">
                        Xem sản phẩm
                    </a>
                </div>

                <div class="card">
                    <img class="brand-img"
                         src="${pageContext.request.contextPath}/images/uploads/mizuno.jpg"
                         alt="Mizuno">
                    <h3>Mizuno</h3>
                    <a class="btn secondary"
                       href="${pageContext.request.contextPath}/home?brand=Mizuno#products">
                        Xem sản phẩm
                    </a>
                </div>

                <div class="card">
                    <img class="brand-img"
                         src="${pageContext.request.contextPath}/images/uploads/apacs.jpg"
                         alt="Apacs">
                    <h3>Apacs</h3>
                    <a class="btn secondary"
                       href="${pageContext.request.contextPath}/home?brand=Apacs#products">
                        Xem sản phẩm
                    </a>
                </div>
            </div>
        </div>
    </section>

    <section class="section" id="products">
        <div class="container">
            <form class="form"
                  method="get"
                  action="${pageContext.request.contextPath}/home"
                  style="margin-bottom:20px; display:flex; gap:10px;">
                <input type="text"
                       name="keyword"
                       value="${keyword}"
                       placeholder="Tìm kiếm sản phẩm, hãng..."
                       style="flex:1;">
                <button class="btn" type="submit">Tìm kiếm</button>
            </form>

            <h2>
                <c:choose>
                    <c:when test="${not empty selectedBrand}">
                        Sản phẩm ${selectedBrand}
                    </c:when>
                    <c:otherwise>
                        Sản phẩm nổi bật
                    </c:otherwise>
                </c:choose>
            </h2>

            <div class="grid">
                <c:forEach var="p" items="${products}">
                    <div class="card">
                        <img class="product-img"
                             src="${pageContext.request.contextPath}/images/${p.image}"
                             alt="${p.productName}"
                             onerror="this.style.display='none'">

                        <h3>${p.productName}</h3>
                        <p class="muted">${p.brand}</p>
                        <p class="price">
                            <c:out value="${p.price}"/> ₫
                        </p>

                        <a class="btn secondary"
                           href="${pageContext.request.contextPath}/product/detail?id=${p.productId}">
                            Chi tiết
                        </a>

                        <form action="${pageContext.request.contextPath}/cart"
                              method="post"
                              style="display:inline;">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="id" value="${p.productId}">
                            <button class="btn" type="submit">Thêm giỏ</button>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
</body>
</html>
