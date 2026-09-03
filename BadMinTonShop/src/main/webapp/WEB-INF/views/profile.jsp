<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thông tin cá nhân</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 40px;
        }

        .profile-container {
            width: 500px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input {
            width: 100%;
            box-sizing: border-box;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[readonly] {
            background: #eee;
        }

        button {
            width: 100%;
            padding: 11px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
        }

        .success {
            padding: 10px;
            margin-bottom: 15px;
            background: #d4edda;
            color: #155724;
            border-radius: 5px;
        }

        .error {
            padding: 10px;
            margin-bottom: 15px;
            background: #f8d7da;
            color: #721c24;
            border-radius: 5px;
        }
    </style>
</head>

<body>

<div class="profile-container">

    <h2>Thông tin cá nhân</h2>

    <% if ("1".equals(request.getParameter("success"))) { %>
        <div class="success">
            Cập nhật thông tin thành công!
        </div>
    <% } %>

    <% if (request.getAttribute("error") != null) { %>
        <div class="error">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <form action="${pageContext.request.contextPath}/profile"
      method="post"
      enctype="multipart/form-data">

        <div class="form-group">
            <label>Tên đăng nhập</label>

            <input type="text"
                   value="${user.username}"
                   readonly>
        </div>

        <div class="form-group">
            <label>Họ và tên</label>

            <input type="text"
                   name="fullName"
                   value="${user.fullName}"
                   required>
        </div>

        <div class="form-group">
            <label>Số điện thoại</label>

            <input type="text"
                   name="phone"
                   value="${user.phone}">
        </div>
        
       <c:if test="${not empty user.image}">
    <div class="form-group">
        <label>Ảnh hiện tại</label>

        <img src="${pageContext.request.contextPath}/${user.image}"
             width="120"
             height="120"
             style="object-fit: cover; border-radius: 8px;">
    </div>
		</c:if>

    <input type="file"
           name="image"
           accept="image/*">
		</div>

        <button type="submit">
            Cập nhật thông tin
        </button>

    </form>

</div>

</body>
</html>