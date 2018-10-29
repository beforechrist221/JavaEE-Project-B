<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/commons/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>category edit page</title>
    </head>
    <body>
        <h1>EDIT Category</h1>
        <form action="${ctx}/category/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.category.id}">
            TITLE: <input name="title" value="${sessionScope.category.title}"><br>
            DESC: <input name="desc" value="${sessionScope.category.desc}"><br>
            PARENTID: <input name="parentId" value="${sessionScope.category.parentId}"><br>
            STATUS: <input name="status" value="${sessionScope.category.status}"><br>
            CREATETIME: <input name="createTime" value="${sessionScope.category.createTime}"><br>
            UPDATETIME: <input name="updateTime" value="${sessionScope.category.updateTime}"><br>
            <input type="submit" value="SAVE">
        </form>
    </body>
</html>