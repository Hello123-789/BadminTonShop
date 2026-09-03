<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý sản phẩm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="admin-nav">
        <div class="container nav">
            <b>ADMIN</b>
            <div class="navlinks">
                <a href="${pageContext.request.contextPath}/admin/product/list">Sản phẩm</a>
                <a href="${pageContext.request.contextPath}/home">Cửa hàng</a>
                <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
            </div>
        </div>
    </div>

    <main class="section">
        <div class="container">
            <h1>Quản lý sản phẩm</h1>

            <a class="btn"
               href="${pageContext.request.contextPath}/admin/product/add">
                + Thêm sản phẩm
            </a>

            <form method="get"
                  action="${pageContext.request.contextPath}/admin/product/list"
                  style="margin:20px 0; display:flex; gap:10px;">
                <input type="text"
                       name="keyword"
                       value="${keyword}"
                       placeholder="Tìm theo tên, hãng, mô tả..."
                       style="flex:1;">

                <button class="btn" type="submit">Tìm kiếm</button>

                <a class="btn secondary"
                   href="${pageContext.request.contextPath}/admin/product/list">
                    Xóa lọc
                </a>
            </form>

            <table class="table">
                <tr>
                    <th>ID</th>
                    <th>Sản phẩm</th>
                    <th>Hãng</th>
                    <th>Giá</th>
                    <th>Kho</th>
                    <th>Hành động</th>
                </tr>

                <c:forEach var="p" items="${products}">
                    <tr>
                        <td>${p.productId}</td>
                        <td>${p.productName}</td>
                        <td>${p.brand}</td>
                        <td>${p.price}</td>
                        <td>${p.quantity}</td>
                        <td class="actions">
                            <a class="btn secondary"
                               href="${pageContext.request.contextPath}/admin/product/edit?id=${p.productId}">
                                Sửa
                            </a>
                            <a class="btn danger"
                               href="${pageContext.request.contextPath}/admin/product/delete?id=${p.productId}"
                               onclick="return confirm('Xóa sản phẩm này?')">
                                Xóa
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </main>
</body>
</html>
