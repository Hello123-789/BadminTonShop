<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

    <main class="section">
        <div class="container">

            <form class="form"
                  action="${pageContext.request.contextPath}/admin/product/add"
                  method="post"
                  enctype="multipart/form-data">

                <h1>Thêm sản phẩm</h1>

                <c:if test="${not empty error}">
                    <div class="alert error">
                        ${error}
                    </div>
                </c:if>

                <label>Tên sản phẩm</label>
                <input name="productName" required>

                <label>Thương hiệu</label>
                <input name="brand" required>

                <label>Giá</label>
                <input type="number"
                       step="0.01"
                       name="price"
                       required>

                <label>Số lượng</label>
                <input type="number"
                       name="quantity"
                       min="0"
                       required>

                <label>Danh mục</label>
                <select name="categoryId" required>
                    <option value="">-- Chọn danh mục --</option>
                    <c:forEach var="c" items="${categories}"><option value="${c.cateId}">${c.cateName}</option></c:forEach>
                </select>

                <label>Ảnh sản phẩm</label>
                <input type="file"
                       name="image"
                       accept="image/*"
                       required>

                <small>
                    JPG, PNG, GIF, WEBP hoặc SVG, tối đa 5MB.
                </small>

                <label>Mô tả</label>
                <textarea name="description"
                          rows="5"></textarea>

                <button class="btn">
                    Lưu
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