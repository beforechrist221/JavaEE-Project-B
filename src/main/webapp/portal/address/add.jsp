<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="/commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>address add page</title>
</head>
<body>
<h1>ADD Address</h1>
<form action="${ctx}/address/create" method="post">
    <input name="province" placeholder="PROVINCE" value="北京市"><br>
    <input name="city" placeholder="CITY" value="北京市"><br>
    <input name="district" placeholder="DISTRICT" value="东城区"><br>
    <input name="town" placeholder="TOWN" value="xxx 街道"><br>
    <input name="detail" placeholder="DETAIL" value="xxx 小区1单元1101"><br>
    <input name="name" placeholder="NAME"><br>
    <input name="mobile" placeholder="MOBILE" value="18612345678"><br>
    设为默认地址 <input type="checkbox" name="status" value="0" checked="checked"><br>
    <input type="submit" value="ADD">
</form>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script>
    $(function () {
        $('input:checkbox').on('click', function () {
            if ($(this).prop('checked')) {
                $(this).val(0);
                console.log($(this).attr('value'));
            } else {
                $(this).val(1);
                console.log($(this).attr('value'));
            }
        });
    });
</script>
</body>
</html>