<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
<%@ include file="../include/header.jsp" %>
<script>
$(function(){
	$("#btnLogin").click(function(){
		
		var userid=$("#userid").val(); // 태그의 value 속성 값
		var passwd=$("#passwd").val();
		if(userid==""){
			alter("아이디를 입력하세요.");
			$("#userid").focus(); // 입력 포커스 이동
			return; // 함수 종료
		}
		if(passwd==""){
			alter("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
		}
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<div class="container" id="main">
   <div class="col-md-6 col-md-offset-3">
      <div class="panel panel-default content-main">
      <c:if test="${message == 'error'}">
      <div class="alert alert-danger" role="alert" style="color:red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
      </c:if>
      <c:if test="${message == 'logout'}">
      <div class="alert alert-danger" role="alert" style="color:red;">로그아웃 처리되었습니다.</div>
      </c:if>
          <form name="login" method="post" action="${path}/member/login_check.do">
              <div class="form-group">
                  <label for="userId">사용자 아이디</label>
                  <input class="form-control" id="userid" name="userid" placeholder="User ID">
              </div>
              <div class="form-group">
                  <label for="password">비밀번호</label>
                  <input type="password" class="form-control" id="passwd" name="passwd" placeholder="Password">
              </div>
              <button type="submit" class="btn btn-success clearfix pull-right">로그인</button>
              <div class="clearfix" />
          </form>
        </div>
    </div>
</div>
		
<%@ include file="../include/footer.jsp" %>

</body>
</html>