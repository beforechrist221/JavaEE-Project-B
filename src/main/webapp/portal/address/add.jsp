<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../commons/inc.jsp" %>
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
    <section class="col-md-2">
        <article>left</article>
    </section>
    <section class="col-md-10">
        <article>
            <h1>添加地址</h1>
            <form action="${ctx}/address/create" method="post">
                <div id="address" class="citys">
                    <select name="province"></select>
                    <select name="city"></select>
                    <select name="area"></select>
                    <select name="town"></select>
                </div>
                <div class="input-group col-md-8 col-md-offset-2">
                    <label for="detail">详细地址</label>
                    <input id="detail" class="form-control" name="detail" value="xxx 小区1单元1101">
                </div>
                <div class="input-group col-md-8 col-md-offset-2">
                    <label for="name">收货人</label>
                    <input id="name" class="form-control" name="name" placeholder="NAME">
                </div>
                <div class="input-group col-md-8 col-md-offset-2">
                    <label for="mobile">联系方式</label>
                    <input id="mobile" class="form-control" name="mobile" placeholder="MOBILE" value="18612345678">
                </div>
                <div class="input-group col-md-8 col-md-offset-2">
                    <input id="status" class="checkbox" type="checkbox" name="status" value="0" checked="checked"><br>
                    <label for="status">设为默认地址</label>
                </div>
                <button class="btn btn-success btn-sm" type="submit">添加</button>
            </form>
        </article>
    </section>
</main>
<footer class="jumbotron"></footer>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/assets/scripts/global.js"></script>
<script src="${ctx}/assets/scripts/jquery.cities.js"></script>
<script>
    var $town = $('#address select[name="town"]');
    var townFormat = function (info) {
        $town.hide().empty();
        if (info['code'] % 1e4 && info['code'] < 7e5) {	//是否为“区”且不是港澳台地区
            $.ajax({
                url: '${ctx}/assets/data/town/' + info['code'] + '.json',
                dataType: 'json',
                success: function (town) {
                    $town.show();
                    for (i in town) {
                        $town.append('<option value="' + i + '">' + town[i] + '</option>');
                    }
                }
            });
        }
    };
    $('#address').citys({
        // province: '福建',
        // city: '厦门',
        // area: '思明',
        onChange: function (info) {
            townFormat(info);
        }
    }, function (api) {
        var info = api.getInfo();
        townFormat(info);
    });
</script>
</body>
</html>
