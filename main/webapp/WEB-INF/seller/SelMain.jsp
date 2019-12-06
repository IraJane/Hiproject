<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>


<link href="<c:url value="/css/seller.css" />" rel="stylesheet">
<link href="<c:url value="/img/**" />" rel="stylesheet">



<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<script>
$(function(){
	
	
	
	
});


</script>








<%
	if (session.getAttribute("loginfo") == null) {
%>
<header class="main-menu">
	<a href="selSignup.sel">회원가입</a><a href="selLogin.sel">로그인</a>
</header>
<%
	} else {
%>
<header class="main-menu">
	<p class="floatRigth">${sessionScope.loginfo.name }님반갑습니다</p>
	
	<a href="logout.sel">로그아웃</a> <a href="selInfo.sel">내정보 보기</a> <a
		href="insert.ho">내숙소 등록하기</a> <a href="hotelNow.ho">내숙소 예약현황</a>
	
</header>

<%
	}
%>





<div class="background">

	<div class="text-wrap">
		<div class="view-text">
			<span class="changer">호텔</span> <span class="changer">호텔2</span> <span
				class="changer">호텔3</span>
		</div>
	</div>

	<h3>등록을 해보세요!</h3>
	<p>15분이면 숙소 등록 끝 – 지금 바로 시작하세요</p>






</div>

<div class="underground">

	<p>마음 놓고 고객을 맞이하세요</p>
	<p>안심하고 숙소를 운영하실 있도록 "HOTEL LOGO 자리"에서 도와드립니다.</p>
	<ul>
		<li>요금, 정책, 규칙 모두 원하는 대로 설정</li>
		<li>24시간 파트너 지원 서비스 이용 및 투숙객 부정행위 신고 가능</li>
		<li>예약 조건과 제한사항을 설정하여 원하는 유형의 투숙객 예약 접수</li>
	</ul>

</div>










