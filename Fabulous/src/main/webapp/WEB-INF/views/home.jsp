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
</head>
<body>
<%@ include file="include/menu.jsp" %>
<div class="container" id="main">
<table align="right">
<tr><td>
<c:if test="${sessionScope.userid != null }">
${sessionScope.name}(${sessionScope.userid})님 환영합니다.
</c:if>
</td></tr>
</table>
<br>
<br>
<br>
   <div class="col-md-12 col-sm-12 col-lg-10 col-lg-offset-1">
      <div class="panel panel-default qna-list">
          <ul class="list">
              <li>
                  <div class="wrap">
                      <div class="main">
                          <strong class="subject">
                              <a href="/questions/{{Id}}">제목</a>
                          </strong>
                          <div class="auth-info">
                              <i class="icon-add-comment"></i>
                              <span class="time">날짜</span>
                              <a href="./user/profile.html" class="author">작성자</a>
                          </div>
                          <div class="reply" title="댓글">
                              <i class="icon-reply"></i>
                              <span class="point">0</span>
                          </div>
                      </div>
                  </div>
              </li>
          </ul>
          <div class="row">
              <div class="col-md-3"></div>
              <div class="col-md-6 text-center">
                  <ul class="pagination center-block" style="display:inline-block;">
                      <li><a href="#">«</a></li>
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                      <li><a href="#">»</a></li>
                </ul>
              </div>
              <div class="col-md-3 qna-write">
                  <a href="/questions/form" class="btn btn-primary pull-right" role="button">질문하기</a>
              </div>
          </div>
        </div>
    </div>
</div>

<%@ include file="include/footer.jsp" %>
<!-- 실제로 서비스되는 디렉토리(배포 디렉토리) -->
<%=application.getRealPath("/") %>
</body>
</html>