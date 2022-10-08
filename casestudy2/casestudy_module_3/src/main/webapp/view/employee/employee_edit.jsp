<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 06/10/2022
  Time: 2:30 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
    <style>
        table tr td input{
            background-color: lightblue;
        }
        table tr td select {
            background-color: lightblue;
        }

    </style>
</head>

<body>
<center>
    <h2>Edit Employee</h2>
    <form method="post" >
        <table class="table table-success table-striped" style="text-align: left;width: 600px;" border="1" >
            <input type="hidden" name="id" value="${employee.getId()}">
            <tr>
                <td>
                    <pre>Name:</pre>
                </td>
                <td><input type="text" name="name" value="${employee.getName()}"/></td>
            </tr>
            <tr>
                <td>
                    <pre>Birthday:</pre>
                </td>
                <td><input type="date" name="birthday" value="${employee.getDateOfBirth()}"/></td>
            </tr>
            <tr>
                <td>
                    <pre>ID Card:  </pre>
                </td>
                <td><input type="text" name="id-card" value="${employee.getIdCard()}"/></td>
            </tr>
            <tr>
                <td>
                    <pre>Salary:  </pre>
                </td>
                <td><input type="text" name="salary" value="${employee.getSalary()}"/></td>
            </tr>
            <tr>
                <td>
                    <pre>Phone Number:</pre>
                </td>
                <td><input type="text" name="phonenumber" value="${employee.getPhoneNumber()}"/></td>
            </tr>
            <tr>
                <td>
                    <pre>Email:</pre>
                </td>
                <td><input type="text" name="email" value="${employee.getEmail()}"/></td>
            </tr>
            <tr>
                <td>
                    <pre>Address:</pre>
                </td>
                <td><input type="text" name="address" value="${employee.getAddress()}"/></td>
            </tr>
            <tr>
                <td>
                    <pre>Position:</pre>
                </td>
                <td>
                    <select name="positionId">
                        <option value="1">Lễ Tân</option>
                        <option value="2">Phục Vụ</option>
                        <option value="3">Chuyên Viên</option>
                        <option value="4">Giám sát</option>
                        <option value="5">Quản lí</option>
                        <option value="6">Giám Đốc</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <pre>Education:</pre>
                </td>
                <td><select name="educationId">
                    <option value="1">Trung Cấp</option>
                    <option value="2">Cao Đẳng</option>
                    <option value="3">Đại Học</option>
                    <option value="4">Sau Đại Học</option>
                </select></td>
            </tr>
            <tr>
                <td>
                    <pre>Division:</pre>
                </td>
                <td><select name="divisionId">
                    <option value="1">Sale-Marketing</option>
                    <option value="2">Hành chính</option>
                    <option value="3">Phục vụ</option>
                    <option value="4">Quản lý</option>
                </select></td>
            </tr>
            <tr>
                <td>
                    <pre>Username:</pre>
                </td>
                <td><input type="text" name="username" value="${employee.getUsername()}"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"/></td>
            </tr>
        </table>
    </form>
    <a class="btn btn-primary" href="/employees">Back List Employees</a>

</center>
<script src="../../bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
</body>
</html>