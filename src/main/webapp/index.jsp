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
            background-size: cover;
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
            white-space: nowrap;
            width: 100%;
            overflow: hidden;
            text-overflow: ellipsis;
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
    <section id="3857" class="col-md-3">
        <article style="background-image: url(${img}{{product.coverPath}}{{product.coverPicture}});"></article>
        <p class="t">{{product.title}}</p>
        <p class="p"><b>{{product.price}}</b><s>{{product.originalPrice}}</s></p>
    </section>
</main>
<footer class="index jumbotron"></footer>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/scripts/global.js"></script>
<script src="assets/scripts/vue.min.js"></script>
<script>
    $(function () {
        $.ajax({
            url: '${ctx}/product/index',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                product = data[1];
                console.log(product);
                vm = new Vue({
                    el: 'section',
                    data: {
                        product: product
                    }
                });
            }
        });

        // future element: jQuery
        $(document).on('click', 'article, p.t', function () {
            var id = $(this).parent('section').attr('id');
            // window.location.href = 'detail.jsp?id=' + id;
            window.location.href = '${ctx}/product/detail/' + id;
        });
    });
</script>
</body>
</html>


