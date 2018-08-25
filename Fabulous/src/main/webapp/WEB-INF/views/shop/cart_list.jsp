<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
	$(function(){
		$("#btnList").click(function(){
			location.href="${path}/shop/product/list.do";
		});
		$("#btnDelete").click(function(){
			if(confirm("장바구니를 비우시겠습니까?")){
				location.href="${path}/shop/cart/deleteAll.do";	
			}
		});
	});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="container" id="main">
   <div class="col-md-10 col-md-offset-1">
      <div class="panel panel-default">
<c:choose>
	<c:when test="${map.count == 0}">
		장바구니가 비었습니다.
	</c:when>
	<c:otherwise>
	<form name="form1" method="post" action="${path}/shop/cart/update.do">
          <table class="table table-hover">
              <thead>
                <tr>
                    <th>상품명</th>
                    <th>단가</th>
                    <th>수량</th>
                    <th>사이즈</th>
                    <th>금액</th>
                    <th>&nbsp;</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="row" items="${map.list}">
                <tr>
                    <th>${row.product_name}</th>
                    <td>${row.price}</td>
                    <td><input type="number" name="amount" value="${row.amount}">
                    <input type="hidden" name="cart_id" value="${row.cart_id}">
                    <input type="hidden" name="product_id" value="${row.product_id}"></td>
                    <td>
                    <c:if test="${row.ms == 0}">사이즈 선택안함</c:if>
                    <c:if test="${row.ms == 1}">S</c:if>
                    <c:if test="${row.ms == 2}">M</c:if>
                    <c:if test="${row.ms == 3}">L</c:if>
                    <c:if test="${row.ms == 4}">XL</c:if>
                    </td>
                    <td>${row.money}</td>
                    <td><a href="${path}/shop/cart/delete.do?cart_id=${row.cart_id}">삭제</a></td>
                </tr>
              </c:forEach>
              	<tr>
              		<td colspan="6" align="right">
              		장바구니 금액 합계 :
              		<fmt:formatNumber value="${map.sumMoney}" pattern="###,###" /><br>
              			배송료 : ${map.fee}<br>
              		총합계 : 
              		<fmt:formatNumber value="${map.sum}" pattern="###,###" /><br>
              		</td>
              	</tr>
              	<tr>
              	<td colspan="6" align="right">
              	<button id="btnUpdate" class="btn btn-success">수정</button>
              	<button type="button" id="btnDelete" class="btn btn-success">장바구니 비우기</button>
              	</td>
              	</tr>
              	<tr>
              	<td colspan="6" align="right">
              	<button type="button" id="btnList" class="btn btn-success">상품목록</button>
              	</td>
              	</tr>
              </tbody>
          </table>
    </form>
	</c:otherwise>
</c:choose>
 </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>

</body>
</html>