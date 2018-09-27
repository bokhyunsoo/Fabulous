<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<br><br><br><br><br><br><br>
<table align="right">
<tr><td>
<c:if test="${message == 'success'}">
		${sessionScope.admin_name}
		(${sessionScope.admin_userid})님 환영합니다.
</c:if>
</td></tr>
</table>

<%@ include file="../include/footer.jsp" %>
</body>
</html>