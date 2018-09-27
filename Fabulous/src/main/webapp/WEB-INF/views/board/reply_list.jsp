<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<table border="1" style="width:650px;">
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:forEach var="row" items="${list}">
	<!-- 공백문자 처리 -->
	<c:set var="str" value="${fn:replace(row.replytext,'  ','&nbsp;&nbsp;')}" />
	<!-- 줄바꿈 처리 -->
	<c:set var="str" value="${fn:replace(row.replytext,newLineChar,'<br>')}" />
	<tr>
		<td align="center"><br><div style="color:blue;">${row.name}</div> <div align="right">( <fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/> )</div>
		<br>${str}<br>
		<!-- 본인이 작성한 댓글만 수정 기능 표시 -->
		<br>
		<c:if test="${sessionScope.userid == row.replyer}">
			<input type="button" id="btnModify" value="수정" onclick="showReplyModify('${row.rno}')" class="btn btn-success">
		</c:if>
		</td>
	</tr>
</c:forEach>

<!-- 페이지 처리 -->
	<tr>
		<td colspan="5" align="center">
			<c:if test="${pager.curBlock > 1}">
				<a href="javascript:listReply('1')">[처음]</a>
			</c:if>
			<c:if test="${pager.curBlock > 1}">
				<a href="javascript:listReply('${pager.prevPage}')">
				[이전]</a>
			</c:if>
			<c:forEach var="num" 
				begin="${pager.blockBegin}"
				end="${pager.blockEnd}">
				<c:choose>
					<c:when test="${num == pager.curPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color:red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="javascript:listReply('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pager.curBlock < pager.totBlock}">
				<a href="javascript:listReply('${pager.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${pager.curPage < pager.totPage}">
				<a href="javascript:listReply('${pager.totPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>
</table>

</body>
</html>