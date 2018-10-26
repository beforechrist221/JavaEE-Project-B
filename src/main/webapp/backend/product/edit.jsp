<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/commons/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>product edit page</title>
    </head>
    <body>
        <h1>EDIT Product</h1>
        <form action="${ctx}/product/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.product.id}">
            TITLE: <input name="title" value="${sessionScope.product.title}"><br>
            DESC: <input name="desc" value="${sessionScope.product.desc}"><br>
            PRICE: <input name="price" value="${sessionScope.product.price}"><br>
            COVER PICTURE: <input name="coverPicture" value="${sessionScope.product.coverPicture}"><br>
            SLIDE PICTURES: <input name="slidePictures" value='${sessionScope.product.slidePictures}'><br>
            DETAIL PICTURES: <input name="detailPictures" value='${sessionScope.product.detailPictures}'><br>
            SPEC: <input name="spec" value="${sessionScope.product.spec}"><br>
            STOCK: <input name="stock" value="${sessionScope.product.stock}"><br>
            STATUS: <input name="status" value="${sessionScope.product.status}"><br>
            CREATE TIME: <input name="createTime" value="${sessionScope.product.createTime}"><br>
            UPDATE TIME: <input name="updateTime" value="${sessionScope.product.updateTime}"><br>
            <input type="submit" value="SAVE">
        </form>
    </body>
</html>