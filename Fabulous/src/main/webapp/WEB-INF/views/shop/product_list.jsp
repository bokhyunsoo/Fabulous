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
<%@ include file="../include/menu.jsp" %>

<div class="container" id="main">
   <div class="col-md-10 col-md-offset-1">
      <div class="panel panel-default">
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
                    <td><a href="${path}/shop/product/detail/${row.product_id}">${row.product_name}</a></td>
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