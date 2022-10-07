<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 06/10/2022
  Time: 2:31 CH
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
<form method="post">
    <fieldset style="width: 30%">
        <legend>Add New Facility</legend>
        <table id='tableFacility' class="table table-striped table-bordered" style="width: 100%">
            <tr>
                <td>
                    <pre>Name:</pre>
                </td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>
                    <pre>Area:</pre>
                </td>
                <td><input type="text" name="area"></td>
            </tr>
            <tr>
                <td>
                    <pre>Cost:</pre>
                </td>
                <td><input type="text" name="cost"></td>
            </tr>
            <tr>
                <td>
                    <pre>Max People:</pre>
                </td>
                <td><input type="text" name="maxPeople"></td>
            </tr>
            <tr>
                <td>
                    <pre>Standard Room:</pre>
                </td>
                <td><input type="text" name="standardRoom"></td>
            </tr>
            <tr>
                <td>
                    <pre>Description Other Convenience:  </pre>
                </td>
                <td><input type="text" name="descriptionOtherConvenience"></td>
            </tr>
            <tr>
                <td>
                    <pre>Pool Area:  </pre>
                </td>
                <td><input type="text" name="poolArea"></td>
            </tr>
            <tr>
                <td>
                    <pre>Number Of Floors:</pre>
                </td>
                <td><input type="text" name="numberOfFloors"></td>
            </tr>
            <tr>
                <td>
                    <pre>Facility Free:</pre>
                </td>
                <td><input type="text" name="facilityFree"></td>
            </tr>
            <tr>
                <td><a><input type="submit" value="Save"/></a></td>
                <td><a href="/facilities"><button>Back List Facility</button></a></td>
            </tr>
        </table>
    </fieldset>
</form>
<script src="../../bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function (){
        $('tableFacility').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
