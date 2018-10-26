<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/commons/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>product list page</title>
        <script>
            function del() { return confirm('REMOVE?'); }
        </script>
    </head>
    <body>
        <c:import url="add.jsp"/>
        <hr/>
        <h1>LIST Product</h1>
        <hr/>
        <table border="1">
            <tr>
                <th>COUNT</th>
                <th>TITLE</th>
                <th>DESC</th>
                <th>PRICE</th>
                <th>COVERPICTURE</th>
                <th>SLIDEPICTURES</th>
                <th>DETAILPICTURES</th>
                <th>SPEC</th>
                <th>STOCK</th>
                <th>STATUS</th>
                <th>CREATETIME</th>
                <th>UPDATETIME</th>
                <th colspan="2">OPERATION</th>
            </tr>
            <c:forEach var="product" items="${sessionScope.list}" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${product.title}</td>
                <td>${product.desc}</td>
                <td>${product.price}</td>
                <td>${product.coverPicture}</td>
                <td>${product.slidePictures}</td>
                <td>${product.detailPictures}</td>
                <td>${product.spec}</td>
                <td>${product.stock}</td>
                <td>${product.status}</td>
                <td>${product.createTime}</td>
                <td>${product.updateTime}</td>
                <td><a href="${ctx}/product/queryById/${product.id}">EDIT</a></td>
                <td><a class="delete" href="${ctx }/product/remove/${product.id}" onclick="return del()">REMOVE</a></td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>