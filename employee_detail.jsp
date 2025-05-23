<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
    <title>Chi tiết nhân viên</title>
    <style>
        .section { margin-bottom: 20px; }
        .section h3 { margin-bottom: 10px; border-bottom: 1px solid #ccc; }
    </style>
</head>
<body>

<h2>Thông tin chi tiết nhân viên</h2>

<div class="section">
    <h3>Thông tin cơ bản</h3>
    <p><strong>Họ tên:</strong> ${employee.fullName}</p>
    <p><strong>Giới tính:</strong> ${employee.gender == 'M' ? 'Nam' : 'Nữ'}</p>
    <p><strong>Ngày sinh:</strong> ${employee.dob}</p>
    <p><strong>Email:</strong> ${employee.email}</p>
    <p><strong>Số điện thoại:</strong> ${employee.phone}</p>
    <p><strong>Địa chỉ:</strong> ${employee.address}</p>
    <p><strong>Phòng ban:</strong> ${employee.department.name}</p>
    <p><strong>Vị trí:</strong> ${employee.position}</p>
</div>

<div class="section">
    <h3>Hợp đồng hiện tại</h3>
    <c:if test="${not empty contract}">
        <p><strong>Loại hợp đồng:</strong> ${contract.contractType}</p>
        <p><strong>Từ:</strong> ${contract.startDate} đến ${contract.endDate}</p>
        <p><strong>Ghi chú:</strong> ${contract.note}</p>
    </c:if>
    <c:if test="${empty contract}">
        <p><i>Không có hợp đồng nào</i></p>
    </c:if>
</div>

<div class="section">
    <h3>Lương tháng gần nhất</h3>
    <c:if test="${not empty salary}">
        <p><strong>Tháng:</strong> ${salary.month}/${salary.year}</p>
        <p><strong>Lương cơ bản:</strong> ${salary.basicSalary}</p>
        <p><strong>Thưởng:</strong> ${salary.bonus}</p>
        <p><strong>Phụ cấp:</strong> ${salary.allowance}</p>
        <p><strong>Khấu trừ:</strong> ${salary.deduction}</p>
        <p><strong>Tổng lương:</strong> ${salary.totalSalary}</p>
    </c:if>
    <c:if test="${empty salary}">
        <p><i>Không có thông tin lương</i></p>
    </c:if>
</div>

<div class="section">
    <h3>Thưởng / Kỷ luật gần nhất</h3>
    <c:if test="${not empty records}">
        <ul>
            <c:forEach var="r" items="${records}">
                <li>${r.dateRecorded} - <strong>${r.type}</strong> - ${r.title}</li>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${empty records}">
        <p><i>Không có dữ liệu thưởng/phạt</i></p>
    </c:if>
</div>

<p><a href="../employees">← Quay lại danh sách</a></p>

</body>
</html>
