<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
</head>
<body>

<div class="p-3">
    <h2 class="text-center fw-bold">CUSTOMER LIST</h2>

    <div class=" row d-flex">
        <div class="col-lg-4 col-md-6 col-sm-12">
            <a href="/home">
                <button class="btn btn-success btn-sm my-2">
                    <span class="fa-solid fa-person-circle-plus text-light h5 my-auto me-1"></span> Back To Home
                </button>
            </a>
        </div>
        <div class="col-lg-8 col-md-6 col-sm-12">
            <a href="/customers">
                <button class="btn btn-success btn-sm my-2">
                    <span class="fa-solid fa-person-circle-plus text-light h5 my-auto me-1"></span> Back To List Customer
                </button>
            </a>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12">
            <a href="/customers?action=create">
                <button class="btn btn-success btn-sm my-2">
                    <span class="fa-solid fa-person-circle-plus text-light h5 my-auto me-1"></span> Add New Customer
                </button>
            </a>
        </div>
    </div>

    <form action="/customers" class="row g-3 d-fex justify-content-end">
        <input type="text" name="action" value="search" hidden>
        <div class="col-auto">
            <input type="text" name="searchName" class="form-control" placeholder="Input Name">
        </div>
        <div class="col-auto">
            <input type="text" name="searchAddress" class="form-control" placeholder="Input address">
        </div>
        <div class="col-auto">
            <input type="text" name="searchPhone" class="form-control" placeholder="Input phone">
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-outline-primary mb-3">Search</button>
        </div>
    </form>

    <table id="tableCustomer" class="table table-success table-striped" style="text-align: center" border="1">
        <thead>
        <tr class="text-center bg-primary">
            <th>STT</th>
            <th>Name</th>
            <th>Date Of Birth</th>
            <th>Gender</th>
            <th>Identity Card</th>
            <th>Phone Number</th>
            <th>Email</th>
            <th>Address</th>
            <th>Customer Type</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${customerList}" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${customer.getName()}</td>
                <td class="text-center">${customer.getDateOfBirth()}</td>
                <c:if test="${customer.getGender() == '1'}">
                    <td class="text-center">Male</td>
                </c:if>
                <c:if test="${customer.getGender() == '0'}">
                    <td class="text-center">Female</td>
                </c:if>
                <td class="text-center">${customer.getIdCard()}</td>
                <td class="text-center">${customer.getPhoneNumber()}</td>
                <td class="text-center">${customer.getEmail()}</td>
                <td class="text-center">${customer.getAddress()}</td>

                <c:forEach var="customerType" items="${customerTypeList}">
                    <c:if test="${customerType.getId() == customer.getCustomerTypeId()}">
                        <td class="text-center">${customerType.getName()}</td>
                    </c:if>
                </c:forEach>
                <td class="text-center">
                    <a href="/customers?action=update&id=${customer.getId()}">
                        <button type="button" class="btn btn-primary">Edit</button>
                    </a>
                </td>
                <td>
                    <!-- Button trigger modal -->
                    <button type="button" onclick="showInfo('${customer.getId()}','${customer.getName()}')"
                            class="btn btn-danger" data-bs-toggle="modal"
                            data-bs-target="#minhChau">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="modal fade " id="minhChau" tabindex="-1"
         aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog bg-light ">
            <form action="/customers">
                <div class="modal-content ">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Confirm Delete</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="text" id="deleteId" name="id" hidden>
                        <input type="text" value="delete" name="action" hidden>
                        Do you want to delete <strong class="text-danger" id="deleteName"></strong> ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                        </button>
                        <button type="submit" class="btn btn-warning">Delete</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script>
        function showInfo(id, name) {
            document.getElementById("deleteName").innerText = name;
            document.getElementById("deleteId").value = id;
        }
    </script>
</div>
<script src="../../bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
