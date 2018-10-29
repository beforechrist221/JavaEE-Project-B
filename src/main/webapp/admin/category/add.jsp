<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/commons/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>category add page</title>
    </head>
    <body>
        <h1>ADD Category</h1>
        <form action="${ctx}/category/create" method="post">
            <input name="title" placeholder="TITLE"><br>
            <input name="desc" placeholder="DESC"><br>
            <input name="parentId" placeholder="PARENTID"><br>
            <input name="status" placeholder="STATUS"><br>
            <input name="createTime" placeholder="CREATETIME"><br>
            <input name="updateTime" placeholder="UPDATETIME"><br>
            <input type="submit" value="ADD">
        </form>
    </body>
</html>