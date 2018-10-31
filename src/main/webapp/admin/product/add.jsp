<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="/commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>product add page</title>
    <style>
        span {
            color: #fff;
            background: #900;
            display: inline-block;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h1>ADD Product</h1>
<form action="${ctx}/product/create" method="post" enctype="multipart/form-data">
    <input name="title" placeholder="TITLE"><br>
    <input name="desc" placeholder="DESC" value="desc..."><br>
    <input name="price" placeholder="PRICE" value="123.45"><br>
    <input name="originalPrice" placeholder="ORIGINAL PRICE" value="321.45"><br>
    <%----%>
    封面图片 <input type="file" name="coverPictureFile"><br>
    <hr>
    滑动图片组 <br>
    <input type="file" name="slidePictureFiles"><br>
    <input type="file" name="slidePictureFiles"><br>
    <input type="file" name="slidePictureFiles"><br>
    <input type="file" name="slidePictureFiles"><br>
    <input type="file" name="slidePictureFiles"><br>
    <hr>
    详情图片组 <br>
    <input type="file" name="detailPictureFiles"><br>
    <span>Add file</span>
    <br>
    <%----%>
    <input name="spec" placeholder="SPEC" value="spec..."><br>
    <input name="stock" placeholder="STOCK" value="10000"><br>
    STATUS
    <select name="status">
        <option value="0">上架</option>
        <option value="1">暂存</option>
    </select>
    <br>
    CATEGORY
    <select name="categoryId">
        <c:forEach var="category" items="${sessionScope.categories}">
            <option disabled="disabled">${category.title}</option>
            <c:if test="${fn:length(category.categories) > 0}">
                <c:forEach var="subCategory" items="${category.categories}">
                    <option value="${subCategory.id}">${subCategory.title}</option>
                </c:forEach>
            </c:if>
        </c:forEach>
    </select>
    <br>
    <input type="submit" value="ADD">
</form>
<script src="../../assets/scripts/jquery.min.js"></script>
<script>
    $(function () {
        $('span').on('click', function () {
            $('<input type="file" name="detailPictureFiles"><br>').insertBefore($(this));
        })
    });
</script>
</body>
</html>