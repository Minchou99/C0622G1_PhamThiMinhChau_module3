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
    <h2 class="text-center">Create New Customer</h2>
    <a class="btn btn-primary text-center" href="/home">Back Home</a>
    <a class="btn btn-primary text-center" href="/customers">Back List Customer</a>

    <c:if test="${mess!=null}">
        <c:if test="${!check}">
            <div class="justify-content-center d-flex">
                <div class="alert alert-success alert-dismissible fade show w-50 text-center">
                        ${mess}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>
    </c:if>

    <div class="d-flex justify-content-center">
        <form action="/customers?action=create" method="post">
            <div>
                <label>Name:</label>
                <div>
                    <input type="text" name="name" value="${customer.name}" placeholder="Input name"/>
                </div>
                <c:if test="${map.get('empty_name') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('empty_name')}"/>
                    </div>
                </c:if>
                <c:if test="${map.get('invalid_name') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('invalid_name')}"/>
                    </div>
                </c:if>
            </div>
            <div>
                <label>Birthday:</label>
                <div>
                    <td><input type="date" name="birthday"/>
                </div>
                <c:if test="${map.get('empty_birthday') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('empty_birthday')}"/>
                    </div>
                </c:if>
            </div>
            <div>
                <label>Gender:</label>
                <div>
                    <input type="radio" value="1" name="gender" checked> Male
                    <input type="radio" value="0" name="gender"> Female
                </div>
            </div>
            <div>
                <label>ID Card: </label>
                <div>
                    <input type="text" name="id_card" placeholder="Input Id card" value="${customer.idCard}"/>
                </div>
                <c:if test="${map.get('empty_IdCard') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('empty_IdCard')}"/>
                    </div>
                </c:if>
                <c:if test="${map.get('invalid_IdCard') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('invalid_IdCard')}"/>
                    </div>
                </c:if>
            </div>
            <div>
                <label>Phone Number:</label>
                <div>
                    <input type="text" name="phone_number" value="${customer.phoneNumber}"
                           placeholder="Input Phone number"/>
                </div>
                <c:if test="${map.get('empty_phone') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('empty_phone')}"/>
                    </div>
                </c:if>
                <c:if test="${map.get('invalid_phone') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('invalid_phone')}"/>
                    </div>
                </c:if>
            </div>
            <div>
                <label>Email:</label>
                <div>
                    <input type="text" name="email" value="${customer.email}" placeholder="Input Email"/>
                </div>
                <c:if test="${map.get('empty_email') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('empty_email')}"/>
                    </div>
                </c:if>
                <c:if test="${map.get('invalid_email') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('invalid_email')}"/>
                    </div>
                </c:if>
            </div>
            <div>
                <label>Address:</label>
                <div>
                    <input type="text" name="address" placeholder="Input Address"/>
                </div>
                <c:if test="${map.get('empty_address') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('empty_address')}"/>
                    </div>
                </c:if>
            </div>
            <div>
                <label>Customer Type:</label>
                <div>
                    <select name="customer_type_id">
                        <c:forEach var="customerTypeList" items="${customerTypeList}">
                            <option value="${customerTypeList.getId()}">${customerTypeList.getName()}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div>
                <input type="submit" value="Save"/>
            </div>
        </form>
    </div>
</div>
<script src="../../bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
</body>
</html>
