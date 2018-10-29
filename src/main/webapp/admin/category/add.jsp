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
            <input name="desc" placeholder="DESC" value="desc..."><br>
            <input name="parentId" placeholder="PARENTID"><br>
            <select name="status">
                <option value="0">启用</option>
                <option value="1">关闭</option>
            </select>
            <br>
            <input type="submit" value="ADD">
        </form>
    </body>
</html>