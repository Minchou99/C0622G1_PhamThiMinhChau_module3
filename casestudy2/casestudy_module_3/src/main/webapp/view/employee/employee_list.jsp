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
</head>
<body>
<center><h1>List Emloyee</h1></center>
<header>
    <center>
        <button type="button" class="btn btn-info">Add New Emloyee</button>
    </center>
</header>
<table id="tableEmloyee" class="table table-success table-striped" style="text-align: center" border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Date Of Birth</th>
        <th>Identity Card</th>
        <th>Salary</th>
        <th>Phone Number</th>
        <th>Email</th>
        <th>Address</th>
        <th>Position ID</th>
        <th>Education Degree ID</th>
        <th>Division ID</th>
        <th>User Name</th>
        <th>Edit</th>
        <th>Delete</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach var="employee" items="${employeeList}">
        <tr>
            <td>${employee.getId()}</td>
            <td>${employee.getName()}</td>
            <td>${employee.getDateOfBirth()}</td>
            <td>${employee.getIdCard()}</td>
            <td>${employee.getSalary2()}</td>
            <td>${employee.getPhoneNumber()}</td>
            <td>${employee.getEmail()}</td>
            <td>${employee.getAddress()}</td>

            <td>
                <c:if test="${employee.getPositionId()=='1'}">
                    Lễ Tân
                </c:if>
                <c:if test="${employee.getPositionId()=='2'}">
                    Phục Vụ
                </c:if>
                <c:if test="${employee.getPositionId()=='3'}">
                    Chuyên Viên
                </c:if>
                <c:if test="${employee.getPositionId()=='4'}">
                    Giám sát
                </c:if>
                <c:if test="${employee.getPositionId()=='5'}">
                    Quản lí
                </c:if>
                <c:if test="${employee.getPositionId()=='6'}">
                    Giám Đốc
                </c:if>
            </td>

            <td>
                <c:if test="${employee.getEducationDegreeId()=='1'}">
                    Trung Cấp
                </c:if>
                <c:if test="${employee.getEducationDegreeId()=='2'}">
                    Cao Đẳng
                </c:if>
                <c:if test="${employee.getEducationDegreeId()=='3'}">
                    Đại Học
                </c:if>
                <c:if test="${employee.getEducationDegreeId()=='4'}">
                    Sau Đại Học
                </c:if>
            </td>

            <td>
                <c:if test="${employee.getDivisionId()=='1'}">
                    Sale-Marketing
                </c:if>
                <c:if test="${employee.getDivisionId()=='2'}">
                    Hành chính
                </c:if>
                <c:if test="${employee.getDivisionId()=='3'}">
                    Phục vụ
                </c:if>
                <c:if test="${employee.getDivisionId()=='4'}">
                    Quản lý
                </c:if>
            </td>
            <td>${employee.getUsername()}</td>
            <td>
                <a href="/employees?action=edit&id=${employee.getId()}">
                    <button type="button" class="btn btn-primary">Edit</button>
                </a>
            </td>
            <td>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                        data-bs-target="#minhChau${employee.id}">
                    Delete
                </button>
                <div class="modal fade " id="minhChau${employee.id}" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog ">
                        <div class="modal-content bg-dark">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Do you want to delete <strong class="text-danger">${employee.name}?</strong> ?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <a href="employees?action=delete&id=${employee.id}" class="btn btn-danger">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script src="../../bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableEmloyee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
