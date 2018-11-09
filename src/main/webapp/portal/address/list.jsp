<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../../commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>地址列表</title>
    <style>
        @import "${ctx}/assets/bootstrap/css/bootstrap.css";
        @import "${ctx}/assets/styles/global.css";
    </style>
</head>
<body>
<nav id="nav" class="navbar navbar-inverse"></nav>
<header class="jumbotron"></header>
<main class="container">
    <section class="col-md-2">left</section>
    <section class="col-md-10">
        <article>
            <c:choose>
                <c:when test="${fn:length(sessionScope.list) eq 0}">
                    <p class="text-danger">您还没有收货地址</p>
                    <a class="btn btn-success" href="${ctx}/portal/address/add.jsp">新建地址</a>
                </c:when>
                <c:otherwise>
                    <a class="btn btn-success" href="${ctx}/portal/address/add.jsp">新建地址</a>
                    <hr/>
                    <h1>地址列表</h1>
                    <hr/>
                    <table class="table table-striped table-bordered table-hover">
                        <tr>
                            <th class="text-center">序号</th>
                            <th class="text-center">收货人</th>
                            <th class="text-center">地址</th>
                            <th class="text-center">联系方式</th>
                            <th class="text-center" colspan="2">操作</th>
                            <th class="text-center">默认地址</th>
                        </tr>
                        <c:forEach var="address" items="${sessionScope.list}" varStatus="vs">
                            <tr>
                                <td>${vs.count}</td>
                                <td>${address.name}</td>
                                <td>
                                        ${address.province}
                                        ${address.city}
                                        ${address.area}
                                        ${address.town}
                                        ${address.detail}
                                </td>
                                <td>${address.mobile}</td>
                                <td><a href="${ctx}/address/queryById/${address.id}">编辑</a></td>
                                <td><a class="delete" href="${ctx }/address/remove/${address.id}"
                                       onclick="return del()">删除</a>
                                    <c:if test="${address.status eq 1}">
                                <td>
                                    <button class="btn btn-warning btn-sm">默认地址</button>
                                </td>
                                </c:if>
                                <c:if test="${address.status eq 0}">
                                    <td><a href="${ctx}/address/setDefault/${address.id}">设为默认地址</a></td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </table>
                </c:otherwise>
            </c:choose>
        </article>
    </section>
</main>
<footer class="jumbotron"></footer>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/assets/scripts/global.js"></script>
</body>
</html>
