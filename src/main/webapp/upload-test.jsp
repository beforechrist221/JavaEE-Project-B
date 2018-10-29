<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/29/2018
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp"%>
<html>
<head>
    <title>upload test page</title>
</head>
<body>
<h1>upload</h1>
<form action="${ctx}/upload/test" method="post" enctype="multipart/form-data">
    <input type="file" name="photoFile">
    <input type="submit" value="Upload">
</form>
</body>
</html>
