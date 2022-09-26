<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 24/09/2022
  Time: 4:29 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Information</title>
  </head>
  <body>
  <h2>Product Discount Calculator</h2>
  <form method="post" action="/convert">
    <label>Product Description: </label> <br/><br/>
    <input type="text" name="text" /> <br/><br/>
    <label>List Price: </label><br/><br/>
    <input type="text" name="price" placeholder="Enter product's price: "/> <br/><br/>
    <label>Discount Percent: </label><br/><br/>
    <input type = "text" name="discount" placeholder="Enter product's discount: "/> <br/><br/>
    <input type = "submit" id = "submit" />
  </form>
  </body>
</html>
