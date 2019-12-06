<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$(function() {
		
		
		
		
			
			$('.leftbtn').click(function(){
				$('.hi-1').animate({marginLeft:'+=205px'});
			});
			$('.rightbtn').click(function(){
				$('.hi-1').animate({marginLeft:'-=205px'});
			});
			
			
			
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			//******** ADUlt********************************************************************
			var i = 0;
			var ori = $('input.adult').val();
			ori = parseInt(ori);
			
			
			$('#minus').click(function(){
				i--;
				
				if((ori+i)<0){
					ori = 0;
					i = 0;
				}
				
				$('span.adult').append().text(ori+i);
				$('input.adult').attr('value', ori+i);
				
				

			});
			
			$('#plus').click(function(){
				i++;
				
				$('span.adult').append().text(ori+i);
				
				$('input.adult').attr('value', ori+i);
			});
			
			//********CHILD      ***********************************************************
			var c = 0;
			var orc = $('input.child').val();
			orc = parseInt(orc);
			$('#cminus').click(function(){
				c--;
				if((orc+c)<0){
					orc = 0;
					c = 0;
				}
				
				$('span.child').append().text(orc+c);
				$('input.child').attr('value', orc+c);
			});
			
			$('#cplus').click(function(){
				c++;
				
				$('span.child').append().text(orr+r);
				$('input.child').attr('value', orc + c);
				
			});
			
			//********room*********************************************************************
			var r = 0;
			var orr = $('input.room').val();
			orr = parseInt(orr);
			$('#rminus').click(function(){
				r--;
				if((orr+r)<0){
					orr = 0;
					r = 0;
				}
				
				$('span.room').append().text(orr+r);
				$('input.room').attr('value',orr+ r);
			});
			
			$('#rplus').click(function(){
				r++;
				
				$('span.room').append().text(orr+r);
				$('input.room').attr('value',orr+ r);
				
			});
		
		
		
			//********DATE********************************************************************
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
		 
		 
		//********select 하면 select한 값이 span 에 들어가게 하기********************************************
		$('.selectroom').change(function(){
			
			var roonprice = $('.selectroom option:selected').val();
			alert($('.totalprice').text());
			
			$('.totalprice').append(roonprice);
			
			
		});
		
		
		
		

	});
</script>
<style>
	.hoteltype{
		font-size: 70%;
		font-weight: lighter;
	}
	#imageArea{
		background-color: #D4F4FA;
		width: 95%;
		
		margin:20px;
		
	}
	
	hr{
		width: 95%;
		margin:20px;
		
	}
	.hotelimage{
		margin:auto;
		padding:15px;
	}
	#hotelcomment{
		background-color: #D4F4FA;
		width: 95%;
		
		margin:20px;
		
	}#hoteloptions{
		width: 95%;
		margin:20px;
		
	}
	#hoteladdress{
		margin:20px;
		
	}#hotelname{
		margin:20px;
		
	}
.rightbar{
	width: 70%;
	height:auto;
	border: 2px solid #b7b7b7;
	float:right;
	border-radius:5px;
}
	
/*****************left bar*********************/
.left-bar {
	width : 25%;
	height: auto;
	border:1px solid green;
	margin-left: 30px;
}

.calc {
	border: 2px solid #ff6b09;
    background: white;
    padding: 10px;
    margin: 10px;
    border-radius: 5px;	
}

.mainsubmitbtn{
	border: none;
    background: #ff501b;
    margin: 9px 70%;
    border-radius: 5px;
    font-size: 30px;
}
.mainsubmitbtn:hover {
	background: #e47b31;
}
.leftbar input {
	padding: 5px;
}
.leftSearch-wrap {
	
	background: #ffa114ad;
    border-radius: 5px;
    margin: 5px;
	
}

.leftsearch-form {
	text-align: center;
	padding: 10;
}
h4 {
	font-size: 22px;
	margin: 0px;
    background: #ff5919;
    padding: 9px;
    border-radius: 5px;
}

.register-wrap {
	margin: 20px;
}

/******register  부터 **********************************************/
.register-check {
	border: 1px solid #ababab;
    width: 100%;
    border-radius: 5px;
}

.register-check td {
    border-right: 1px solid #d4d4d4;
    width:33.33333%;
}
.register-check-last {
	border:none;
}



	
</style>
</head>
<body>
<div class="rightbar">
<div>
	<div id="hotelname"><h2><span class="hoteltype">${hotel.h_type }&nbsp;&nbsp;&nbsp;</span>${hotel.h_name }</h2></div>
	<div id="hoteladdress"><p>${hotel.h_address2 } , ${hotel.h_address1 }, ${hotel.h_nation }</p></div>
	<div id="imageArea">  
		<c:forEach items="${hotel.images }" var="image">
			<img class="hotelimage" src="<%=request.getContextPath() %>/resources/Hotelimages/${hotel.h_name }/${image }" width="200px" height="200px">
		</c:forEach>
	</div>
	<hr>
	<div id="hotelcomment">
		${hotel.h_comment } 
	</div>	
	<hr>
	<div id="hoteloptions">
		<h2 style="background-color: #EAEAEA">호텔 시설</h2>
		<p class="facilities"><span style="font-weight: bold">편의시설&nbsp;</span>${hotel.h_facilities}</p><hr style="margin:0; width: 95%;">
		<p class="internet"><span style="font-weight: bold">인터넷&nbsp;&nbsp;&nbsp;&nbsp;</span>${hotel.h_internet}</p><hr style="margin:0;">
		<p class="animal"><span style="font-weight: bold" >반려동물&nbsp;&nbsp;&nbsp;&nbsp;</span>${hotel.h_animal}</p><hr style="margin:0; ">
		<p class="parking"><span style="font-weight: bold">주차&nbsp;&nbsp;&nbsp;&nbsp;</span>${hotel.h_parking}</p><hr style="margin:0; ">
		<p class="smoke"><span style="font-weight: bold">흡연구역&nbsp;&nbsp;&nbsp;&nbsp;</span>${hotel.h_smoke}</p><hr style="margin:0; ">
		<p class="language"><span style="font-weight: bold">지원가능언어&nbsp;&nbsp;&nbsp;&nbsp;</span>${hotel.h_language}</p><hr style="margin:0; ">
	</div>
	</div>


	<div class="register-wrap">
		<h3>예약 가능 여부</h3>
		<table class="register-check">
			<tr>
				<td>
					<p>체크인</p>
					<p>${param.checkin }</p>
				
				</td>
				<td>
					<p>체크아웃</p>
					<p>${param.checkout }</p>
				</td>
				<td class="register-check-last"><p>성인 : ${param.adult }</p><p>아이 : ${param.child }</p></td>
			
			
			</tr>
	
		
		</table>
		
		<table>
		
		
			<tr>
				<td>객실 유형</td>
				<td>정원</td>
				<td>가격</td>
				<td>객실 선택</td>
				<td>dsfsdsd</td>
			
			</tr>
			<c:forEach items="${rooms }" var="room" varStatus="i"> 
				<tr>
				<td>${room.r_type }</td>
				<td>${room.r_person }</td>
				<td>${room.r_price }</td>
				<td>
					<select class="selectroom">
						<option selected>0
					<c:forEach begin="0" end="${room.r_stock }" varStatus="i"> 
						
						<c:set var="price" value="${room.r_price }" />
						<fmt:formatNumber value="${price}" type="number" var="numberType" />
						<c:set var="namy" value="${i.count }" />
						<fmt:formatNumber value="${namy}" type="number" var="numberType" />
					
					
						<option>${i.count }&nbsp;(${price * namy })
					</c:forEach>
					</select>
				</td>
				<td colspan="i">
					<span class="totalprice"></span>
					
				</td>
				
			
			</tr>
			
			
			</c:forEach>
			
		
		
		
		</table>
	
	</div>
	
		
</div>
	
	
	
	
	
	
	
	
	
	
	
	<div class="left-bar">
		
		
		
		<div class="leftSearch-wrap">
			<form action="Search.ho" method="post" class="leftsearch-form">
				<h4>검색</h4>
				<div class="searchinput">
					<i class="material-icons">airplanemode_active</i> <input
						type="text" name="area" placeholder="지역을 입력하세요"
						value="${param.area }">

					<p class="searcharea-p scheduler">
						<i class="material-icons">event</i>&nbsp;
						<input name="checkin" type="text" id="datepicker" placeholder="체크인" value="${param.checkin }"><br> 
							<i class="material-icons">event</i>&nbsp;
							<input name="checkout" type="text" id="datepicker2" placeholder="체크아웃" value="${param.checkout }">
					</p>




					<div id="person" class="searcharea-p">
						&nbsp;<i class="material-icons">face</i><br>
						성인:<span class="adult">${param.adult }</span>&nbsp;&nbsp;
						아동:<span class="child">${param.child }</span>&nbsp;&nbsp;
						객실:<span class="room">${param.room }</span>&nbsp;
					</div>

					<div class="personbox">
						<div class="perbox-box">
							<div>
								성인:<input id="minus" class="calc" type="button" value="-"><span
									class="adult">${param.adult }</span><input id="plus" class="calc"
									type="button" value="+">
							</div>
							<div>
								아동:<input id="cminus" class="calc" type="button" value="-"><span
									class="child">${param.child }</span><input id="cplus" class="calc"
									type="button" value="+">
							</div>
							<div>
								객실:<input id="rminus" class="calc" type="button" value="-"><span
									class="room">${param.room }</span><input id="rplus" class="calc"
									type="button" value="+">
							</div>
						</div>
					</div>

					<input type="hidden" name="adult" class="adult" value="${param.adult }">
					<input type="hidden" name="child" class="child"  value="${param.child }">
					<input type="hidden" name="room" class="room"  value="${param.room }">
					<input class="mainsubmitbtn" type="submit" value="검색">

				</div>
			</form>

		</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</div>











</body>
</html>