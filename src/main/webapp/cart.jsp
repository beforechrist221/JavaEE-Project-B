<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>detail page</title>
    <style>
        @import "${ctx}/assets/bootstrap/css/bootstrap.css";
        @import "${ctx}/assets/styles/global.css";

        td img {
            height: 80px;
        }

        table td,
        table th {
            border: none;
        }

        table {
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>
<nav id="nav" class="navbar navbar-inverse"></nav>
<header class="jumbotron"></header>
<main class="container">
    <h1>购物车</h1>
    <section class="col-md-12">

        <table class="table bg-warning">
            <tr>
                <td width="10%"><input type="checkbox" name="" id=""> 全选</td>
                <th width="35%" colspan="2">商品信息</th>
                <th width="15%">单价</th>
                <th width="15%">数量</th>
                <th width="15%">小计</th>
                <th width="5%">操作</th>
            </tr>
        </table>
        <table class="table">
            <c:forEach var="product" items="${sessionScope.list}">
                <tr>
                    <td width="5%"><input type="checkbox" name=""></td>
                    <td width="15%" class="picture" title='${product.coverPicture}'></td>
                    <td width="20%">${product.title}</td>
                    <td width="15%">${product.price}</td>
                    <c:set var="cartNumber" value="0"/>
                    <c:forEach var="cart" items="${product.carts}">
                        <c:set var="cartNumber" value="${cartNumber + cart.number}"/>
                    </c:forEach>
                    <td width="15%">${cartNumber}</td>
                    <td width="15%">${product.price * cartNumber}</td>
                    <td width="5%"><a href="">删除</a></td>
                </tr>
            </c:forEach>
        </table>
        <table class="table bg-warning">
            <tr>
                <td width="10%"><input type="checkbox" name=""> 已选（<span></span>）</td>
                <th width="35%"><a href="">批量删除</a></th>
                <th width="15%">商品合计：<span></span></th>
                <th width="30%" colspan="2">应付总额：<span>￥ 1234</span></th>
                <th width="5%"><a href="">下单</a></th>
            </tr>
        </table>
    </section>
</main>
<footer class="jumbotron"></footer>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/assets/scripts/global.js"></script>
<script>
    $(function () {
        $.each($('.picture'), function (index, item) {
            var picture = $.parseJSON($(this).attr('title'))[0];
            $(this).append('<img src="${ctx}/pictures/cover/' + picture + '"/>')
        });
    });
</script>
</body>
</html>
