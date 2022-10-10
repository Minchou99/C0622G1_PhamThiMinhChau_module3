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

<div>
    <h2 class="text-center">Create Employee</h2>
    <a class="btn btn-primary text-center" href="/home">Back Home</a>
    <a class="btn btn-primary text-center" href="/employees">Back List Employees</a>

    <c:if test="${mess!=null}">
        <c:if test="${!check}">
            <div class="justify-content-center d-flex">
                <div class="alert alert-success alert-dismissible fade show w-50 text-center">
                     ${mess}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>

        <c:if test="${check}">
            <div class="justify-content-center d-flex">
                <div class="alert alert-danger alert-dismissible fade show w-50 text-center">
                    ${mess}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>
    </c:if>

    <div class="d-flex justify-content-center">
        <form action="/employees?action=create" method="post">
            <table class="table table-success table-striped" style="text-align: left;width: 600px;" border="1">
                <tr>
                    <td>
                        <pre>Name:</pre>
                    </td>
                    <td><input type="text" name="name" placeholder="Input name" /></td>
                </tr>
                <tr>
                    <td>
                        <pre>Birthday:</pre>
                    </td>
                    <td><input type="date" name="birthday" /></td>
                </tr>
                <tr>
                    <td>
                        <pre>ID Card:  </pre>
                    </td>
                    <td><input type="text" name="id_card" placeholder="Input Id card"/></td>
                </tr>
                <tr>
                    <td>
                        <pre>Salary:  </pre>
                    </td>
                    <td><input type="text" name="salary" placeholder="Input salary"/></td>
                </tr>
                <tr>
                    <td>
                        <pre>Phone Number:</pre>
                    </td>
                    <td><input type="text" name="phone_number" placeholder="Input Phone number"/></td>
                </tr>
                <tr>
                    <td>
                        <pre>Email:</pre>
                    </td>
                    <td><input type="text" name="email" placeholder="Input Email"/></td>
                </tr>
                <tr>
                    <td>
                        <pre>Address:</pre>
                    </td>
                    <td><input type="text" name="address" placeholder="Input Address"/></td>
                </tr>
                <tr>
                    <td>
                        <pre>Position:</pre>
                    </td>
                    <td>
                        <select name="positionId">
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
                    <td><select name="educationId">
                        <c:forEach var="edl" items="${educationDegreeList}">
                            <option value="${edl.getId()}">${edl.getName()}</option>
                        </c:forEach>
                    </select></td>
                </tr>
                <tr>
                    <td>
                        <pre>Division:</pre>
                    </td>
                    <td><select name="divisionId">
                        <c:forEach var="divisionList" items="${divisionList}">
                            <option value="${divisionList.getId()}">${divisionList.getName()}</option>
                        </c:forEach>
                    </select></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Save"/></td>
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
