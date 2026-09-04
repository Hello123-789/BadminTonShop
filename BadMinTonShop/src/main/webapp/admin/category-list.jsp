<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Quản lý danh mục</title>

</head>

<body>

    <h1>Quản lý danh mục</h1>

    <table border="1">

        <tr>

            <th>ID</th>
            <th>Tên danh mục</th>
            <th>Hình ảnh</th>
            <th>Hành động</th>

        </tr>

        <c:forEach
            var="category"
            items="${categories}">

            <tr>

                <td>
                    ${category.cateId}
                </td>

                <td>
                    ${category.cateName}
                </td>

                <td>
                    ${category.icons}
                </td>

                <td>

                    <a href="#">
                        Sửa
                    </a>

                    |

                    <a href="#">
                        Xóa
                    </a>

                </td>

            </tr>

        </c:forEach>

    </table>

</body>

</html>
