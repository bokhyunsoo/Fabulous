<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
//비밀번호 입력여부 체크
function email() {
            if(!document.form1.senderMail.value){
                alert("발신자 이메일주소를 입력하세요.");
                return false;
            }
            else if(!document.form1.receiveMail.value){
                alert("수신자 이메일주소를 입력하세요.");
                return false;
            }
            else if(!document.form1.subject.value){
                alert("제목을 입력하세요.");
                return false;
            }
            else if(!document.form1.message.value){
                alert("내용을 입력하세요.");
                return false;
            }
        }
</script>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<br><br>
<div class="container" id="main">
   <div class="col-md-6 col-md-offset-3">
      <div class="panel panel-default content-main">
   	<h3>이메일 발송</h3>
	<form name="form1" action="${path}/email/send.do" onsubmit="return email()">
	<div class="form-group">
    	<label for="title">발신자 이메일주소 : </label>
        	<input type="text" class="form-control" id="senderMail" name="senderMail" placeholder="발신자 이메일주소를 입력하세요">
    </div>
    <div class="form-group">
    	<label for="title">수신자 이메일주소 : </label>
        	<input type="text" class="form-control" id="receiveMail" name="receiveMail" placeholder="수신자 이메일주소를 입력하세요">
    </div>
    <div class="form-group">
    	<label for="title">제목 : </label>
        	<input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하세요">
    </div>
    <div class="form-group">
    	<label for="title">내용 : </label>
        	<br><textarea rows="5" cols="65" id="message" name="message" placeholder="내용을 입력하세요"></textarea>
    </div>
    <div align="center">
	<input type="submit" value="전송" class="btn btn-success"><br>
	<span style="color:red;">${message}</span>
	</div>
	</form>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>

</body>
</html>