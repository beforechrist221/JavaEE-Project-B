<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index page</title>
    <style>
        @import "../assets/bootstrap/css/bootstrap.css";
        @import "../assets/styles/global.css";

        article {
            background: #ddd;
            height: 800px;
        }

        .avatar {
            height: 20px;
        }

        #avatar {
            height: 100px;
        }

    </style>
</head>
<body>
<nav id="nav" class="navbar navbar-inverse"></nav>
<header class="jumbotron"></header>
<main class="container">
    <h1>Home page</h1>
    <img id="avatar" class="img-circle" src="/avatar/${sessionScope.user.userInfo.avatar}" alt="${sessionScope.user.userInfo.username}">
    <h3>${sessionScope.user.email}</h3>
</main>
<footer class="jumbotron"></footer>
<script src="../assets/scripts/jquery.min.js"></script>
<script src="../assets/bootstrap/js/bootstrap.js"></script>
<script src="../assets/scripts/global.js"></script>
</body>
</html>
