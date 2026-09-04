<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property="title">Badminton Shop</sitemesh:write></title>

    <!-- Bootstrap 5 CSS & Icons CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <sitemesh:write property="head"/>
</head>
<body class="d-flex flex-column min-vh-100 bg-light">

    <!-- Header -->
    <%@ include file="/common/web/header.jsp" %>

    <!-- Main Body Content -->
    <main class="container my-4 flex-grow-1">
        <sitemesh:write property="body"/>
    </main>

    <!-- Footer -->
    <%@ include file="/common/web/footer.jsp" %>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
