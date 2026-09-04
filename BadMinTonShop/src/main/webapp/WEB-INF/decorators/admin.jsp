<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property="title">Trang Quản Trị - Badminton Shop</sitemesh:write></title>

    <!-- Bootstrap 5 CSS & Icons CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <sitemesh:write property="head"/>
</head>
<body class="d-flex flex-column min-vh-100 bg-light">

    <!-- Admin Header -->
    <%@ include file="/common/admin/header.jsp" %>

    <!-- Admin Main Content Area with Sidebar -->
    <div class="container-fluid flex-grow-1">
        <div class="row">
            <div class="col-md-3 col-lg-2 mb-4">
                <%@ include file="/common/admin/sidebar.jsp" %>
            </div>
            <div class="col-md-9 col-lg-10 mb-4">
                <div class="card shadow-sm p-4 bg-white">
                    <sitemesh:write property="body"/>
                </div>
            </div>
        </div>
    </div>

    <!-- Admin Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-auto border-top border-secondary">
        <small>&copy; 2026 Badminton Shop Admin Panel. All Rights Reserved.</small>
    </footer>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
