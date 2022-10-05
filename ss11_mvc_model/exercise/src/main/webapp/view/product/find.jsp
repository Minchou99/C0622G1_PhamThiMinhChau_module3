<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 01/10/2022
  Time: 10:07 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tìm kiếm sản phẩm</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Tìm kiếm sản phẩm</h1>
<p>
    <a href="/products">Quay lại Danh sách sản phẩm</a>
</p>
<form method="post">
    <fieldset>
        <legend>Tìm theo:</legend>
        <table>
            <tr>
                <td><input type="radio" name="option" value="id" onclick="openInput(this.value)">ID:
                </td>
                <td><input type="text" name="id" id="id" disabled="disabled">
                </td>
            </tr>
            <tr>
                <td><input type="radio" name="option" value="name" onclick="openInput(this.value)">Tên:
                </td>
                <td><input type="text" name="name" id="name" disabled="disabled"></br>
                </td>
            </tr>
            <tr>
                <td><input type="radio" name="option" value="price" onclick="openInput(this.value)">Giá:
                </td>
                <td><input type="number" name="price" id="price" disabled="disabled">
                </td>
            </tr>
            <tr>
                <td><input type="radio" name="option" value="producer" onclick="openInput(this.value)">Nhà sản xuất:
                </td>
                <td><input type="text" name="producer" id="producer" disabled="disabled">
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="Find product"></td>
            </tr>
        </table>

    </fieldset>
</form>
<h3>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</h3>
<table border="1">
    <tr>
        <td>Tên</td>
        <td>Giá</td>
        <td>Mô tả</td>
        <td>Nhà sản xuất</td>
        <td>Chỉnh sửa</td>
        <td>Xóa</td>
    </tr>
    <c:forEach items="${products}" var="product">
        <tr>
            <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescribe()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/products?action=edit&id=${product.getId()}">Chỉnh sửa</a></td>
            <td><a href="/products?action=delete&id=${product.getId()}">Xóa</a></td>
        </tr>
    </c:forEach>
</table>
</body>
<script>
    let inputId = ["id", "name", "minPrice", "maxPrice", "producer"];
    function openInput(value) {
        for (let element of inputId) {
            document.getElementById(element).disabled = !element.includes(value);
        }
    }
</script>
</html>