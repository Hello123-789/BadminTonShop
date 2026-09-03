<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sửa sản phẩm</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

    <main class="section">
        <div class="container">

            <form class="form"
                  action="${pageContext.request.contextPath}/admin/product/edit"
                  method="post"
                  enctype="multipart/form-data">

                <h1>Sửa sản phẩm</h1>

                <c:if test="${not empty error}">
                    <div class="alert error">
                        ${error}
                    </div>
                </c:if>

                <input type="hidden"
                       name="productId"
                       value="${product.productId}">

                <label>Tên sản phẩm</label>
                <input name="productName"
                       value="${product.productName}"
                       required>

                <label>Thương hiệu</label>
                <input name="brand"
                       value="${product.brand}"
                       required>

                <label>Giá</label>
                <input type="number"
                       step="0.01"
                       name="price"
                       value="${product.price}"
                       required>

                <label>Số lượng</label>
                <input type="number"
                       name="quantity"
                       value="${product.quantity}"
                       min="0"
                       required>

                <label>Ảnh mới</label>
                <input type="file"
                       name="image"
                       accept="image/*">

                <c:if test="${not empty product.image}">

                    <p>Ảnh hiện tại:</p>

                    <img class="preview-img"
                         src="${pageContext.request.contextPath}/images/${product.image}"
                         alt="Ảnh sản phẩm">

                </c:if>

                <label>Mô tả</label>

                <textarea name="description"
                          rows="5">${product.description}</textarea>

                <button class="btn">
                    Cập nhật
                </button>

                <a class="btn secondary"
                   href="${pageContext.request.contextPath}/admin/product/list">
                    Hủy
                </a>

            </form>

        </div>
    </main>

</body>
</html>