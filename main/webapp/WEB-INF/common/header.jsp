<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>

    
    
    
    
    
    
<header class="main-menu">
		<a href="main.jsp" class="main">호텔로고자리</a> 
		<c:if test="${sessionScope.loginfo == null }">
			<a href="register.mem" style="float:right; margin:20px;">회원가입</a>
			<a href="login.mem" style="float:right; margin:20px;">로그인</a>
		</c:if>
		<c:if test="${sessionScope.loginfo != null }">
			<a href="logout.mem" style="float:right; margin:20px;">로그아웃</a>
			<a href="info.mem" style="float:right; margin:20px;">내 정보</a>
		</c:if>
	
		<a target="_blank" class="mainright" href="selMain.sel">판매자</a>
	
</header>
    
    