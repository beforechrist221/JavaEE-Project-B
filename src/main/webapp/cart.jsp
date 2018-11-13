<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>detail page</title>
    <style>
        @import "${ctx}/assets/bootstrap/css/bootstrap.css";
        @import "${ctx}/assets/styles/global.css";
    </style>
</head>
<body>
<nav id="nav" class="navbar navbar-inverse"></nav>
<header class="jumbotron"></header>
<main class="container">
    <h1>购物车</h1>
    <table class="table table-bordered table-striped table-hover">
        <tr>
            <th>picture</th>
            <th>title</th>
            <th>price</th>
            <th>number</th>
        </tr>
        <c:forEach var="product" items="${sessionScope.list}">
            <tr>
                <td>${product.coverPicture}</td>
                <td>${product.title}</td>
                <td>${product.price}</td>
                <%--<td>${product.carts[0].number}</td>--%>
            </tr>
        </c:forEach>
    </table>
</main>
<footer class="jumbotron"></footer>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/assets/scripts/global.js"></script>
</body>
</html>
