<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 29/09/2022
  Time: 3:32 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css">
</head>
<style>
    img {
        width: 300px;
        height: 400px;
    }
</style>
<body>
<table class="table table-striped d-flex justify-content-center">
    <tr>
        <th colspan="4" style="text-align: center;">Danh sách khách hàng</th>
    </tr>
    <tr style="text-align: center;">
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach items='${requestScope["customerList"]}' var="customer">
        <tr>
            <td>demo</td>
            <td>${customer.getName()}</td>
            <td>${customer.getDateOfBirth()}</td>
            <td>${customer.getAddress()}</td>
            <td><img src="${customer.getImage()}"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

