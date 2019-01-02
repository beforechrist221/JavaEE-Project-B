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
    <h1>{{message}}</h1>
</main>
<footer class="jumbotron"></footer>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/assets/scripts/global.js"></script>
<script src="${ctx}/assets/scripts/vue.min.js"></script>
<script>
    var vm = new Vue({
        el: 'h1',
        data: {
            message: 'Hello, Vue!'
        }
    });
</script>
</body>
</html>
