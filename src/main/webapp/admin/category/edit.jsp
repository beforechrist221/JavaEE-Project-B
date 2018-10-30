<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="/commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>category edit page</title>
</head>
<body>
<h1>EDIT Category ${sessionScope.category.parentId}</h1>
<form action="${ctx}/category/modify" method="post">
    <input type="hidden" name="id" value="${sessionScope.category.id}">
    TITLE: <input name="title" value="${sessionScope.category.title}"><br>
    DESC: <input name="desc" value="${sessionScope.category.desc}"><br>
    <p>一级类目</p>
    <c:forEach var="category" items="${sessionScope.categories}">
        <c:if test="${category.id eq sessionScope.category.parentId}">
            ${category.title} <input type="radio" name="parentId" value="${category.id}"
                                                    checked="checked">
        </c:if>
        <c:if test="${category.id ne sessionScope.category.parentId}">
            ${category.title} <input type="radio" name="parentId" value="${category.id}">
        </c:if>
    </c:forEach>
    <br>
    <p>状态</p>
    <select name="status">
        <c:if test="${sessionScope.category.status eq 0}">
            <option value="0" selected="selected">启用</option>
            <option value="1">关闭</option>
        </c:if>
        <c:if test="${sessionScope.category.status eq 1}">
            <option value="0">启用</option>
            <option value="1" selected="selected">关闭</option>
        </c:if>
    </select>
    <br>
    CREATE TIME: ${sessionScope.category.createTime}<br>
    <input type="submit" value="SAVE">
</form>
</body>
</html>