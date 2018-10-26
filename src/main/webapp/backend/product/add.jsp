<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/commons/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>product add page</title>
    </head>
    <body>
        <h1>ADD Product</h1>
        <form action="${ctx}/product/create" method="post">
            <input name="title" placeholder="TITLE"><br>
            <input name="desc" placeholder="DESC"><br>
            <input name="price" placeholder="PRICE"><br>
            <input name="coverPicture" placeholder="COVERPICTURE"><br>
            <input name="slidePictures" placeholder="SLIDEPICTURES"><br>
            <input name="detailPictures" placeholder="DETAILPICTURES"><br>
            <input name="spec" placeholder="SPEC"><br>
            <input name="stock" placeholder="STOCK"><br>
            <input name="status" placeholder="STATUS"><br>
            <input name="createTime" placeholder="CREATETIME"><br>
            <input name="updateTime" placeholder="UPDATETIME"><br>
            <input type="submit" value="ADD">
        </form>
    </body>
</html>