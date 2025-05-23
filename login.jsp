<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập hệ thống</title>
</head>
<body>
<h2>Đăng nhập hệ thống</h2>
<form action="login" method="post">
    Tên đăng nhập: <input name="username"><br>
    Mật khẩu: <input type="password" name="password"><br>
    <button>Đăng nhập</button>
</form>

<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>
</body>
</html>
