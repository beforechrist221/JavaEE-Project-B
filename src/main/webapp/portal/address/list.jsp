<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/commons/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>address list page</title>
        <script>
            function del() { return confirm('REMOVE?'); }
        </script>
    </head>
    <body>
        <c:import url="add.jsp"/>
        <hr/>
        <h1>LIST Address</h1>
        <hr/>
        <table border="1">
            <tr>
                <th>COUNT</th>
                <th>PROVINCE</th>
                <th>CITY</th>
                <th>DISTRICT</th>
                <th>TOWN</th>
                <th>DETAIL</th>
                <th>NAME</th>
                <th>MOBILE</th>
                <th>STATUS</th>
                <th>USERID</th>
                <th colspan="2">OPERATION</th>
            </tr>
            <c:forEach var="address" items="${sessionScope.list}" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${address.province}</td>
                <td>${address.city}</td>
                <td>${address.district}</td>
                <td>${address.town}</td>
                <td>${address.detail}</td>
                <td>${address.name}</td>
                <td>${address.mobile}</td>
                <td>${address.status}</td>
                <td>${address.userId}</td>
                <td><a href="${ctx}/address/queryById/${address.id}">EDIT</a></td>
                <td><a class="delete" href="${ctx }/address/remove/${address.id}" onclick="return del()">REMOVE</a></td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>