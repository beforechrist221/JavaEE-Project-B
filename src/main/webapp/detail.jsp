<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>detail page</title>
    <style>
        @import "assets/bootstrap/css/bootstrap.css";
        @import "assets/styles/global.css";
        @import "assets/styles/lightslider.css";

        section article {
            border: 1px dashed #f00;
        }

        #image-gallery {
            background-color: #f4f4f4;
        }

        .lSGallery {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
<c:set var="p" value="${sessionScope.product}"/>
<nav id="nav" class="navbar navbar-inverse"></nav>
<header class="jumbotron"></header>
<main class="container">
    <section class="col-md-6">
        <article id="slider-pictures">
            <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
                <li data-thumb="pictures/slide/1654439170247131.png">
                    <img src="pictures/slide/1654439170247131.png" />
                </li>
                <li data-thumb="pictures/slide/1654439171280711.jpg">
                    <img src="pictures/slide/1654439171280711.jpg" />
                </li>
                <li data-thumb="pictures/slide/1654439172183524.jpg">
                    <img src="pictures/slide/1654439172183524.jpg" />
                </li>
                <li data-thumb="pictures/slide/1654439173166926.jpg">
                    <img src="pictures/slide/1654439173166926.jpg" />
                </li>
                <li data-thumb="pictures/slide/1654439173995234.jpg">
                    <img src="pictures/slide/1654439173995234.jpg" />
                </li>
            </ul>
        </article>
    </section>
    <section class="col-md-6">
        <article>
            <p class="title">${p.title}</p>
            <p class="desc">${p.desc}</p>
            <p class="price"><span class="price">￥${p.price}</span><span class="price">￥${p.originalPrice}</span></p>
            <p class="number">数量 </p>
            <p class="btn">
                <button class="btn btn-danger">立即购买</button>
                <button class="btn btn-info"><span class="glyphicon glyphicon-shopping-cart"></span> 加入购物车</button>
            </p>
        </article>
    </section>
    <section class="col-md-8">
        <article>detail</article>
    </section>
    <section class="col-md-4">
        <article>hot</article>
    </section>
</main>
<footer class="jumbotron"></footer>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/scripts/global.js"></script>
<script src="assets/scripts/lightslider.js"></script>
<script>
    $(document).ready(function() {
        $("#content-slider").lightSlider({
            loop:true,
            keyPress:true
        });
        $('#image-gallery').lightSlider({
            gallery:true,
            item:1,
            thumbItem:5,
            slideMargin: 0,
            // speed:500,
            auto:false,
            // loop:true,
            vertical: true,
            verticalHeight:430,
            onSliderLoad: function() {
                $('#image-gallery').removeClass('cS-hidden');
            }
        });
    });
</script>
</body>
</html>
