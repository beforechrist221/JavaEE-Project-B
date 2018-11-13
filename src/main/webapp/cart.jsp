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
            background: #f4f4f4;
            border: 1px solid #eaeaea;
        }

        table td,
        table th {
            border: none;
        }

        table {
            border: 1px solid #ddd;
        }

        #table-bottom {
            height: 80px;
        }

        #table-bottom th {
            line-height: 80px;
            text-align: center;
        }

        #table-bottom th:first-of-type {
            text-align: left;
        }

        #order {
            color: #fff;
            background: #b4a078;
            cursor: pointer;
        }

        #order:hover {
            opacity: .8;
        }

        table#table-data > tbody > tr.bg-warning > td {
            line-height: 80px;
        }

        #table-data {
            border: none;
            border-collapse: separate;
            border-spacing: 0 10px;
        }

        #table-data tr.tr-data td {
            border-bottom: 1px solid #ddd;
        }

        #table-data tr.tr-data td:first-of-type {
            border-left: 1px solid #ddd;
        }

        #table-data tr.tr-data td:last-of-type {
            border-right: 1px solid #ddd;
        }
    </style>
</head>
<body>
<nav id="nav" class="navbar navbar-inverse"></nav>
<header class="jumbotron"></header>
<main class="container">
    <h1>购物车</h1>
    <section class="col-md-12">

        <table class="table table-striped">
            <tr>
                <td width="10%"><input type="checkbox" class="all" checked="checked"> 全选</td>
                <th class="text-center" width="35%" colspan="2">商品信息</th>
                <th class="text-center" width="15%">单价</th>
                <th class="text-center" width="10%">数量</th>
                <th class="text-center" width="10%">小计</th>
                <th class="text-center" width="15%">操作</th>
            </tr>
        </table>
        <table id="table-data" class="table">
            <c:set var="totalPrice" value="0"/>
            <c:set var="totalDiscount" value="0"/>
            <c:forEach var="product" items="${sessionScope.list}">
                <tr class="bg-warning tr-data">
                    <c:set var="cartNumber" value="0"/>
                    <c:forEach var="cart" items="${product.carts}">
                        <c:set var="cartNumber" value="${cartNumber + cart.number}"/>
                    </c:forEach>
                    <td width="10%">
                        <input type="checkbox" name="product" checked="checked"
                               data-number="${cartNumber}"
                               data-price="${product.price}"
                               data-originalPrice="${product.originalPrice}">
                    </td>
                    <td width="15%" class="picture" title='${product.coverPicture}'></td>
                    <td class="text-center" width="20%">${product.title}</td>
                    <td class="text-center" width="15%">
                        <span><fmt:formatNumber value="${product.price}" type="currency"/></span>
                        <span><fmt:formatNumber value="${product.originalPrice}" type="currency"/></span>
                    </td>
                    <td class="text-center" width="10%">${cartNumber}</td>
                    <td class="text-center" width="10%"><fmt:formatNumber value="${product.price * cartNumber}"
                                                                          type="currency"/></td>
                    <td class="text-center" width="15%"><a class="text-warning" href="">删除</a></td>
                </tr>
                <c:set var="totalPrice" value="${totalPrice + product.originalPrice * cartNumber}"/>
                <c:set var="totalDiscount"
                       value="${totalDiscount + (product.originalPrice - product.price) * cartNumber}"/>
            </c:forEach>
        </table>
        <table id="table-bottom" class="table table-striped">
            <tr>
                <th width="10%"><input type="checkbox" class="all" style="text-align: left;" checked="checked"> 已选<span
                        id="selected-number"></span></th>
                <th width="15%"><a class="text-warning" href="">批量删除</a></th>
                <th width="35%" style="line-height: 30px;">
                    <p>商品合计：<span id="total-price"><fmt:formatNumber value="${totalPrice}" type="currency"/></span></p>
                    <p>活动优惠：<span id="total-discount">-<fmt:formatNumber value="${totalDiscount}"
                                                                         type="currency"/></span></p>
                </th>
                <th width="20%" colspan="2">应付总额：<span id="pay"><fmt:formatNumber value="${totalPrice - totalDiscount}"
                                                                                  type="currency"/></span></th>
                <th id="order" width="15%">下单</th>
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

        $('.all').on('click', function () {
            if ($(this).prop('checked')) {
                $('input:checkbox').prop('checked', true);
            } else {
                $('input:checkbox').prop('checked', false);
            }
            $('#selected-number').text('（' + getNumber() + '）');
            $('#total-price').text(getTotalPrice());
            <%--$('#total-price').html('<fmt:formatNumber value="'++'" type="currency"/>');--%>
            $('#total-discount').text(getTotalDiscount());
            $('#pay').text(getTotalPrice() - getTotalDiscount());
        });

        $('input:checkbox[name=product]').on('click', function () {
            if ($(this).prop('checked')) {
                $(this).prop('checked', true);
            } else {
                $(this).prop('checked', false);
            }
            $('#selected-number').text('（' + getNumber() + '）');
            $('#total-price').text(getTotalPrice());
            $('#total-discount').text(getTotalDiscount());
            $('#pay').text(getTotalPrice() - getTotalDiscount());
        });


        function getNumber() {
            var number = 0;
            $.each($('input:checkbox[name=product]'), function (index, item) {
                if ($(this).prop('checked')) {
                    number += parseInt($(this).attr('data-number'));
                }
            });
            return number;
        }

        function getTotalPrice() {
            var totalPrice = 0;
            $.each($('input:checkbox[name=product]'), function (index, item) {
                if ($(this).prop('checked')) {
                    totalPrice += parseInt($(this).attr('data-originalPrice')) * parseInt($(this).attr('data-number'));
                }
            });
            return totalPrice;
        }

        function getTotalDiscount() {
            var totalDiscount = 0;
            $.each($('input:checkbox[name=product]'), function (index, item) {
                if ($(this).prop('checked')) {
                    totalDiscount += (parseInt($(this).attr('data-originalPrice')) - parseInt($(this).attr('data-price'))) * parseInt($(this).attr('data-number'));
                }
            });
            return totalDiscount;
        }
    });
</script>
</body>
</html>
