<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				<c:when test="${sessionScope.admin_userid == null}">
                <li><a href="${path}/admin/login.do">관리자 로그인</a></li>
                </c:when>
                <c:otherwise>
                <li><a href="${path}/pdf/list.do" role="button">PDF</a></li>
                <li><a href="${path}/chart/chart1.do" role="button">구글차트(json)</a></li>
                <li><a href="${path}/chart/chart2.do" role="button">구글차트(db)</a></li>
                <li><a href="${path}/jchart/chart1.do" role="button">JFreeChart(png)</a></li>
                <li><a href="${path}/jchart/chart2.do" role="button">JFreeChart(png)</a></li>
                <li><a href="${path}/email/write.do" role="button">이메일 방송</a></li>
                <li><a href="${path}/shop/product/list.do" role="button">상품목록</a></li>
                <li><a href="${path}/shop/product/write.do" role="button">상품등록</a></li>
                <li><a href="${path}/shop/cart/list.do" role="button">장바구니</a></li>
                <li><a href="${path}/admin/logout.do" role="button">로그아웃</a></li>
                <li><a href="" role="button">개인정보수정</a></li>
                </c:otherwise>
			</c:choose>
            </ul>
        </div>
    </div>
</div>
</html>