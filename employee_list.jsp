<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
    <title>Danh sách nhân viên</title>
    <style>
    	
    	a {text-decoration: none ; color: black;}
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid gray; padding: 8px; }
        th { background: #f2f2f2; }
        button{padding: 10px;}
    </style>
</head>
<body>
<h2>Quản lý Nhân viên</h2>

<!-- Tìm kiếm -->
<form action="../employees" method="get">
    <input name="keyword" placeholder="Nhập tên hoặc mã nhân viên..." value="${param.keyword}">
    Phòng ban:
    <select name="departmentId">
        <option value="">Tất cả</option>
        <c:forEach var="d" items="${departments}">
            <option value="${d.id}" ${d.id == param.departmentId ? 'selected' : ''}>${d.name}</option>
        </c:forEach>
    </select>
    <button>Tìm</button>
    <button> <a href="../employees">Xóa lọc</a></button>
   
</form>

<br>
<a href="add_employee.jsp"><button>Thêm nhân viên</button></a>



<!-- Danh sách -->
<table>
    <tr>
        <th>Mã NV</th>
        <th>Họ tên</th>
        <th>Giới tính</th>
        <th>Email</th>
        <th>Vị trí</th>
        <th>Phòng ban</th>
        <th>Hành động</th>
    </tr>
    <c:forEach var="e" items="${list}">
        <tr>
            <td>${e.id}</td>
            <td><a href="../employees?action=detail&id=${e.id}">${e.fullName}</a></td>
            <td>${e.gender == 'M' ? 'Nam' : 'Nữ'}</td>
            <td>${e.email}</td>
            <td>${e.position}</td>
            <td>${e.department.name}</td>
            <td>
                <a href="../employees?action=edit&id=${e.id}">Sửa</a> |
                <a href="../employees?action=delete&id=${e.id}" onclick="return confirm('Xóa nhân viên này?')">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
