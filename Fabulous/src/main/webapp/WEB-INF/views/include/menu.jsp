<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-fixed-top header">
    <div class="col-md-12">
        <div class="navbar-header">
        	<a href="${path}" class="navbar-brand">Fabulous</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse1">
            <form class="navbar-form pull-left">
            </form>
        </div>
    </div>
</nav>
<div class="navbar navbar-default" id="subnav">
    <div class="col-md-12">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse2">
            	<span class="sr-only">Toggle navigation</span>
            	<span class="icon-bar"></span>
            	<span class="icon-bar"></span>
            	<span class="icon-bar"></span>
            </button>            
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse2">
            <ul class="nav navbar-nav navbar-right">
            <c:choose>
				<c:when test="${sessionScope.userid == null}">
				<li><a href="${path}/notice/list.do" role="button">공지사항</a></li>
				<li><a href="${path}/shop/product/doglist.do" role="button">핫도그류</a></li>
				<li><a href="${path}/shop/product/skewerlist.do" role="button">꼬치류</a></li>
				<li><a href="${path}/shop/product/sausagelist.do" role="button">소시지류</a></li>
				<li><a href="${path}/board/list.do" role="button">게시판</a></li>
                <li><a href="${path}/member/login.do" role="button">로그인</a></li>
                <li><a href="${path}/member/join.do" role="button">회원가입</a></li>
                <li><a href="${path}/admin/login.do">관리자 로그인</a></li>
                </c:when>
                <c:otherwise>
                <li><a href="${path}/notice/list.do" role="button">공지사항</a></li>
                <li><a href="${path}/shop/product/doglist.do" role="button">핫도그류</a></li>
				<li><a href="${path}/shop/product/skewerlist.do" role="button">꼬치류</a></li>
				<li><a href="${path}/shop/product/sausagelist.do" role="button">소시지류</a></li>
                <li><a href="${path}/shop/cart/list.do" role="button">장바구니</a></li>
                <li><a href="${path}/board/list.do" role="button">게시판</a></li>
                <li><a href="${path}/member/logout.do" role="button">로그아웃</a></li>
                </c:otherwise>
			</c:choose>
            </ul>
        </div>
    </div>
</div>

</html>