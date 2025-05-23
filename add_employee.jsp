<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thêm / Sửa nhân viên</title>
</head>
<body>
<h2>${employee != null ? 'Sửa' : 'Thêm'} Nhân viên</h2>

<form action="../employees" method="post">
    <c:if test="${employee != null}">
        <input type="hidden" name="id" value="${employee.id}" />
    </c:if>

    Họ tên: <input name="fullName" value="${employee.fullName}" required><br>

    Giới tính:
    <input type="radio" name="gender" value="M" ${employee.gender == 'M' || employee == null ? 'checked' : ''}> Nam
    <input type="radio" name="gender" value="F" ${employee.gender == 'F' ? 'checked' : ''}> Nữ<br>

    Ngày sinh: <input type="date" name="dob" value="${employee.dob}"><br>

    Email: <input name="email" value="${employee.email}" required><br>
    SĐT: <input name="phone" value="${employee.phone}" required><br>
    Địa chỉ: <textarea name="address">${employee.address}</textarea><br>
    Ngày vào làm: <input type="date" name="hireDate" value="${employee.hireDate}"><br>

    Vị trí: <input name="position" value="${employee.position}" required><br>

    Phòng ban:
    <select name="departmentId" required>
        <c:forEach var="d" items="${departments}">
            <option value="${d.id}" ${employee != null && d.id == employee.department.id ? 'selected' : ''}>
                ${d.name}
            </option>
        </c:forEach>
    </select><br>

    <button>Lưu</button>
    <a href="../employees">Hủy</a>
</form>
</body>
</html>
