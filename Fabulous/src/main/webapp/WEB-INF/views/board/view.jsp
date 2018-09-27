<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/include/js/common.js"></script>
<script src="${path}/ckeditor/ckeditor.js"></script>
<script>
$(function(){
	
	listAttach(); // 첨부파일 목록 로딩
	
	//댓글 목록 출력
	listReply("1"); // responseText 방식
	/* listReply2(); // json 방식 */
	
	// json리턴 방식
	function listReply2(){
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "${path}/reply/list_json.do?bno=${dto.bno}",
			success:function(result){
				console.log(result);
				var output = "<table>";
				for (var i in result){
					var repl = result[i].replytext;
					repl = repl.replace(/  /gi,"&nbsp;&nbsp;"); //공백처리
					repl = repl.replace(/</gi,"&lt;"); // 태그문자 처리
					repl = repl.replace(/>/gi,"&gt;");
					repl = repl.replace(/\n/gi,"<br>"); // 줄바꿈 처리
					output += "<tr><td>"+result[i].name;
					date = changeDate(result[i].regdate);
					output +="("+date+")";
					output += "<br>"+repl+"</td></tr>";
				}
				output += "</table>";
				$("#listReply").html(output);
			}		
		});
	}
	
	function changeDate(date){
		//javascript 날짜 객체, parseInt() 숫자로 변환
		date = new Date(parseInt(date));
		year = date.getFullYear(); // 4자리 연도
		month = date.getMonth()+1;
		day = date.getDate();
		hour = date.getHours();
		minute = date.getMinutes();
		second = date.getSeconds();
		strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
		return strDate;
	}
	//responseText 방식
	
	//목록 버튼 클릭
	$("#btnList").click(function(){
		location.href="${path}/board/list.do";
	});
	
	$("#btnReply").click(function(){
		Reply();
	});
	
	function Reply(){
		var replytext = $("#replytext").val(); // 댓글 내용
		var bno = "${dto.bno}"; // 게시물 번호
		var secretReply = "n";
		if($("#secretReply").is(":checked")){
			secretReply = "y";
		}
		// var param = "replytext="+replytext+"&bno="+bno;
		var param = {"replytext": replytext, "bno": bno, "secretReply": secretReply};
		$.ajax({
			type : "post",
			url : "${path}/reply/insert.do",
			data : param,
			success : function(){ // 콜백 함수
				alert("댓글이 등록되었습니다.");
				listReply("1")
			}
		});
	}
	
	//드래그 기본효과 막음
	$(".fileDrop").on("dragenter dragover",function(e){
		e.preventDefault();
	});
	$(".fileDrop").on("drop",function(e){
		e.preventDefault();
		//첫번째 첨부파일
		var files=e.originalEvent.dataTransfer.files;
		var file=files[0];
		//폼 데이터에 첨부파일 추가
		var formData=new FormData();
		//폼 데이터에 추가
		formData.append("file",file);
		//processData: false - header가 아닌 body로 전송
		$.ajax({
			url: "${path}/upload/uploadAjax",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			type: "post",
			success: function(data){
				//console.log(data);
				//data : 업로드한 파일 정보와 Http 상태 코드
				var fileInfo=getFileInfo(data);
				//console.log(fileInfo);
				var html="<a href='"+fileInfo.getLink+"'>"+
					fileInfo.fileName+"</a><br>";
				html += "<input type='hidden' class='file' value='"
					+fileInfo.fullName+"'>";
				$("#uploadedList").append(html);
			}
		});
	});
	
	//첨부파일 삭제
	$("#uploadedList").on("click",".file_del",function(e){
		var that=$(this); // 클릭한 태그
		$.ajax({
			type: "post",
			url : "${path}/upload/deleteFile",
			data : {fileName:$(this).attr("data-src")},
			dataType: "text",
			success: function(result){
				if( result == "deleted") {
					that.parent("div").remove();
				}
			}
		});
	});
	
	$("#btnUpdate").click(function(){
		
		var str = "";
		// uploadedList 내부의 .file 태그 각각 반복
		$("#uploadedList .file").each(
				function(i) {
					console.log(i);
					//hidden 태그 구성
					str += "<input type='hidden' name='files[" + i
							+ "]'	value='" + $(this).val() + "'>";
				});
		//폼에 hidden 태그들을 붙임
		$("#form1").append(str);
		
		document.form1.action="${path}/board/update.do";
		document.form1.submit();
	});
});
$(function(){
	$("#btnDelete").click(function(){
		
		var Replycount = "${Replycount}";
		if(Replycount > 0){
			alert("댓글이 있는 게시물은 삭제할 수 없습니다.")
			return;
		}
		
		var Attachcount = "${Attachcount}";
		if(Attachcount > 0){
			alert("첨부파일이 있는 게시물은 삭제할 수 없습니다.")
			return;
		}
		
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/board/delete.do";
			document.form1.submit();
		}
	});
});

//첨부파일 리스트를 출력하는 함수
function listAttach(){
	$.ajax({
		type : "post",
		url : "${path}/board/getAttach/${dto.bno}",
		success : function(list){
			// list => json 형식의 데이터
			$(list).each(function(){
				var fileInfo = getFileInfo(this);
				var html = "<div><a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a>&nbsp;&nbsp;";
				<c:if test="${sessionScope.userid == dto.writer}">html+="<a href='#' class='file_del' data-src='"+this+"'>[삭제]</a></div>";
				</c:if>
				$("#uploadedList").append(html);
			});
		}
	});
}

function listReply(num){
	$.ajax({
		type : "get",
		url : "${path}/reply/list.do?bno=${dto.bno}&curPage="+num,
		success : function(result){
			// 컨트롤러에서 뷰로 포워딩되어 출력된 responseText를
			// id가 listReply인 태그의 innerHTML 영역에 출력시킴
			$("#listReply").html(result);
		}
	});
}

function reply() {
	 if(!document.form1.replytext.value){
         alert("댓글을 입력하세요.");
         document.form1.replytext.focus();
         return false;
     }
}

function showReplyModify(rno) {
	$.ajax({
		type:"get",
		url:"${path}/reply/detail/"+rno,
		success:function(result){
			$("#modifyReply").html(result);
			$("#modifyReply").css("visibility","visible");
		}
});
}
</script>
<style>
#modifyReply {
	width: 700px;
	height: 130px;
	padding:10px;
	z-index:10;
	visibility:hidden;
}

.fileDrop {
	width: 300px;
	height: 100px;
	border: 1px dotted gray;
	background-color: gray;
	
}

.my-hr1 {
    border: 0;
    height: 1px;
    background: #ccc;
  }
</style>
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
      	<td>제목 : <input name="title" value="${dto.title}" size="60"></td>
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
		<!-- 첨부파일 목록 -->
		<div align="center"><H4>첨부파일</H4></div>
		<br>
		<!-- 첨부파일을 드래그할 영역 -->
		<c:if test="${sessionScope.userid == dto.writer}">
        <center><div class="fileDrop"></div></center>
        </c:if>
		<div id="uploadedList" align="center"></div><br>
		<hr class="my-hr1">
		<div align="center"><H4>댓글&nbsp;<c:if test="${dto.cnt > 0}"><span style="color:red;">( ${dto.cnt} )</span></c:if></H4></div>
		<!-- 댓글 작성폼 -->
		<div align="center">
		<c:if test="${sessionScope.userid != null}">
			<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요"></textarea>
			<br>
			<input type="checkbox" id="secretReply">비밀 댓글
			<br>
			<button type="button" id="btnReply" class="btn btn-success" onclick="reply()">댓글쓰기</button>
		</c:if>
		</div>
		<br>
		<!-- 댓글 목록을 출력할 영역 -->
		<div id="listReply" align="center"></div>
		<table align="center">
		<tr><td>
		<input type="hidden" name="bno" value="${dto.bno}">
		<br><br>
		<c:if test="${sessionScope.userid == dto.writer}">
		<button type="button" id="btnUpdate" class="btn btn-success">수정</button>
		<button type="button" id="btnDelete" class="btn btn-success">삭제</button>
		</c:if>
		<button type="button" id="btnList" class="btn btn-success">목록</button>
      	</td></tr>
      	</table>
      	<br>
      	<table align="center">
      	<tr>
      	<td>
      		<div id="modifyReply" align="center"></div>
      	</td>
      	</tr>
      	</table>
      	<br>
      	<br>
      </form>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>