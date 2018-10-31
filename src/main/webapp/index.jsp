<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp" %>
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
            height: 300px;
        }

        .avatar {
            height: 20px;
        }
    </style>
</head>
<body>
<nav id="nav" class="index navbar navbar-inverse"></nav>
<header class="index jumbotron"></header>
<main class="container">
    <div class="row">
        <section class="col-md-4">
            <article></article>
        </section>
        <section class="col-md-4">
            <article></article>
        </section>
        <section class="col-md-4">
            <article></article>
        </section>
    </div>
</main>
<footer class="index jumbotron"></footer>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/scripts/global.js"></script>
<script>
    $(function () {
        $.ajax({
            url: '${ctx}/product/index',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                console.log(data);
            }
        });
    });
</script>
</body>
</html>
