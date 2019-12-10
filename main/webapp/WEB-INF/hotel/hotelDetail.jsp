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
		 
		 
		//********Room price picker *****************************************************************
		
		
	
		
		
		$('select.selectroom').change(function(){
			var sum=0;
			var alltype='';	
			var roomname = $('.rtypehidden').val();
			
			var price = $('select.selectroom option:selected').val();

			$('select.selectroom').each(function(index) {
				
				var tempAmt= $(this).val();
				
				price = parseInt(tempAmt);
				sum = sum + price;
				
				
					
			});
				
			var total = sum;
			$('.totalprice1').empty();
			
			
			alltype = alltype + roomname;
			
			$('input.totalprice').attr('value',total);
			$('.totalprice1').append(
					'<div class="totalreservate">'+total+'원'+
					'<br><a>세금 및 기타 요금 포함</a>'+
					'<ul><li>즉시 예약 확정</li><li>가입이 필요 없습니다</li><li>예약 수수료, 신용카드 수수료 없음!</li></ul>'+
					'<button onclick="javascript:reservate()" >예약하기</button></div>');
			
		//******************************예약하기 창으로 방 이름  넘기기********************************************
			
			var originVal = $('.rtypename').text();
			$('.rtypename').attr('value',alltype);
			//alert('origin:'+originVal); 
			
			//$('.rtypename').append(roomname);
			//alert(alltype);

			
			
			
			
			
			
			
			
			
			
			
			
			
			
		});
		
		
		
		
		
	
		
	
		

	});
</script>
<script type="text/javascript">

		function reservate(){
			$('form[name=roomreservate]').submit();
			
		}	

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

/******register table   부터 **********************************************/
table {
    width: 100%;
}
.rtype {
	width: 30%;
    
}
.rperson {
	width: 10%;
	
}

.rprice, .rselect,.rtotal{
	width:20%;
	
}
.rtr {
	background: #2b76ffe0;
    color: white;
}
.someitems {
	display:block;
	font-size:10px;
	color:green;
}


.totalreservate {
	position: relative;
    background: #90bcff96;
    padding: 10px;
    margin: 10px;
}










	
</style>
</head>
<body>
<div class="rightbar">
<div>
	<input type="hidden" name="num" value="${hotel.num }">
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
		<!--  ****************************************************************************************************************    ******-->
	<form action="reservate.ho" method="post" class="roomreservate" name="roomreservate">
				
				
				<input type="hidden" name="area" class="area" value="${param.area }">
				<input type="hidden" name="checkin" class="adult" value="${param.checkin }">
				<input type="hidden" name="checkout" class="adult" value="${param.checkout }">
				<input type="hidden" name="adult" class="adult" value="${param.adult }">
				<input type="hidden" name="child" class="child" value="${param.child }">
				<input type="hidden" name="room" class="room" value="0">
		<table>
		
		
			<tr class="rtr">
				<td>객실 유형</td>
				<td>정원</td>
				<td>가격</td>
				<td>객실 선택</td>
				<td></td>
			
			</tr>
			<c:forEach items="${rooms }" var="room" varStatus="r"> 
				<tr>
				<td class="rtype"><input type="hidden" class="rtypehidden" value="${room.r_type }">${room.r_type }
					<ul class="someitems">
					<c:if test="${fn:contains(room.r_type, '디럭스')}">
						<li>샤워기</li>
						<li>전용 욕실</li>
						<li>방음 시설</li>
						<li>침대 옆 콘센트</li>
						<li>엘리베이터로 위층 이동 가능</li>
					</c:if>
					<c:if test="${fn:contains(room.r_type, '패밀리')}">
						<li>가족 객실</li>
						<li>도시 전망</li>
						<li>방음 시설</li>
						<li>침대 옆 콘센트</li>
						<li>엘리베이터로 위층 이동 가능</li>
					</c:if>
						<li>무료 Wi-Fi</li>
						<li>화장실</li>
						<li> TV</li>
						<li>헤어드라이어</li>
						<li>냉장고</li>
						<li>난방 시설</li>
						<li>에어컨</li>
						<li>타월</li>
						<li>슬리퍼</li>
						</ul>
				</td>
				<td class="rperson">${room.r_person }</td>
				<td class="rprice"><input type="hidden" name="r_price" value="${room.r_price }">${room.r_price }</td>
				<td class="rselect">
					<select class="selectroom">
						<option selected value="0">0
					<c:forEach begin="0" end="${room.r_stock }" varStatus="i"> 
						
						<c:set var="price" value="${room.r_price }" />
						<fmt:formatNumber value="${price}" type="number" var="numberType" />
						<c:set var="namy" value="${i.count }" />
						<fmt:formatNumber value="${namy}" type="number" var="numberType" />
					
						<option value="${price * namy }">${i.count }&nbsp;(${price * namy })
					</c:forEach>
					</select>
				</td>
				<td class="rtotal">
					
					<span class="totalprice${r.count }"></span>
					
					
				</td>
				
			
			</tr>
			
			
			</c:forEach>
			
		
		
		
		</table>
		<input type="hidden" name="hname" value="${hotel.h_name }">
		<input class="rtypename" type="hidden" name="r_type" >
		<input class="totalprice" type="hidden" name="totalprice" >
	</form>	
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