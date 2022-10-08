<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 06/10/2022
  Time: 2:33 CH
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
    <link rel="stylesheet" href="/view/casestudy_css/furuma.css">
</head>
<body>
<header>
    <a><img src="https://static.topcv.vn/company_logos/oruz4IPeY3cyRu9HaWwRFrSdfWfDnw60_1635916800____08c8e444e64ab28b2cef44fb69347361.png"
            style="height: 100px; width: 150px"></a>
    <h3 style="float: right; margin-top: 50px">Phạm Thị Minh Châu</h3>
</header>
<div class="menu">
    <nav class="navbar navbar-expand-lg navbar-light" style="background: #046056">
        <div class="container-fluid">
            <a class="navbar-brand" href="/home">Home</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/employees">Employee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/customers">Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/services">Service</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/bookings">Booking</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/contracts">Contract</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>

<div class="col">
    <div class="col-left">
        <div class="col-left-1">
            <h5 style="margin-left: 90px">Giới thiệu</h5>
            <div class="card" style="width: 18rem;">
                <img src="/view/casestudy_css/furama.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <p class="card-text">Hướng ra bãi biển Đà Nẵng trải dài cát trắng, Furama Resort Đà Nẵng là cửa ngõ
                        đến với 3 di sản văn hoá thế giới: Hội An , Mỹ Sơn và Huế với 196 phòng
                        hạng sang cùng với 70 căn biệt thự .</p>
                </div>
            </div>
            <br><br>
            <div class="card" style="width: 18rem;">
                <img src="/view/casestudy_css/beach.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <p class="card-text">Ẩm thực tại khu nghỉ dưỡng là trải nghiệm kết hợp giữa các món ăn Việt Nam,
                        châu Á, Ý và châu Âu cùng các món bít tết nhập khẩu hảo hạng. </p>
                </div>
            </div>
            <br><br>
            <div class="card" style="width: 18rem;">
                <img src="/view/casestudy_css/room.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <p class="card-text">Được trang trí với tông màu dịu nhẹ kết hợp với những đồ thủ công trang trí
                        mang đậm hơi thở văn hóa Chăm-pa của địa phương.</p>
                </div>
            </div>

        </div>
    </div>

    <div class="col-right">
        <center><h5>Trải Nghiệm Furama</h5></center>
        <iframe width="860" height="415" src="https://www.youtube.com/embed/mPM5VsVQ3hw" title="YouTube video player"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen></iframe>
        <p>Nằm tại vị trí đắc địa gần trung tâm Đà Nẵng và là nơi kết nối quốc tế thuận tiện đến Singapore, Bangkok,
            Xiêm Riệp, Kuala Lumpur, Đài Loan, Tokyo, Osaka, Busan, Seoul, Tokyo, Osaka và Hồng Kông – Ma Cao, Trung
            Quốc bao gồm: Bắc Kinh, Thượng Hải, Hàng Châu, Quảng Châu, Thành Đô bằng các chuyến bay trực tiếp, khu nghỉ
            dưỡng Furama Đà Nẵng là điểm đến lý tưởng cho các đại lý du lịch, doanh nghiệp, công ty tổ chức sự kiện.
        </p>
        <br><br>
        <center><h5>Đà Nẵng 2022 - Furama Villas Resort</h5></center>
        <iframe width="860" height="415" src="https://www.youtube.com/embed/IOOcj2DKd9M" title="YouTube video player"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen></iframe>
        <p>Nằm tại vị trí đắc địa gần trung tâm Đà Nẵng và là nơi kết nối quốc tế thuận tiện đến Singapore, Bangkok,
            Xiêm Riệp, Kuala Lumpur, Đài Loan, Tokyo, Osaka, Busan, Seoul, Tokyo, Osaka và Hồng Kông – Ma Cao, Trung
            Quốc bao gồm: Bắc Kinh, Thượng Hải, Hàng Châu, Quảng Châu, Thành Đô bằng các chuyến bay trực tiếp, khu nghỉ
            dưỡng Furama Đà Nẵng là điểm đến lý tưởng cho các đại lý du lịch, doanh nghiệp, công ty tổ chức sự kiện.
        </p>
    </div>
</div>


<footer style="text-align: center;">
    <p>Address:103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District, Danang City, Vietnam</p>
    <p> Tel.: 84-236-3847 333/888 * Fax: 84-236-3847 666</p>
    <p> Email: reservation@furamavietnam.com</p>
    </div>
</footer>
</body>
</html>
