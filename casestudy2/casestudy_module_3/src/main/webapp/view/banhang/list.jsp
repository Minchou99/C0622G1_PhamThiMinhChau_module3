<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/10/2022
  Time: 3:50 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="customer_list.css">
</head>
<body>
<h1>List Customers</h1>
<header>
    <button type="button" class="btn btn-info">Thêm khách hàng</button>
</header>
<table id="tableCustomer" class="table table-striped table-bordered" style="width: 100%">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Date Of Birth</th>
        <th>Gender</th>
        <th>Identity Card </th>
        <th>Phone Number</th>
        <th>Email</th>
        <th>Address</th>
        <th>Customer Type ID</th>
        <th>Edit</th>
        <th>Delete</th>
        <th>Detail Information</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>${customer.getId()}</td>
        <td>${customer.getName()}</td>
        <td>${customer.getDateOfBirth()}</td>
        <td>${customer.getGender()}</td>
        <td>${customer.getIdentityCard()}</td>
        <td>${customer.getPhoneNumber()}</td>
        <td>${customer.getEmail()}</td>
        <td>${customer.getAddress()}</td>
        <td>${customer.getCustomerTypeId()}</td>
        <td>
            <a href="/customers?action=edit&id=${customer.getId()}">
                <button type="button" class="btn btn-primary">Edit</button>
            </a>
        </td>
        <td>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#minhChau${customer.id}">
                Delete
            </button>
            <div class="modal fade " id="minhChau${customer.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog ">
                    <div class="modal-content bg-dark">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Do you want to delete <strong class="text-danger">${product.name}?</strong> ?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <a href="customer?action=delete&id=${customer.id}" class="btn btn-danger">Delete</a>
                        </div>
                    </div>
                </div>
            </div>
        </td>
        <td>
            <a href="/customers?action=view&id=${customer.getId()}">
                <button type="button" class="btn btn-primary">View</button>
            </a>
        </td>
    </tr>
    </tbody>
</table>
<script src="../../bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function (){
        $('tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</script>
</body>
</html>
