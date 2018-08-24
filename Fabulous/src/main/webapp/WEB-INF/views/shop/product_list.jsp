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
<c:choose>
<c:when test="${sessionScope.admin_userid != null}">
<%@ include file="../include/admin_menu.jsp" %>
</c:when>
<c:otherwise>
<%@ include file="../include/menu.jsp" %>
</c:otherwise>
</c:choose>
<!-- 관리자에게만 상품등록 버튼 표시 -->
<div class="container" id="main">
   <div class="col-md-10 col-md-offset-1">
      <div class="panel panel-default">
      	<table align="right">
      	<tr>
      		<td>
      			<c:if test="${sessionScope.admin_userid != null}">
					<button type="button" id="btnAdd" class="btn btn-success"
					onclick="location.href='${path}/shop/product/write.do'">상품등록</button>
				</c:if>
      		</td>
      	</tr>
		</table>
          <table class="table table-hover">
              <thead>
                <tr>
                    <th>상품코드</th> <th>&nbsp;</th> <th>상품명</th> <th>가격</th><th></th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="row" items="${list}">
                <tr>
                    <th scope="row">${row.product_id}</th>
                    <td><img src="${path}/images/${row.picture_url}" width="150px" height="150px"></td>
                    <td><a href="${path}/shop/product/detail/${row.product_id}">${row.product_name}</a>
                    <c:if test="${sessionScope.admin_userid != null }">
					<a href="${path}/shop/product/edit/${row.product_id}">
					<button type="button" id="btnAdd" class="btn btn-success">편집</button>
					</a>
					</c:if></td>
                    <td><fmt:formatNumber value="${row.price}" pattern="#,###"/></td>
                </tr>
               </c:forEach>
              </tbody>
          </table>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>

</body>
</html>