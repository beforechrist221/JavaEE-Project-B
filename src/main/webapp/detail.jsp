<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp" %>
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
            <ul id="image-gallery" class="gallery list-unstyled cS-hidden" title='${p.slidePictures}'></ul>
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
    $(document).ready(function () {

        var imageGallery = $('#image-gallery');
        var slidePictures = imageGallery.attr('title');
        var slidePicturesArray = slidePictures.replace(/[\[\]"]/g, '').split(',');

        $.each(slidePicturesArray, function (index, item) {
            var list = '<li data-thumb="pictures/slide/' + item + '"><img src="pictures/slide/' + item + '"/></li>';
            imageGallery.append(list);
        });

        $("#content-slider").lightSlider({
            loop: true,
            keyPress: true
        });

        imageGallery.lightSlider({
            gallery: true,
            item: 1,
            thumbItem: 5,
            slideMargin: 0,
            auto: false,
            loop: true,
            vertical: true,
            verticalHeight: 430,
            onSliderLoad: function () {
                $('#image-gallery').removeClass('cS-hidden');
            }
        });
    });
</script>
</body>
</html>
