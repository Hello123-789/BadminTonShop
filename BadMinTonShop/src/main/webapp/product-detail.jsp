<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<header class="top">
    <div class="container nav">
        <a class="brand" href="${pageContext.request.contextPath}/home">BadmintonShop</a>
        <a href="${pageContext.request.contextPath}/cart">Giỏ hàng</a>
    </div>
</header>

<main class="section">
    <div class="container">
        <div class="card">
            <img class="product-img" style="max-width:500px"
                 src="${pageContext.request.contextPath}/images/${product.image}"
                 onerror="this.style.display='none'">
            <h1>${product.productName}</h1>
            <p>Thương hiệu: ${product.brand}</p>
            <p class="price">${product.price} ₫</p>
            <p>${product.description}</p>
            <p>Tồn kho: ${product.quantity}</p>
            <form action="${pageContext.request.contextPath}/cart" method="post">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="id" value="${product.productId}">
                <button class="btn">Thêm vào giỏ hàng</button>
            </form>
        </div>
    </div>
</main>

</body>
</html>
