<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.List, com.vovanthinh.model.CartItem" %>
<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    java.math.BigDecimal total = java.math.BigDecimal.ZERO;
    if (cart != null) {
        for (CartItem item : cart) {
            total = total.add(item.getSubtotal());
        }
    }
    request.setAttribute("total", total);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<header class="top">
    <div class="container nav">
        <a class="brand" href="${pageContext.request.contextPath}/home">BadmintonShop</a>
        <a href="${pageContext.request.contextPath}/home">Tiếp tục mua</a>
    </div>
</header>

<main class="section">
    <div class="container">
        <h1>Giỏ hàng</h1>
        <table class="table">
            <tr>
                <th>Sản phẩm</th>
                <th>Đơn giá</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
                <th></th>
            </tr>
            <c:forEach var="i" items="${sessionScope.cart}">
                <tr>
                    <td>${i.product.productName}</td>
                    <td>${i.product.price} ₫</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/cart" method="post">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="id" value="${i.product.productId}">
                            <input type="number" name="quantity" value="${i.quantity}" min="1" style="width:70px">
                            <button class="btn secondary">Cập nhật</button>
                        </form>
                    </td>
                    <td>${i.subtotal} ₫</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/cart" method="post">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="id" value="${i.product.productId}">
                            <button class="btn danger">Xóa</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h2>Tổng: ${total} ₫</h2>
    </div>
</main>

</body>
</html>
