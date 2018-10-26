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
            <input name="desc" placeholder="DESC" value="desc..."><br>
            <input name="price" placeholder="PRICE" value="123.45"><br>
            <input name="coverPicture" placeholder="COVER PICTURE" value="cover.jpg"><br>
            <input name="slidePictures" placeholder="SLIDE PICTURES" value='["1.jpg", "2.jpg"]'><br>
            <input name="detailPictures" placeholder="DETAIL PICTURES" value='["3.jpg", "4.jpg"]'><br>
            <input name="spec" placeholder="SPEC" value="spec..."><br>
            <input name="stock" placeholder="STOCK" value="stock..."><br>
            <input name="status" placeholder="STATUS"><br>
            <input name="createTime" placeholder="CREATE TIME"><br>
            <input name="updateTime" placeholder="UPDATE TIME"><br>
            <input type="submit" value="ADD">
        </form>
    </body>
</html>