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
        table tr td input {
            background-color: lightblue;
        }

        table tr td select {
            background-color: lightblue;
        }

    </style>
</head>

<body>
<div>
    <h2 class="text-center">Update Employee</h2>
    <a class="btn btn-primary text-center" href="/home">Back Home</a>
    <a class="btn btn-primary text-center" href="/employees">Back List Employees</a>

    <div class="d-flex justify-content-center">
        <form method="post">
            <table class="table table-success table-striped" style="text-align: left;width: 600px;" border="1">
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
                    <td><input type="text" name="id_card" value="${employee.getIdCard()}"/></td>
                </tr>
                <tr>
                    <td>
                        <pre>Salary:  </pre>
                    </td>
                    <td><input type="text" name="salary" value="${employee.getSalary2()}"/></td>
                </tr>
                <tr>
                    <td>
                        <pre>Phone Number:</pre>
                    </td>
                    <td><input type="text" name="phone_number" value="${employee.getPhoneNumber()}"/></td>
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
                        <select name="position_id">
                            <c:forEach var="positionList" items="${positionList}">
                                <option value="${positionList.getId()}">${positionList.getName()}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <pre>Education:</pre>
                    </td>
                    <td><select name="education_degree_id">
                        <c:forEach var="edl" items="${educationDegreeList}">
                            <option value="${edl.getId()}">${edl.getName()}</option>
                        </c:forEach>
                    </select></td>
                </tr>
                <tr>
                    <td>
                        <pre>Division:</pre>
                    </td>
                    <td><select name="division_id">
                        <c:forEach var="divisionList" items="${divisionList}">
                            <option value="${divisionList.getId()}">${divisionList.getName()}</option>
                        </c:forEach>
                    </select></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Update"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>

<script src="../../bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
</body>
</html>