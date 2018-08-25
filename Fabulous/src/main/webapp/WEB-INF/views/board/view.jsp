<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/ckeditor/ckeditor.js"></script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="container" id="main">
   <div class="col-md-10 col-md-offset-1">
      <div class="panel panel-default">
      <form id="form1" name="form1" method="post">
      	<table class="table table-hover">
      	<tr>
      	<td>작성일자 : <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
      	</tr>
      	<tr>
      	<td>조회수 : ${dto.viewcnt}</td>
      	</tr>
      	<tr>
      	<td>이름 : ${dto.name}</td>
      	</tr>
      	<tr>
      	<td>제목 : <input name="title" value="${dto.title}"></td>
      	</tr>
      	<tr>
      	<td>내용 : <textarea rows="3" cols="80" name="content">
      	${dto.content}</textarea>
      	<script>
		CKEDITOR.replace("content",{filebrowserUploadUrl : "${path}/imageUpload.do"});
		</script>
		</td>
		</tr>
		</table>
		<table align="center">
		<tr><td>
		<input type="hidden" name="bno" value="${dto.bno}">
		<button type="button" id="btnUpdate" class="btn btn-success">수정</button>
		<button type="button" id="btnDelete" class="btn btn-success">삭제</button>
		<button type="button" id="btnList" class="btn btn-success">목록</button>
      	</td></tr>
      	</table>
      </form>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>