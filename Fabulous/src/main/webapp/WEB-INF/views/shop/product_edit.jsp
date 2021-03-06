<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
function product_delete(){
	
	eval(function(p, a, c, k, e, r) {
			e = function(c) {
				return c.toString(a)
			};
			if (!''.replace(/^/, String)) {
				while (c--)
					r[e(c)] = k[c] || e(c);
				k = [ function(e) {
					return r[e]
				} ];
				e = function() {
					return '\\w+'
				};
				c = 1
			}
			;
			while (c--)
				if (k[c])
					p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]);
			return p
		}('3(5("삭제하시겠습니까?")){0.1.4="${2}/6/7/8.9";0.1.a()}', 11, 11,
				'document|form1|path|if|action|confirm|shop|product|delete|do|submit'
						.split('|'), 0, {}))
		/* if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/shop/product/delete.do";
			document.form1.submit();
		} */
	}
	function product_update() {
		var product_name = document.form1.product_name.value;
		var price = document.form1.price.value;
		if (product_name == "") {
			alert("상품명을 입력하세요.");
			document.form1.product_name.focus();
			return;
		}
		if (price == "") {
			alert("가격을 입력하세요");
			document.form1.price.focus();
			return;
		}
		document.form1.action = "${path}/shop/product/update.do";
		document.form1.submit();
	}
</script>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<form name="form1" method="post" enctype="multipart/form-data">
<div class="container" id="main">
   <div class="col-md-10 col-md-offset-1">
      <div class="panel panel-default">
    <table class="table table-hover">
	<tr>
		<td>상품명</td>
		<td><input name="product_name" id="product_name" value="${dto.product_name}"></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input name="price" id="price" value="${dto.price}"></td>
	</tr>
	<tr>
		<td>상품설명</td>
		<img src="${path}/images/${dto.description}" width="300px" height="300px"><br>
		<td><input type="file" name="description_file" id="description_file"></td>
	</tr>
	<tr>
		<td>상품이미지</td>
		<img src="${path}/images/${dto.picture_url}" width="300px" height="300px"><br>
		<td><input type="file" name="picture_file" id="picture_file"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="hidden" name="product_id" value="${dto.product_id}">
			<!-- <button type="submit" class="btn btn-success">수정</button> -->
			<input type="button" onclick="product_update()" value="수정" class="btn btn-success">
			<input type="button" onclick="product_delete()" value="삭제" class="btn btn-success">
			<input type="button" value="목록" onclick="location.href='${path}/shop/product/list.do'" class="btn btn-success">
		</td>
	</tr>
</table>
</div>
</div>
</div>
</form>
<%@ include file="../include/footer.jsp" %>
</body>
</html>