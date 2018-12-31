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
<main class="container"></main>
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
                $.each(data, function (index, item) {
                    $('main').append('<section id="' + item.id + '" class="col-md-3"><article></article><p class="t"></p><p class="p"><b></b><s></s></p></section>');
                    var section = $('#' + item.id);
                    section.find('article').css('background-image', 'url(${img}' + item.coverPath + item.coverPicture + ')');
                    section.find('p.t').text(item.title);
                    section.find('p.p b').text(item.price);
                    section.find('p.p s').text(item.originalPrice);
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


