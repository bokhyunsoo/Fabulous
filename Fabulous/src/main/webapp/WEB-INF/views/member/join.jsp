<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function checkValue()
{
	var form = document.userInfo;

	if(!form.userId.value){
		alert("아이디를 입력하세요.");
		return false;
	}
	
	/* if(form.idDuplication.value != "idCheck"){
		alert("아이디 중복체크를 해주세요.");
		return false;
	} */
	
	if(!form.password.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
	if(form.password.value != form.passwordcheck.value ){
		alert("비밀번호를 동일하게 입력하세요.");
		return false;
	}	
	
	if(!form.name.value){
		alert("이름을 입력하세요.");
		return false;
	}
	
	if(!form.email.value){
		alert("메일 주소를 입력하세요.");
		return false;
	}
	
	if(!form.phone.value){
		alert("전화번호를 입력하세요.");
		return false;
	}
	
	if(isNaN(form.phone.value)){
		alert("전화번호는 - 제외한 숫자만 입력해주세요.");
		return false;
	}
	
	if(!form.address.value){
		alert("주소를 입력하세요.");
		return false;
	}
}
</script>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<div class="container" id="main">
   <div class="col-md-6 col-md-offset-3">
      <div class="panel panel-default content-main">
          <form name="userInfo" method="post" action="${path}/member/insert.do" onsubmit="return checkValue()">
              <div class="form-group">
                  <label for="userId">사용자 아이디</label>
                  <input class="form-control" id="userId" name="userId" placeholder="UserID" size="4">
              </div>
              <div class="form-group">
                  <label for="password">비밀번호</label>
                  <input type="password" class="form-control" id="password" name="password" placeholder="Password">
              </div>
              <div class="form-group">
                  <label for="passwordcheck">비밀번호 확인</label>
                  <input type="password" class="form-control" id="passwordcheck" name="passwordcheck" placeholder="PasswordCheck">
              </div>
              <div class="form-group">
                  <label for="name">이름</label>
                  <input class="form-control" id="name" name="name" placeholder="Name">
              </div>
              <div class="form-group">
                  <label for="email">이메일</label>
                  <input type="email" class="form-control" id="email" name="email" placeholder="Email">
              </div>
              <div class="form-group">
                  <label for="name">휴대전화</label>
                  <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number">
              </div>
              <div class="form-group">
                  <label for="name">주소</label>
                  <input type="text" class="form-control" id="address" name="address" size="50" placeholder="Address">
              </div>
              
              <button type="submit" class="btn btn-success clearfix pull-right">회원가입</button>
              <div class="clearfix" />
          </form>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>

</body>
</html>