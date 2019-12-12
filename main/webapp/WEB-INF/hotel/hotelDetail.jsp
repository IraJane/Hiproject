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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
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
		
		
	
		var sellength = $('select.selectroom').length
		
		$('select.selectroom').change(function(){
			
			var sum=0;
			var alltype='';	
			var roomname = $('.rtypehidden').val();
			
			var price = $('select.selectroom option:selected').val();
			var roomname = '';
			var getHowmany = '';
			
			var i = 0;
			$('select.selectroom').each(function(index) {
				
				var tempAmt= $(this).val();
				price = parseInt(tempAmt);
				
				sum = sum + price;
				
				/* for(var i = 0;i<sellength;i++){ */
					 
					var room = $('.rtypehidden-'+i).val();
					var oneprice = $('.r_price-'+i).val(); //한개당 가격 가지고 올 
					
					var people = price / oneprice;
					
					
					if(price == 0){
						oneprice = '';
						room = '';
						i++;
						return;
					} else if(price != ''){
						
						i++;
						
						roomname = roomname +','+ room;
						getHowmany = getHowmany +','+ people; 
						
					}
				/* } */
				
					
			});
				
			var total = sum;
			$('.totalprice1').empty();
			
			
			alltype = alltype + roomname;
			
			$('input.totalprice').attr('value',total);
			$('.totalprice1').append(
					'<div class="totalreservate">'+total+'원'+
					'<br><input type="hidden" name="whichrooms" value="'+roomname+'">'+
					'<br><input type="hidden" name="howmanyrooms" value="'+getHowmany+'">'+
					'<br><a>세금 및 기타 요금 포함</a>'+
					'<ul><li>즉시 예약 확정</li><li>가입이 필요 없습니다</li><li>예약 수수료, 신용카드 수수료 없음!</li></ul>'+
					'<button class="reservatebtn" onclick="javascript:reservate()" >예약하기</button></div>');
			
			
			
			
			
			
			
			
		//******************************예약하기 창으로 방 이름  넘기기********************************************
			
			
				
			
			
		
			
			
			
			
			
			
			
			
			
			
		});
		
		
		
		
		
	
		
	
		

	});
</script>
<script type="text/javascript">

		function reservate(){
			$('form[name=roomreservate]').submit();
			
		}	
		
		
		
		function clickRoomTypeinfo(){
			
			$("<div>").css({
			  	"border": "1px solid #CCC",
			    "width": "50%",
			    height: "400px",
			    position: "absolute",
			    left: "100px",
			    top: "50px",
			    background: "#FFF",
			    margin:'auto'
			  }).html('<h1>fdfdf</h1>'
					  + '<button type="button" class="close" aria-label="Close">'
					  + '<span aria-hidden="true">&times;</span>'
					  + '</button>').appendTo(document.body);
			
		}

</script>
<style>
body {
	margin:0;
}

h1{
	display: inline-block;
}
	.hoteltype{
		font-weight: lighter;
    background: #bfbfbf;
    color: white;
    margin: 0;
    border-radius: 5px;
	}
	#imageArea{
		background-color: #4587ffb0;
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

	#hoteloptions{
		width: 95%;
		margin:20px;
		
	}
	#hoteladdress{
		margin:20px;
		
	}#hotelname{
		margin:20px;
		
	}
.rightbar{
	width: 77%;
	height:auto;
	border: 2px solid #b7b7b7;
	float:right;
	border-radius:5px;
}
	
/*****************left bar*********************/
.left-bar {
	    width: 20%;
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
    background: #040cf1;
    margin: 9px 70%;
    border-radius: 5px;
    font-size: 25px;
    padding: 5px;
    color: white;
}
.mainsubmitbtn:hover {
	background: #e47b31;
}
.leftbar input {
	padding: 5px;
}
.leftSearch-wrap {
	
background: #ffe0b1;
    border-radius: 5px;
    margin: 15px;
	
}

.leftsearch-form {
	text-align: center;
	padding: 10;
}
h4 {
    font-size: 22px;
    margin: 0px;
    background: #febb02;
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
	border-right: none !important;
	
}

/******register table   부터 **********************************************/
table {
    width: 100%;
}



.rtype {
	width: 25%;
    
}
.rperson {
	width: 10%;
	
}

.rprice, .rselect{
	width:20%;
	
}
.rtotal{
	width: 25%;
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

.reservatebtn {
	    border: none;
    background: #0000ca;
    color: white;
    padding: 5px;
    border-radius: 5px;
    width: 100%;
}


/************************right bar 의 comment     wrapper   **********************************/
.hotelComment-table{
	 width: 98%;
    margin: auto;
}

.hotelComment-table tbody{
	    width: 100%;
}
.hotelComment-table tr{
	    display: flex;
}
.leftTd {
	flex-basis: 70%;
}
.rightTd {
	flex-basis: 27%;
}
.hotelComment-area{
    color: #ff6a00;
    font-weight: 900;
    width:68%;
   
}

#hotelcomment{
		/* background-color: #4587ffb0; */
	display:inline-block;
	width:60%;
	padding: 10px;
	margin:20px;
		
}
.rightbox-hotel-wrapper{
	width:100%;
	

}
.rightbox-comments{
    width: 30%;
    display: inline-block;
	
}
.rightbox-commentbox {
	background: #a2cbffa1;
    width: 80%;
    margin: auto;
    border: 1px solid #9d9dff;
    padding: 10px;
}
.rightbox-commentbox h4 {
	    background: none;
}



/************************detail    wrapper   **********************************/
.hoteloption-list{
	width:95%;
	margin:auto;

}

.detail-wrapper{
    display: inline-block;
    width: 100%;
    position: relative;
    margin: 0 20px;
}
.detail-famous-wrapper {
	display: inline-flex;
	width: 100%;
}
.famous-wrapper {
    width: 32.3333333333%;
    
}


/****search 부분 ******/
.adultselect {
    width: 80%;
    border: none;
    padding: 5px;
    background: white;
    border-radius: 5px;
    font-size: 15px;
    margin: 10px;
}
.crselect{
	width: 39%;
    border: none;
    padding: 5px;
    border-radius: 5px;
    font-size: 13px;
}

.searchinputSpan {
	font-size: 12px;
}

.inputbox {
 padding: 8px;
    border: none;
    border-radius: 5px;
}











	
</style>
</head>
<body>
<div class="rightbar">
<div>
	<input type="hidden" name="h_num" value="${hotel.h_num }">
	<div id="hotelname"><span class="hoteltype">${hotel.h_type }</span>&nbsp;&nbsp;<h1>${hotel.h_name }</h1></div>
	<div id="hoteladdress"><p><i class="material-icons">navigation</i>${hotel.h_address2 } , ${hotel.h_address1 }, ${hotel.h_nation }</p></div>
	<div id="imageArea">  
		<c:forEach items="${hotel.h_image }" var="image">
			<img class="hotelimage" src="<%=request.getContextPath() %>/resources/Hotelimages/${hotel.h_name }/${image }" width="200px" height="200px">
		</c:forEach>
	</div>
	<hr>
	
	
	
	
	
	<table class="hotelComment-table">
	
		<tr>
			<td>
				<div id="hotelcomment">
					<a>${hotel.h_nation } 추천 숙소</a><br>
			
					<pre>
					라마다 앙코르 서귀포 호텔은 레스토랑, 카페, 피트니스 센터 및 비즈니스 시설을 운영하고 있으며,
					 제주 월드컵경기장에서 차로 단 5분 거리에 있습니다. 이 호텔은 공용 공간에 Wi-Fi를 제공하며,
					  무료 구내 주차장을 보유하고 있습니다.
					${hotel.h_comment }
					</pre> 
				</div>
			</td>
			<td>
				<div class="rightbox-commentbox">
				<h4>투숙객이 좋아해요</h4>
				<p><b>조식 정보</b></p>
				<span>채식, 아시안, 미국식 조식, 뷔페</span>
			
			
				</div>
			
			
			</td>
			
			
			
	
		</tr>
	
	
	
	</table>
	
	
	
		
	<hr>
	<div id="hoteloptions">
		<h2>호텔 시설</h2>
		<div class="hoteloption-list">
				
			<p class="facilities"><span style="font-weight: bold">편의시설&nbsp;</span>${hotel.h_facilities}</p><hr style="margin:0; width: 95%;">
			<p class="internet"><span style="font-weight: bold">인터넷&nbsp;&nbsp;&nbsp;&nbsp;</span>${hotel.h_internet}</p><hr style="margin:0;">
			<p class="animal"><span style="font-weight: bold" >반려동물&nbsp;&nbsp;&nbsp;&nbsp;</span>${hotel.h_animal}</p><hr style="margin:0; ">
			<p class="parking"><span style="font-weight: bold">주차&nbsp;&nbsp;&nbsp;&nbsp;</span>${hotel.h_parking}</p><hr style="margin:0; ">
			<p class="smoke"><span style="font-weight: bold">흡연구역&nbsp;&nbsp;&nbsp;&nbsp;</span>${hotel.h_smoke}</p><hr style="margin:0; ">
			<p class="language"><span style="font-weight: bold">지원가능언어&nbsp;&nbsp;&nbsp;&nbsp;</span>${hotel.h_language}</p><hr style="margin:0; ">
		</div>
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
				<td class="register-check-last"><p>성인 : ${param.adult }</p><p>아이 : <c:if test="${param.child ==0 }">0</c:if><c:if test="${param.child !=0 }">${param.child }</c:if></p></td>
			
			
			</tr>
	
		
		</table>
		<!--  ****************************************************************************************************************    ******-->
	<form action="reservate.ho" method="post" class="roomreservate" name="roomreservate">
				
				
				<input type="hidden" name="area" class="area" value="${search.area }">
				<input type="hidden" name="checkin" class="adult" value="${search.checkin }">
				<input type="hidden" name="checkout" class="adult" value="${search.checkout }">
				<input type="hidden" name="adult" class="adult" value="${search.adult }">
				<input type="hidden" name="child" class="child" value="${search.child }">
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
				<td class="rtype">
					<input type="hidden">
					<input type="hidden" class="rtypehidden-${r.index }" value="${room.r_num }"><div onclick="clickRoomTypeinfo()">${room.r_type }</div>
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
						<li>${hotel.h_internet }</li>
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
				<td class="rprice"><input type="hidden" class="r_price-${r.index }" name="r_price" value="${room.r_price }">${room.r_price }</td>
				<td class="rselect">
					<select class="selectroom" >
						<option selected value="0">0
					<c:forEach begin="0" end="${room.r_stock }" varStatus="i"> 
						
						<c:set var="price" value="${room.r_price }" />
						<fmt:formatNumber value="${price}" type="number" var="numberType" />
						<c:set var="namy" value="${i.count }" />
						<fmt:formatNumber value="${namy}" type="number" var="numberType" />
					
						<option value="${price * namy  }">${i.count }&nbsp;(${price * namy })
					</c:forEach>
					</select>
				</td>
				<td class="rtotal">
					
					<span class="totalprice${r.count }"></span> <!-- 여기에 나중에 크기 조절 하기  -->
					
					
				</td>
				
			
			</tr>
			
			
			</c:forEach>
			
		
		
		
		</table>
		<input type="hidden" name="h_num" value="${hotel.h_num }">
		<input class="rtypename" type="hidden" name="selectedRooms" >
		<input class="rtypecount" type="hidden" name="selectedRoomcounts" >
		<input class="totalprice" type="hidden" name="totalprice" >
	</form>	
	</div>
	
	
	
	
	<div class="detail-wrapper">
	<h3>최고 인기 시설</h3>
		<div class="detail-famous-wrapper">
			
			<ul  class="famous-wrapper">
				<li>욕실</li>
				<li>화장지</li>
				<li>린넨</li>
				<li>타월</li>
				<li>비데</li>
				<li>욕조 또는 샤워기</li>
				<li>슬리퍼</li>
				<li>객실 내 전용 욕실</li>
				<li>화장실</li>
				<li>무료 세면도구</li>
				<li>목욕 가운</li>
				<li>헤어드라이어</li>
				<li>욕조</li>
				<li>샤워</li>
			
				<li>침실</li>
				<li>옷장</li>
				<li>긴 침대(2m 이상)</li>
			
				<li>반려동물</li>
				<li>애완동물 동반이 ${hotel.h_animal }합니다.</li>
			</ul>
		
			
			
			
			
		
			<ul class="famous-wrapper">
				<li>미디어/테크놀로지</li>
				<li>평면 TV</li>
				<li>케이블 채널</li>
				<li>위성 채널</li>
				<li>전화기</li>
				<li>TV</li>
			
				<li>식음료</li>
				<li>생수</li>
			
				<li>인터넷</li>
				<li>
					<c:if test="${fn:contains(hotel.h_internet,'무료') }">
					 Wi-Fi(은)는 호텔 전 구역에서 무료입니다
					</c:if>
					
					
				</li>
			
				<li>인터넷</li>
				<li>비상 알람이 설치된 화장실</li>
				<li>유닛 전역에서 휠체어 사용 가능</li>
				<li>엘리베이터로 위층 이동 가능</li>
				<li>지상층 전체 유닛</li>
			
				<li>주차</li>
				<li>
					<c:if test="${fn:contains(hotel.h_parking,'무료') }">
					호텔 내 (사전 예약 불필요) 전용 주차장이 무료로 이용 가능합니다.
					</c:if>
					<c:if test="${fn:contains(hotel.h_parking,'유료') }">
					호텔 내 (사전 예약 필요) 전용 주차장이 유료로 이용 가능합니다.
					</c:if>
				
				</li>
			
				<li>리셉션 서비스</li>
				<li>전용 체크인/체크아웃</li>
				<li>수하물 보관소</li>
				<li>환전</li>
				<li>24시간 프런트 데스크</li>
			</ul>
			
			
			
		
		
	
			
			<ul  class="famous-wrapper">
				<li>청소 서비스</li>
				<li>하우스키핑 (매일)</li>
				<li>다림질 서비스</li>
				<li>드라이클리닝 </li>
				<li>세탁 </li>
			
				<li>비즈니스 시설</li>
				<li>팩스/복사</li>
				<li>비즈니스 센터</li>
				<li>회의/연회 시설 </li>
			
				<li>보안 시설</li>
				<li>소화기</li>
				<li>숙소 외부 CCTV</li>
				<li>공용 공간 CCTV</li>
				<li>화염 경보</li>
				<li>보안 알람</li>
				<li>24시간 보안</li>
			
				<li>일반</li>
				<li>에어컨</li>
				<li>모닝콜 서비스</li>
				<li>금연 객실</li>
				<li>세탁 </li>
			</ul>
			
		

		
			
	
	
	</div>
	
	
	
	
	
	
	
	
	</div>
	
	
	<h3>이용 후기</h3>
	<div>
		<form>
			<p><textarea placeholder="후기 입력"></textarea></p>
			<input type="submit" value="등록">
		
		</form>
	</div>
	
	<div>
		후기들 여기에 들어옴 
	</div>
	
	
		
</div>
	
	
	
	
	
	
	
	
	
	
	
	<div class="left-bar">
		
		
		
		<div class="leftSearch-wrap">
			<form action="Search.ho" method="post" class="leftsearch-form">
				<h4>검색</h4>
				<div class="searchinput">
					<span class="searchinputSpan">여행지 이름:</span>
					<input class="inputbox" type="text" name="area" placeholder="지역을 입력하세요"
						value="${param.area }">
					<br>
					<p class="searcharea-p scheduler">
						<span class="searchinputSpan">체크인 날짜:</span>
						<input class="inputbox"  name="checkin" type="text" id="datepicker" placeholder="체크인" value="${param.checkin }">
						<br>
							<span class="searchinputSpan">체크아웃 날짜:</span>
							<input class="inputbox"  name="checkout" type="text" id="datepicker2" placeholder="체크아웃" value="${param.checkout }">
					</p>



					<div class="personbox">
						<div class="perbox-box">
							<div>
								
									<select class="adultselect">
									<c:forEach begin="1" end="20" var="p">
										
										<option class="adult" value="${p }" <c:if test="${param.adult == p }">selected</c:if>>성인: ${p }명
									
									</c:forEach>
									
									</select>
								
								
							</div>
							<div>
								
									<select class="crselect">
									<option <c:if test="${param.child == 0 }">selected</c:if>>아동 없음
									<c:forEach begin="1" end="20" var="p">
										
										<option class="child" value="${p }" <c:if test="${param.child == p }">selected</c:if>>아동: ${p }명
									
									</c:forEach>
									
									</select>
									
								
							
							
									<select class="crselect">
									
									<c:forEach begin="1" end="20" var="p">
										
										<option class="room" value="${p }" <c:if test="${param.room == p }">selected</c:if>>객실: ${p }개
									
									</c:forEach>
									
									</select>
								
								
								
							</div>
						</div>
					</div>

					<input type="hidden" name="adult" class="adult" value="${search.adult }">
					<input type="hidden" name="child" class="child"  value="${search.child }">
					<input type="hidden" name="room" class="room"  value="${search.room }">
					<input type="hidden" name="searchas" value="${search.searchas }">
					<input type="hidden" name="filterType" value="${search.filterType }">
					<input class="mainsubmitbtn" type="submit" value="검색">

				</div>
			</form>

		</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</div>











</body>
</html>