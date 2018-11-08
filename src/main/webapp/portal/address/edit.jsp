<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/commons/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>address edit page</title>
    </head>
    <body>
        <h1>EDIT Address</h1>
        <form action="${ctx}/address/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.address.id}">
            PROVINCE: <input name="province" value="${sessionScope.address.province}"><br>
            CITY: <input name="city" value="${sessionScope.address.city}"><br>
            AREA: <input name="district" value="${sessionScope.address.area}"><br>
            TOWN: <input name="town" value="${sessionScope.address.town}"><br>
            DETAIL: <input name="detail" value="${sessionScope.address.detail}"><br>
            NAME: <input name="name" value="${sessionScope.address.name}"><br>
            MOBILE: <input name="mobile" value="${sessionScope.address.mobile}"><br>
            STATUS: <input type="checkbox" name="status" value="${sessionScope.address.status}" checked="checked"><br>
            <input type="submit" value="SAVE">
        </form>
    </body>
</html>