<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<script type="text/javascript">






$(function(){
	
	
	
	
	$('#person').click(function(){
		$('.personbox').toggle();

		
	});
	
	
	
	
	
	
	
	
	
	var i = 0;
	$('#minus').click(function(){
		i--;
		if(i<0){
			
			$('span.adult').append().text(0);
			i = 0;	
			return;
			}
		
		$('span.adult').append().text(i);
		
		$('input.adult').attr('value', i);
		
		

	});
	
	$('#plus').click(function(){
		i++;
		
		$('span.adult').append().text(i);
		
		$('input.adult').attr('value', i);
	});
	
	
	var c = 0;
	$('#cminus').click(function(){
		c--;
		if(c<0){
			
		$('span.child').append().text(0);
		c = 0;	
		return;
			
		}
		
		$('span.child').append().text(c);
		$('input.child').attr('value', i);
	});
	
	$('#cplus').click(function(){
		c++;
		
		$('span.child').append().text(c);
		$('input.child').attr('value', c);
		
	});
	
	var r = 0;
	$('#rminus').click(function(){
		r--;
		if(r<0){
			
		$('span.room').append().text(0);
		r = 0;	
		return;
			
		}		
		$('span.room').append().text(r);
		$('input.room').attr('value', r);
	});
	
	$('#rplus').click(function(){
		r++;
		
		$('span.room').append().text(r);
		$('input.room').attr('value', r);
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 $.datepicker.setDefaults({
		 dateFormat: 'yy-mm-dd',
		 showOn: "both"
		,buttonImageOnly: true
		,buttonText: ""
		,minDate: "+1D"
		,maxDate: "+1Y"
		 
	 });
	
	 
	 $('#datepicker').datepicker('setDate', '+1D');
	
	 $("#datepicker").datepicker(); 
	 $("#datepicker2").datepicker();
	 
	 
	 /***hover 효과 **********************/
	 
	 
	  $('.oneimage').mouseover(function(){
		 $(this).children('p').addClass('imageshadow');
		 
	 });
	 
	 $('.oneimage').mouseout(function(){
		 $(this).children('p').removeClass('imageshadow');
		 
	 });
	 $('.twoimages').mouseover(function(){
		 $(this).children('p').addClass('imageshadow');
		 
	 });
	 
	 $('.twoimages').mouseout(function(){
		 $(this).children('p').removeClass('imageshadow');
		 
	 });
	 $('.threeimages').mouseover(function(){
		 $(this).children('p').addClass('imageshadow');
		 
	 });
	 
	 $('.threeimages').mouseout(function(){
		 $(this).children('p').removeClass('imageshadow');
		 
	 });
	 $('.fiveimages').mouseover(function(){
		 $(this).children('p').addClass('imageshadow');
		 
	 });
	 
	 $('.fiveimages').mouseout(function(){
		 $(this).children('p').removeClass('imageshadow');
		 
	 });
	 
	 
	 
	
	

});

</script>







<meta charset="UTF-8">
<title>Insert title here</title>

<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
<link href="<c:url value="/js/test.js" />" rel="stylesheet">
<link href="<c:url value="/css/test.css" />" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<style>
/***drop   *********************************************/



</style>




</head>
<body>
<%@include file="/WEB-INF/common/header.jsp"%>

	
	    
<%-- <header class="main-menu">
		<a href="main.jsp" class="main">호텔로고자리</a> 
		<c:if test="${sessionScope.loginfo == null }">
			<a class="main-login" href="register.mem" >회원가입</a>
			<a href="#" onclick="login()" class="main-login">로그인</a>
		</c:if>
		<c:if test="${sessionScope.loginfo != null }">
			<a href="#" onclick="logout()" class="main-login" >로그아웃</a>
			<span></span>
			<div class="drop">
				<span style="color:white">"${sessionScope.loginfo.m_name }"</span>
				<div class="drop-content">
					<a href="info.mem">내 정보</a> 
					<a href="memberReservationForm.der">내 예약 현황</a>
				</div>
			</div>
			
		
		</c:if>
	
		<a class="mainright" href="selMain.sel">판매자</a>
		<a class="mainright" href="#">고객센터</a>
	
</header> --%>
	
	

<div class="main-wrapper">
	<div class="searcharea">
	
	<h3>특가 검색 - 다양한 호텔들을 검색해보세요</h3>
	<p>아늑한 펜션부터 모던한 아파트까지!</p>
	
	
	
	
		<form action="Search.ho" method="post">
			<div class="searchinput">
				<i class="material-icons">airplanemode_active</i>
				<input type="text" name="area" placeholder="지역을 입력하세요">
			
				<p class="searcharea-p scheduler"><i class="material-icons">event</i>
				<input name="checkin" type="text" id="datepicker" placeholder="체크인" autocomplete="off">
				<input name="checkout" type="text" id="datepicker2" placeholder="체크아웃" autocomplete="off">
				</p>
				
				

			
				<div id="person" class="searcharea-p">&nbsp;<i class="material-icons">face</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;성인&nbsp;:&nbsp;<span class="adult">0</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아동&nbsp;:&nbsp;<span class="child">0</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;객실&nbsp;:&nbsp;<span class="room" >0</span>&nbsp;</div>
				<input type="hidden" name="adult" class="adult" value="0">
				<input type="hidden" name="child" class="child" value="0">
				<input type="hidden" name="room" class="room" value="0">
				
				
				
				
				
				
				<div class="personbox">
					<div class="perbox-box">
					<div>성인:<input id="minus" class="calc" type="button" value="-"><span class="adult">0</span><input id="plus" class="calc" type="button" value="+"></div>
					<div>아동:<input id="cminus" class="calc" type="button" value="-"><span class="child">0</span><input id="cplus" class="calc" type="button" value="+"></div>
					<div>객실:<input id="rminus" class="calc" type="button" value="-"><span class="room">0</span><input id="rplus" class="calc" type="button" value="+"></div>
					</div>
				</div>

			
				<input class="mainsubmitbtn" type="submit" value="검색">
			
			</div>
		</form>
	</div>
</div>



<div class="middleMain">
<h3 class="inserttitles">AAA에서만 만날 수 있는 특별한 이벤트</h3>
	<div class="row">
		
		
		<div class="oneimage"  style="background: url(resources/img/gng1.png) no-repeat center top; background-size:contain;">
			<p></p>
		</div>
		<div class="oneimage"  style="background: url(resources/img/광고2.png) no-repeat center top; background-size:contain;">
			<p></p>
		</div>
	
	
	</div>
		<h3 class="inserttitles">지금 떠나면 좋은 추천여행지</h3>
	<div class="row">
		
		<div class="twoimages"  style="background: url(resources/img/1.jpg) no-repeat center top; background-size:cover;">
			<p  class="imagetext" >
				서울
			</p>
		</div>
		
		<div class="twoimages"  style="background: url(resources/img/2.jpg) no-repeat center top; background-size:cover;">
			<p class="imagetext">
				제주도
			</p>
		</div>
	
	
	</div>
	
	<div class="row">
		
		
		<div class="threeimages"  style="background: url(resources/img/3.jpg) no-repeat center top; background-size:cover;">
			<p class="imagetext">
				부산
			</p>
		</div>
		
		<div class="threeimages"  style="background: url(resources/img/6.jpg) no-repeat center top; background-size:cover;">
			<p class="imagetext">
				벳푸
			</p>
		</div>
		
		<div class="threeimages"  style="background: url(resources/img/5.jpg) no-repeat center top; background-size:cover;">
			<p class="imagetext">
				싱가포르
			</p>
		</div>
	
	
	</div>
	
<h3 class="inserttitles">한국인이 사랑하는 여행지</h3>

<div class="row">
		
		
		<div class="fiveimages"  style="background: url(resources/img/7.jpg) no-repeat center top; background-size:cover;">
			<p class="imagetext">
				대구
			</p>
		</div>
		
		<div class="fiveimages"  style="background: url(resources/img/8.jpg) no-repeat center top; background-size:cover;">
			<p class="imagetext">
				 강릉
			</p>
		</div>
		
		<div class="fiveimages"  style="background: url(resources/img/9.jpg) no-repeat center top; background-size:cover;">
			<p class="imagetext">
				나트랑
			</p>
		</div>
		<div class="fiveimages"  style="background: url(resources/img/10.jpg) no-repeat center top; background-size:cover;">
			<p class="imagetext">
				다낭
			</p>
		</div>
		<div class="fiveimages"  style="background: url(resources/img/11.jpg) no-repeat center top; background-size:cover;">
			<p class="imagetext">
				타이베이
			</p>
		</div>
		
		
	
	
	</div>











</div>
<br><br><br>

<div class="nothingReally">
		<h3 class="nothingReallyText">시간도 돈도 아끼는 일석이조의 현명한 선택!</h3>
		<h4 class="nothingReallyText">가입하시면 최고의 특가 정보를 보내드릴게요</h4>
		<p class="nothingReallyText"><input type="text" placeholder="이메일 주소를 입력해주세요"><button class="nothingReallybtn" type="button">구독하기</button></p>
</div>


































<%@include file="/WEB-INF/common/footer.jsp"%>


	
	<!-- <footer class="modal-footer footer">
		
		<div class="foot">
			<div class="logo">
				<img src="">
			</div>
			
			<div class="companyInfo">
				<strong>
					(주)AAA | 대표이사 : XXX | 사업자 등록번호 : 111-11-11111 | 통신판매업 신고 : 강남-14211호 | 메일 : admin@admin.com<br>
					관광사업자 등록번호 : 제2019-1031호 | 주소 : 이대역 | 호스팅서비스 제공자 : 주식회사 AAA<br>
					고객센터 : 1577-1577 (오전 9시 - 오후 6시)
				</strong>
			</div>
			
			<div class="companyInfo2">
				<table>
					<tr>
						<th><a class="footatag" href="#">회사소개</a></th>
						<th><a class="footatag" href="#">광고&제휴 문의</a></th>
						<th><a class="footatag" href="#">인재채용</a></th>
						<th><a class="footatag" href="#">개인정보처리방침</a></th>
						<th><a class="footatag" href="#">청소년 보호 정책</a></th>
						<th><a class="footatag" href="#">서비스 이용 약관</a></th>
						<th><a class="footatag" href="#">위치정보 이용약관</a></th>
						<th><a class="footatag" href="#">사업자 정보 확인</a></th>
					</tr>
				</table>
			</div>
	
			<div class="companySns">
				<a class="footatag"  href="https://www.facebook.com">FaceBook</a>		
				<a class="footatag"  href="https://www.instagram.com">Instagram</a>		
				<a class="footatag"  href="https://www.youtube.com">Youtube</a>		
				<a class="footatag"  href="https://www.blog.naver.com">Naver Blog</a>		
				<a class="footatag"  href="https://www.twitter.com">Twitter</a>		
			</div>
			
			<div class="notice">
				(주) AAA는 통신판매 중개자로서 통신판매의 당사자가 아니며 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.
			</div>
		</div>
	
	
	 </footer> -->
</body>
</html>