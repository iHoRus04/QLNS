<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="true" %>
<%
    model.User user = (model.User) session.getAttribute("user");
    if (user == null || user.getRole() != model.User.Role.admin) {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Trang quản trị hệ thống (ADMIN)</h2>
	<p>Xin chào, ${user.username}!</p>
</body>
</html>