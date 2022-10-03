<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 02/10/2022
  Time: 11:42 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View User</title>
</head>
<body>
<h1>User details</h1>
<p>
    <a href="/user">Back to user list</a>
</p>
<table>
    <tr>
        <td>Name: </td>
        <td>${requestScope["user"].getName()}</td>
    </tr>
    <tr>
        <td>Email: </td>
        <td>${requestScope["user"].getEmail()}</td>
    </tr>
    <tr>
        <td>Country: </td>
        <td>${requestScope["user"].getCountry()}</td>
    </tr>
</table>
</body>
</html>
