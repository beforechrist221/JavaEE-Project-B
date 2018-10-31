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
            background: #f4f4f4 no-repeat center center;
            height: 245px;
        }

        article:hover {
            opacity: .8;
        }

        .avatar {
            height: 20px;
        }

        p.t {
            margin-top: 5px;
            font-weight: bolder;
        }

        p.t:hover {
            color: #2aabd2;
        }

        p.p b {
            color: #f00;
            margin-right: 20px;
        }

        p.p s {
            color: #ddd;
            text-decoration: line-through;
        }

        p.d {
            color: #ddd;
        }

        p.t,
        p.p,
        p.d {
            text-align: center;
        }

        article,
        p.t {
            cursor: pointer;
        }

    </style>
</head>
<body>
<nav id="nav" class="index navbar navbar-inverse"></nav>
<header class="index jumbotron"></header>
<main class="container">
    <section class="col-md-3">
        <article></article>
        <p class="t"></p>
        <p class="p"><b></b><s></s></p>
        <p class="d"></p>
    </section>
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
                console.log($.parseJSON(data[0].coverPicture)[0]);
                console.log(data[0].title);
                console.log(data[0].price);
                console.log(data[0].originalPrice);
                console.log(data[0].desc);

                $('article').css('background-image', 'url(pictures/cover/' + $.parseJSON(data[0].coverPicture)[0] + ')');
                $('p.t').text(data[0].title);
                $('p.p b').text(data[0].price);
                $('p.p s').text(data[0].originalPrice);
                $('p.d').text(data[0].desc);
            }
        });
    });
</script>
</body>
</html>
