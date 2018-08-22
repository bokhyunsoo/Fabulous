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
              <tr>
              <td width="600"><img src="${path}/images/${dto.picture_url}" width="500" height="300"></td>
              <td>
              	<table>
              	<br><br><br><br>
              	<tr>
                    <th>상품명</th>
                    <td>&nbsp;&nbsp;${dto.product_name}</td>
               </tr>
               <tr>
                    <th>가격</th>
                    <td>&nbsp;&nbsp;${dto.price}</td>
               </tr>
               <tr>
                    <th>수량</th>
                    <td>&nbsp;&nbsp;
						<select name="amount">
							<c:forEach begin="1" end="10" var="i">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select>
					</td>
               </tr>
               <tr>
                    <th>사이즈</th>
                    <td>&nbsp;&nbsp;
                    <select name="measurement">
							<option value="사이즈 미선택">SIZE</option>
							<option value="S">S</option>
							<option value="M">M</option>
							<option value="L">L</option>
							<option value="XL">XL</option>
					</select>
					</td>
               </tr>
               <tr>
				<td><br></td>	
				</tr>
				<tr>
				<td colspan="2">
					<input type="hidden" name="product_id" value="${dto.product_id}">
					<a href="${path}/shop/cart/insert.do" class="btn btn-success" role="button">장바구니에 담기</a>
				</td>
				</tr>
				</table>
				</td>
				</tr>
			</table>
			<table class="table table-hover">
			<tr align="center">
			<td><img src="${path}/images/${dto.description}" width="660"></td></td>
			</tr>
			</table>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>

</body>
</html>