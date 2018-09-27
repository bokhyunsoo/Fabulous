<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 세션을 사용하지 않는 옵션 -->
<%@ page session="true" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
<%@ include file="include/header.jsp" %>
<script>
function view(bno){
	document.form.bno.value = bno;
	document.form.action="${path}/notice/view.do";
	document.form.submit();
}
function list(page){
	location.href="${path}/?curPage="+page;
}
</script>
</head>
<body>
<c:choose>
<c:when test="${sessionScope.admin_userid != null}">
<%@ include file="include/admin_menu.jsp" %>
</c:when>
<c:otherwise>
<%@ include file="include/menu.jsp" %>
</c:otherwise>
</c:choose>

<br><br><br><br><br><br><br>
<table align="right">
<tr><td>
<c:if test="${sessionScope.userid != null }">
${sessionScope.name}(${sessionScope.userid})님 환영합니다.
</c:if>
</td></tr>
</table>
<div class="container" id="main">
   <div class="col-md-12 col-sm-12 col-lg-10 col-lg-offset-1">
      <div class="panel panel-default qna-list">
      <h2>공지사항</h2>
      <c:forEach var="row" items="${map.list}">
          <ul class="list">
              <li>
                  <div class="wrap">
                      <div class="main">
                          <strong class="subject">
                              <a href="#" onclick="view('${row.bno}')">${row.title}</a>
                          </strong>
                          <div class="auth-info">
                              <fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                          </div>
                          <div class="reply">
                              <i class="icon-reply"></i>
                              <span class="point">${row.bno}</span>
                          </div>
                      </div>
                  </div>
              </li>
          </ul>
          </c:forEach>
          <div class="row">
              <div class="col-md-3"></div>
              <div class="col-md-6 text-center">
                  <ul class="pagination center-block" style="display:inline-block;">
			<c:if test="${map.pager.curBlock > 1}">
				<li><a href="#" onclick="list('1')">[처음]</a></li>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<li><a href="#" onclick="list('${map.pager.prevPage}')">
				[이전]</a></li>
			</c:if>
			<c:forEach var="num" 
				begin="${map.pager.blockBegin}"
				end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<li><span style="color:red;">${num}</span></li>
					</c:when>
					<c:otherwise>
						<li><a href="#" onclick="list('${num}')">${num}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<li><a href="#" 
				onclick="list('${map.pager.nextPage}')">[다음]</a></li>
			</c:if>
			<c:if test="${map.pager.curPage < map.pager.totPage}">
				<li><a href="#" 
				onclick="list('${map.pager.totPage}')">[끝]</a></li>
			</c:if>
                </ul>
              </div>
              <c:if test="${sessionScope.admin_userid == 'admin'}">
              <div class="col-md-3 qna-write">
                  <a href="${path}/notice/write.do" class="btn btn-primary pull-right" role="button">글쓰기</a>
              </div>
              </c:if>
          </div>
          <form name="form" method="post">
		  <input type="hidden" name="bno">
		  </form>
        </div>
    </div>
</div>

<%@ include file="include/footer.jsp" %>
<!-- 실제로 서비스되는 디렉토리(배포 디렉토리) -->
<%-- <%=application.getRealPath("/") %> --%>
</body>
</html>