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
	 
	 
	 
	
	

});

</script>


<script type="text/javascript">
function login() {
	var popupX = (window.screen.width/2)-(500/2);
	var popupY = (window.screen.height/2)-(500/2);
	
	window.open(	
			'login.mem','_blank','height=500, width=500, toolbar=no, menubar=no, location=no, scrollbars=no, status=no, resizable=no, fullscreen=no, channelmode=yes, left='+ popupX +', top='+ popupY
			); return false
}
function logout() {
	location.href="logout.mem";
	alert("로그아웃 되었습니다");
}
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
.drop {
	position: relative;
	display: inline-block;
	float: right;
	margin: 20px;
}
.drop-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.drop-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.drop-content a:hover {background-color: #f1f1f1}
.drop:hover .drop-content {
  display: block;
}
.drop:hover .drop span {
  background-color: #3e8e41;
}


</style>




</head>
<body>

	
	
	    
<header class="main-menu">
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
	
</header>
	
	

<div class="main-wrapper">
	<div class="searcharea">
	
	<h3>특가 검색 - 다양한 호텔들을 검색해보세요</h3>
	<p>아늑한 펜션부터 모던한 아파트까지!</p>
	
	
	
	
		<form action="Search.ho" method="post">
			<div class="searchinput">
				<i class="material-icons">airplanemode_active</i>
				<input type="text" name="area" placeholder="지역을 입력하세요">
			
				<p class="searcharea-p scheduler"><i class="material-icons">event</i>
				<input name="checkin" type="text" id="datepicker" placeholder="체크인">
				<input name="checkout" type="text" id="datepicker2" placeholder="체크아웃">
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


	
	<footer class="modal-footer footer"> 만든이: 손안우 신서영 윤서호 이병화 </footer>
</body>
</html>