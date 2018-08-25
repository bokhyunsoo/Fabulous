<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
function product_write(){
	// 태그를 name으로 조회할 경우
	//var product_name=document.form1.product_name.value;
	// 태그를 id로 조회할 경우
	var product_name=$("#product_name").val();
	var price=$("#price").val();
	var description=$("#description").val();
	if(product_name==""){ //빈값이면
		alert("상품이름을 입력하세요"); 
		$("#product_name").focus(); //입력포커스 이동
		return; //함수 종료, 폼 데이터를 제출하지 않음
	}
	if(price==""){
		alert("가격을 입력하세요");
		$("#price").focus();
		return;
	}
/* 	if(description==""){
		alert("상품 설명을 입력하세요");
		$("#description").focus();
		return;
	} */
	//폼 데이터를 받을 주소
	document.form1.action="${path}/shop/product/insert.do";
	//폼 데이터를 서버에 전송
	document.form1.submit();
}
</script>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>

<div class="container" id="main">
   <div class="col-md-6 col-md-offset-3">
      <div class="panel panel-default content-main">
          <form name="form1" action="${path}/shop/product/insert.do" method="post" enctype="multipart/form-data" onsubmit="return product_write()">
              <div class="form-group">
                  <label for="product_name">상품명</label>
                  <input type="text" class="form-control" id="product_name" name="product_name" placeholder="product_name">
              </div>
              <div class="form-group">
                  <label for="price">가격</label>
                  <input type="text" class="form-control" id="price" name="price" placeholder="price" size="6">
              </div>
              <div class="form-group">
                  <label for="description">상품설명</label>
                  <input type="file" class="form-control" id="description_file" name="description_file" placeholder="description_file">
              </div>
              <div class="form-group">
                  <label for="picture">상품이미지</label>
                  <input type="file" class="form-control" id="picture_file" name="picture_file" placeholder="picture_file">
              </div>
              <div class="form-group">
              	<table>
              	<tr>
              	<td>
              	<!-- <button type="submit" class="btn btn-success">등록</button>
              	<div class="clearfix" /> -->
              	<input type="button" value="등록" onclick="product_write()" class="btn btn-success">
              	</td>
              	<td>
              	<input type="button" value="목록" onclick="location.href='${path}/shop/product/list.do'" class="btn btn-success">
              	</td>
              	</tr>
              	</table>
              </div>
              <!-- <button type="submit" class="btn btn-success clearfix pull-right">회원가입</button>
              <div class="clearfix" /> -->
          </form>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>

</body>
</html>