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
function checkValue()
{
	inputForm = eval("document.loginInfo");
	if(!inputForm.userId.value)
	{
		alert("아이디를 입력하세요.");	
		inputForm.userId.focus();
		return;
	}
	if(!inputForm.password.value)
	{
		alert("비밀번호를 입력하세요.");	
		inputForm.password.focus();
		return;
	}
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<br><br>
<div class="container" id="main">
   <div class="col-md-6 col-md-offset-3">
      <div class="panel panel-default content-main">
      <c:if test="${param.message == 'nologin'}">
      <div class="alert alert-danger" role="alert" style="color:red;">로그인하신 후 이용하세요.</div>
      </c:if>
      <c:if test="${message == 'error'}">
      <div class="alert alert-danger" role="alert" style="color:red;">아이디 또는 비밀번호가 일치하지 않거나 입력하지 않은 항목이 있습니다.</div>
      </c:if>
      <c:if test="${message == 'logout'}">
      <div class="alert alert-danger" role="alert" style="color:red;">로그아웃 처리되었습니다.</div>
      </c:if>
      <c:if test="${message == 'success'}">
		<script>
		alert("회원가입이 완료되었습니다.");
		</script>
		<div class="alert alert-danger" role="alert" style="color:red;">회원가입이 완료되었습니다. 로그인 해주세요.</div>
	  </c:if>
	  <h2 align="center">회원 로그인</h2>
           <form name="loginInfo" method="post" action="${path}/member/login_check.do" onsubmit="return checkValue()">
              <div class="form-group">
                  <label for="userId">사용자 아이디</label>
                  <input class="form-control" id="userId" name="userId" placeholder="User ID">
              </div>
              <div class="form-group">
                  <label for="password">비밀번호</label>
                  <input type="password" class="form-control" id="password" name="password" placeholder="Password">
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