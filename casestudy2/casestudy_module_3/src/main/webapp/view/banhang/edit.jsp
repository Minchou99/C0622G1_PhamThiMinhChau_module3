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
    <title>Title</title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
</head>
<body>
<table id='tableStudent' class="table table-striped table-bordered" style="width: 100%">
    <thead>
    <tr>
        <th>  a  </th>
        <th>  a  </th>
        <th>  a  </th>
    </tr>
    </thead>

            <tbody>
            <tr>
                <td>hghjkj</td>
                <td>hghjkj</td>
                <td>hghjkj</td>
            </tr>
            <tr>
                <td>hghjkj</td>
                <td>hghjkj</td>
                <td>hghjkj</td>
            </tr>
            </tbody>
</table>


<script src="../../bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function (){
        $('tableStudent').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
