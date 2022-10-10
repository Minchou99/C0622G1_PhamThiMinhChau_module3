<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid px-0      vh-100" >
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <li class="nav-item dropdown" style="list-style: none">
                <a class="nav-link active dropdown-toggle btn " href="#" id="navbarDropdown" role="button"
                   data-bs-toggle="dropdown" aria-expanded="false">
                    Add Facility
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="/facilities?action=create&type=room">Room</a></li>
                    <li><a class="dropdown-item" href="/facilities?action=create&type=house">House</a></li>
                    <li><a class="dropdown-item" href="/facilities?action=create&type=villa">Villa</a></li>
                </ul>
            </li>
        </div>
    </nav>

    <table id="facilityTable" class="table table-dark table-striped table-bordered">
        <thead>
        <tr>
            <td>ID</td>
            <th>Name</th>
            <th>Area</th>
            <th>Cost</th>
            <th>Max people</th>
            <th>Standard</th>
            <th>Description</th>
            <th>Pool area</th>
            <th>Number of Floors</th>
            <th>Facility Free</th>
            <th>Rent type</th>
            <th>Facility type</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <c:forEach var="facility" items="${facilityList}">
            <tr>
                <td><c:out value="${facility.facilityId}"/></td>
                <td><c:out value="${facility.facilityName}"/></td>
                <td><c:out value="${facility.area}"/></td>
                <td><c:out value="${facility.cost}"/></td>
                <td><c:out value="${facility.maxPeople}"/></td>
                <td><c:out value="${facility.standardRoom}"/></td>
                <td><c:out value="${facility.descriptionOtherConvenience}"/></td>
                <td><c:out value="${facility.poolArea}"/></td>
                <td><c:out value="${facility.numberOfFloors}"/></td>
                <td><c:out value="${facility.facilityFree}"/></td>
                <td><c:out value="${facility.rentTypeId}"/></td>
                <td><c:out value="${facility.facilityTypeId}"/></td>

                <td>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                            data-bs-target="#edit${facility.facilityId}">
                        Edit
                    </button>
                    <div class="modal fade " id="edit${facility.facilityId}" tabindex="-1"
                         aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog ">
                            <div class="modal-content bg-dark">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel_edit">Modal title</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Bạn có muốn sửa <strong class="text-danger">${facility.facilityName}</strong>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                    </button>
                                    <a href="customer?action=edit&id=${facility.facilityId}"
                                       class="btn btn-danger">Edit</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
                <td>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                            data-bs-target="#delete${facility.facilityId}}">
                        Delete
                    </button>
                    <div class="modal fade " id="delete${facility.facilityId}}" tabindex="-1"
                         aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog ">
                            <div class="modal-content bg-dark">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel_delete">Modal title</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Bạn có muốn xóa <strong class="text-danger">${facility.facilityName}</strong>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                    </button>
                                    <a href="customer?action=delete&id=${facility.facilityId}}"
                                       class="btn btn-danger">Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>