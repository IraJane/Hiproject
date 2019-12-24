<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>


<link href="<c:url value="/css/seller.css" />" rel="stylesheet">
<link href="<c:url value="/img/**" />" rel="stylesheet">



<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<script>
$(function () {
	 	var flag = 0;
	    var write = '';

    
  /*  write = "호텔";
   $('.typetext').append().text(write); */
   
	
	
	
	
/*    function load() {
	  $('.typetext').append().text(write);

	$('.typetext').animate({opacity:'1'},1000);
	$('.typetext').animate({opacity:'0'},1000);
	

    }; */
	
});


</script>







<%-- 
<%
	if (session.getAttribute("selloginfo") == null) {
%>
<header class="main-menu">
	<a href="selSignup.sel">회원가입</a><a href="selLogin.sel">로그인</a>
</header>
<%
	} else {
%>
<header class="main-menu">
	<a class="floatRigth">반갑습니다</a>
	
	<a href="logout.sel">로그아웃</a> <a href="selInfo.sel">내정보 보기</a> <a
		href="hotelInsert.ho">내숙소 등록하기</a> <a href="hotelNow.der">내숙소 예약현황</a>
		
		
		
		
		
		
		
	
</header>

<%
	}
%>
 --%>

<%@include file="../common/selHeader.jsp"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">

<div class="background">
<br><br><br><br><br><br><br>

<table>

<tr>
	<td>
		
		<h3>등록을 시작해보세요</h3>
		<span  class="typetext"></span>

		<p>등록을 해보세요!</p>
		<p>15분이면 숙소 등록 끝 – 지금 바로 시작하세요</p>
		<br><br>
	</td>

</tr>








	
	

</table>

</div>


<div class="underground">

	
	
	<div class="underground-undertext">
	
		<div class="ul-wrapper">
		<div class="underground-title ">원하는 형태로 고객을 맞이하실 수 있도록 도와드립니다.</div>
		<div>저희와 함께 하시면 무궁무진한 혜택을 누리실 수 있어요</div>
			<ul class="underground-ul">
				<li><i class="material-icons icons1">date_range</i></li>
				<li><b>예약 전 고객과 사전 조율</b></li>
				<li>고객이 예약 전 저희 메시지 시스템으로 숙소에 연락하여 필요한 사항을 조율할 수 있습니다. 이를 통해 더욱 만족스러운 서비스 제공이 가능합니다.</li>
				<li><br></li>
				<li><i class="material-icons icons2">book</i></li>
				<li><b>이용 수칙 적용</b></li>
				<li>고객이 반드시 지켜야 할 이용 수칙을 설정하실 수 있습니다. 고객은 숙소 예약 전 해당 이용 수칙 준수에 동의해야 합니다.</li>
			</ul>
			<ul class="underground-ul ">
				<li><i class="material-icons icons3">translate</i></li>
				<li><b>신속·정확한 지원</b></li>
				<li>전 세계 전담 지원팀이 43개 국어로 필요하신 부분에 대해 24시간 지원해드립니다.</li>
				<li><br></li>
				<li><br></li>
				<li><i class="material-icons icons4">verified_user</i></li>
				<li><b>신속한 문제 신고</b></li>
				<li>고객이 문제를 일으킨 경우 부정/불법 행위 신고 기능을 이용하여 상황을 저희 담당팀에게 신속하게 전달하실 수 있습니다.</li>
			
			</ul>
		</div>
		
		
		
		
		<p class="underground-faq">추가로 궁금한 사항이 있는 경우 <span>FAQ</span>에서 모든 정보를 찾아보실 수 있습니다</p>
		

</div>
	<div class="under-inserthotelbth">
		<p>숙박 시설을 등록하세요!</p>
		<a href="#" class="under-inserthotelAtag">숙박 등록</a>
	
	
	
	
	</div>

		
		
	
	</div>

<%@include file="../common/selFooter.jsp"%>






