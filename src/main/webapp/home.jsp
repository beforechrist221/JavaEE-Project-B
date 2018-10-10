<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index page</title>
    <style>
        @import "assets/bootstrap/css/bootstrap.css";
        @import "assets/styles/global.css";

        article {
            background: #ddd;
            height: 800px;
        }

        #avatar {
            height: 30px;
        }

    </style>
</head>
<body>
<c:if test="${sessionScope.user eq null}"><c:redirect url="index.jsp"/></c:if>
<nav id="nav" class="navbar navbar-inverse"></nav>
<header class="jumbotron"></header>
<main class="container">
    <h1>Home page</h1>
    <img class="img-rounded" id="avatar" src="avatar/${sessionScope.user.avatar}" alt="${sessionScope.user.username}">
    ${sessionScope.user.username}
</main>
<footer class="jumbotron"></footer>
<script src="assets/scripts/jquery-3.3.1.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/scripts/global.js"></script>
</body>
</html>
