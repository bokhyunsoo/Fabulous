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
	$("#btnWrite").click(function(){
		location.href="${path}/board/write.do";
	});
});
function view(bno){
	document.form.bno.value = bno;
	document.form.action="${path}/board/view.do";
	document.form.submit();
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="container" id="main">
   <div class="col-md-10 col-md-offset-1">
      <div class="panel panel-default">
      	<button type="button" id="btnWrite">글쓰기</button>
      	${map.count}개의 게시물이 있습니다.
          <table class="table table-hover">
              <thead>
                <tr>
                    <th>번호</th> <th>제목</th> <th>이름</th> <th>날짜</th><th>조회수</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="row" items="${map.list}">
                <tr>
                    <td>${row.bno}</td>
					<td><a href="#" onclick="view('${row.bno}')">${row.title}</a></td>
					<td>${row.name}</td>
					<td><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${row.viewcnt}</td>
                </tr>
               </c:forEach>
              </tbody>
          </table>
          <form name="form" method="post">
		  <input type="hidden" name="bno">
		  </form>
        </div>
    </div>
</div>

<!-- 검색폼 -->
<form name="form1" method="post" action="${path}/board/list.do">
<div align="center">
	<select name="search_option">
	<c:choose>
		<c:when test="${map.search_option == 'name' }">
			<option value="all">이름+내용+제목</option>
			<option value="name" selected>이름</option>
			<option value="content">내용</option>
			<option value="title">제목</option>
		</c:when>
		<c:when test="${map.search_option == 'content' }">
			<option value="all">이름+내용+제목</option>
			<option value="name">이름</option>
			<option value="content" selected>내용</option>
			<option value="title">제목</option>
		</c:when>
		<c:when test="${map.search_option == 'title' }">
			<option value="all">이름+내용+제목</option>
			<option value="name">이름</option>
			<option value="content">내용</option>
			<option value="title" selected>제목</option>
		</c:when>
		<c:otherwise>
			<option value="all" selected>이름+내용+제목</option>
			<option value="name">이름</option>
			<option value="content">내용</option>
			<option value="title">제목</option>
		</c:otherwise>
	</c:choose>
	</select>
	
	<input type="text" name="keyword" value="${map.keyword}">
	<input type="submit" value="조회" class="btn btn-success">
</div>
</form>

<%@ include file="../include/footer.jsp" %>

</body>
</html>