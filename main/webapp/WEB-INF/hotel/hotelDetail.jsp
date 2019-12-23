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
		 $("#datepicker3").datepicker(); 
		 $("#datepicker4").datepicker();
		 
		 
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
					'<br><input type="text" name="whichrooms" value="'+roomname+'">'+
					'<br><input type="text" name="howmanyrooms" value="'+getHowmany+'">'+
					'<br><a>세금 및 기타 요금 포함</a>'+
					'<ul><li>즉시 예약 확정</li><li>가입이 필요 없습니다</li><li>예약 수수료, 신용카드 수수료 없음!</li></ul>'+
					'<button class="reservatebtn" onclick="javascript:reservate()" >예약하기</button></div>');
			
			
			
			
			
			
			
			
			
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
		
		
		 function fnMove(cnt){
		        
		        if(cnt == 1){
			        var offset = $(".rtr").offset();
			        $('html, body').animate({scrollTop : offset.top}, 400);
		        	
		        } else if(cnt == 2){
			        var offset = $(".detail-wrapper").offset();
		        	$('html, body').animate({scrollTop : offset.top}, 400);
		        	
		        }  else if(cnt == 3){
			        var offset = $(".houserule-wrapper").offset();
		        	$('html, body').animate({scrollTop : offset.top}, 400);
		        	
		        }  else if(cnt == 4){
			        var offset = $(".review-wrapper").offset();
		        	$('html, body').animate({scrollTop : offset.top}, 400);
		        }
		        
		        	
		    }
</script>
<script type="text/javascript">
function pushLayer() {
	$('#myModal').show();
};
function close_pop(flag) {
	$('#myModal').hide();
};
function toSearch() {
	var checkin = $('#datepicker3').val();
	var checkout = $('#datepicker4').val();
	var adult = $('.madult').val();
	var child = $('.mchild').val();
	var room = $('.mroom').val();
	location.href="Search.ho?checkin="+checkin+"&checkout="+checkout+"&adult="+adult+"&child="+child+"&room="+room+"";
};
</script>
<style type="text/css">
.myModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}
.pop_bt{
	float:right;
}
</style>
<style>
body {
	margin:0;
}
.total-container{
	margin:30px 300px;
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
    margin: 0 22%;
	border-radius:5px;
}
	
/*****************left bar*********************/
.left-bar {
	    width: 20%;
	height: auto;
	border:1px solid green;
/* 	margin-left: 30px; */
	float:left;
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
    width: 26.33333%;
}
.register-check-last {
	border-right: none !important;
	
}
.infochangebtn{
	    border: none;
    background: none;
    color: blue;
    text-decoration: underline;
    font-size: 20px;
}
.infoAllbtn{
	width: 50%;
    margin: 30px;
    border: none;
    background: blue;
    padding: 10px;
    border-radius: 5px;
    color: white;
    font-size: 15px;
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
.material-icons{
	font-size:15px;
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
.rightbox-commentp{
	    width: 100%;
    margin: auto;
    text-align: center;
}
.rightbox-btn {
	    background: #0000c7;
    border: none;
    width: 100%;
    padding: 3px;
    margin: 5px auto;
    border-radius: 5px;
    color: white;
    font-size: 15px;
}
.rightbar-selectbox{
    list-style: none;
    width: 100%;
    margin: auto;
        padding: 0;
    text-align: center;
    background: #d2deff;
    border-bottom: 1px solid #0000a9;
}
.rightbar-selectbox li{
    display: inline-block;
        width: 24%;
}
/*********************상단부 select******/
.rightbar-selectbtn{
	border: none;
    background: #d2deff;
    width: 100%;
    /* margin: 0; */
    font-size: 20px;
    border-left: 1px solid white;
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
    list-style:none;
    
}
.famous-wrapper-title{
	font-size: 23px;
}
/***************하우스 룰****************/
.houserule-wrapper{
    width: 95%;
    margin: auto;
}
.houserule-title{
	font-size:20px;
	margin:0;
}
.houserule-subtitle{
	font-size:15px;
	margin:0;
}
.houserule-box{
	background: #abd5ffa8;
    border-radius: 5px;
    padding: 10px;
}
.houserule-titles{
	width:20%;
	padding: 10px;
}
.houserule-details{
	width: 80%;
	padding: 10px;
}
.houserule-checkin{
    border: 1px solid gray;
    width: 90%;
    border-radius: 10px;
    overflow: hidden;
    background: #e0e0e0;
        color: white;
}
.houserule-checkin-checkin{
	width: 40%;
    float: right;
    background: #003179d1;
}
.houserule-checkin-checkout{
	width: 40%;
   
    background: #003179d1;
}
.houserule-cardimg{
	
   
    /* border: 1px solid red; */
    height: 20px;
    width: 50px;
    display:inline-block;
}
.visa{
	background: url(./resources/img/visa.png) no-repeat top;
	 background-size: contain;
}
.master{
	background: url(./resources/img/master.png) no-repeat top;
	 background-size: contain;
	 height: 25px;
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
/******    *리뷰 **************/
.review-wrapper{
	    width: 95%;
    background: #c8e3ff;
    margin: 20px auto;
    padding: 10px;
}
	
</style>
</head>
<body>

<%@include file="/WEB-INF/common/header.jsp"%>
<div class="total-container">



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
	
	
		<!-- 지도를 담을영역 --> 
		<div id="map" style="width:95%;height:300px; border-radius:5px; padding:10; border:1px; margin:auto; margin-bottom:3px;">
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f8dac855d9fc96a72ecec0f6b94fa4b&libraries=services"></script>
		<script>
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
	
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			
			var geocoder = new kakao.maps.services.Geocoder(); // geocoder 객체 생성
			
			var addr="${hotel.h_address1}";
			geocoder.addressSearch(addr, function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
		</script>
		</div>
		
		
		
		<div id="myModal" class="myModal">
			<div class="modal-content">
				<span onclick="close_pop()" class="pop_bt" style="font-size: 13pt;">x</span>
				
				<div class="col-md-12 text-center">
					<h1>검색 하기</h1>
				</div>
				<form name="reviewForm" id="reviewForm">
					<p class="searcharea-p scheduler">
						<span class="searchinputSpan">체크인 날짜:</span>
						<input class="inputbox"  name="checkin" type="text" id="datepicker3" placeholder="체크인" value="${param.checkin }">
						<br>
							<span class="searchinputSpan">체크아웃 날짜:</span>
							<input class="inputbox"  name="checkout" type="text" id="datepicker4" placeholder="체크아웃" value="${param.checkout }">
					</p>
					
					<div class="perbox-box">
							<div>
								
									<select class="adultselect">
									<c:forEach begin="1" end="20" var="p">
										
										<option class="madult" value="${p }" <c:if test="${param.adult == p }">selected</c:if>>성인: ${p }명
									
									</c:forEach>
									
									</select>
								
								
							</div>
							<div>
								
									<select class="crselect">
									<option <c:if test="${param.child == 0 }">selected</c:if>>아동 없음
									<c:forEach begin="1" end="20" var="p">
										
										<option class="mchild" value="${p }" <c:if test="${param.child == p }">selected</c:if>>아동: ${p }명
									
									</c:forEach>
									
									</select>
									
								
							
							
									<select class="crselect">
									
									<c:forEach begin="1" end="20" var="p">
										
										<option class="mroom" value="${p }" <c:if test="${param.room == p }">selected</c:if>>객실: ${p }개
									
									</c:forEach>
									
									</select>
								
								
								
							</div>
						</div>
					
					
					
					
					
					<div
						style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
						onClick="toSearch();"><span>검색</span>
						
					</div>
				</form>
			</div>
		</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</div>




<div class="rightbar">

<div>
	<ul class="rightbar-selectbox">
		<li><button class="rightbar-selectbtn" onclick="fnMove(1)" style="border-left:none">옵션정보&요금</button></li>
		<li><button class="rightbar-selectbtn" onclick="fnMove(2)">시설</button></li>
		<li><button class="rightbar-selectbtn" onclick="fnMove(3)">하우스룰</button></li>
		<li><button class="rightbar-selectbtn" onclick="fnMove(4)">후기</button></li>
	
	</ul>
</div>

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
			<td style="width: 70%;">
				<div id="hotelcomment">
					<a>${hotel.h_nation } 추천 숙소</a><br>
			
					<div>
					<pre class="commentboxxx">
						${hotel.h_comment }
					</pre>
					</div> 
				</div>
			</td>
			<td style="width: 30%;">
				<div class="rightbox-commentbox">
				<h4>투숙객이 좋아해요</h4>
				
					
					<p><b>조식 정보</b></p>
					<span>뷔페</span>
					
					<p class="rightbox-commentp"><button class="rightbox-btn" type="button" onclick="fnMove(1)">지금 예약하기</button></p>
					
			
			
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
					<p><button class="infochangebtn" onclick="pushLayer()">${param.checkin }</button></p>
				
				</td>
				<td>
					<p>체크아웃</p>
					<p><button class="infochangebtn" onclick="pushLayer()">${param.checkout }</button></p>
				</td>
				<td><p>성인 : ${param.adult }</p><p>아이 : <c:if test="${param.child ==0 }">0</c:if><c:if test="${param.child !=0 }">${param.child }</c:if></p></td>
				<td class="register-check-last"><button class="infoAllbtn" onclick="pushLayer()">검색 변경</button></td>
			
			
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
						<li>슬리퍼&&&</li>
					

						</ul>
				</td>
				<td class="rperson">
				
					<c:if test="${room.r_person == 2 }"><i class="material-icons">person</i><i class="material-icons">person</i></c:if>
					<c:if test="${room.r_person == 3 }"><i class="material-icons">person</i><i class="material-icons">person</i><i class="material-icons">person</i></c:if>
					<c:if test="${room.r_person == 4 }"><i class="material-icons">person</i><i class="material-icons">person</i><i class="material-icons">person</i><i class="material-icons">person</i></c:if>
					<c:if test="${room.r_person > 4 }"><i class="material-icons">person</i> X ${room.r_person }</c:if>
				
				
				
				
				
				</td>
				<td class="rprice"><input type="hidden" class="r_price-${r.index }" name="r_price" value="${room.r_price }">${room.r_price }</td>
				<td class="rselect">
				
				 	<%-- <select class="selectroom" >
						<option selected value="0">0
					<c:forEach begin="0" end="${room.r_stock }" varStatus="i"> 
						
						<c:set var="price" value="${room.r_price }" />
						<fmt:formatNumber value="${price}" type="number" var="numberType" />
						<c:set var="namy" value="${i.count }" />
						<fmt:formatNumber value="${namy}" type="number" var="numberType" />
					
						<option value="${price * namy  }">${i.count }&nbsp;(${price * namy })
					</c:forEach>
					</select>  --%>
					
					
					
					
					
				<c:set value="${map }" var="count"/>
				
				<select class="selectroom" >
						<option selected value="0">0
					<c:if test="${room.r_stock - count[room.r_num] <=0 }">
					
					
					
						<option value="0">객실 없음
					
					</c:if>
					<c:if test="${room.r_stock - count[room.r_num] >0 }">
					
					<c:forEach begin="0" end="${room.r_stock - count[room.r_num] }" varStatus="i"> 
						
						<c:set var="price" value="${room.r_price }" />
						<fmt:formatNumber value="${price}" type="number" var="numberType" />
						<c:set var="namy" value="${i.count }" />
						<fmt:formatNumber value="${namy}" type="number" var="numberType" />
					
						<option value="${price * namy  }">${i.count }&nbsp;(${price * namy })
					</c:forEach>
					</c:if>
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
				<li class="famous-wrapper-title"><i class="material-icons">bathtub</i>욕실</li>
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
				<li><br></li>	
				<li class="famous-wrapper-title"><i class="material-icons">king_bed</i>침실</li>
				<li>옷장</li>
				<li>긴 침대(2m 이상)</li>
				<li><br></li>
				<li class="famous-wrapper-title"><i class="material-icons">emoji_nature</i>반려동물</li>
				<li>애완동물 동반이 ${hotel.h_animal }합니다.</li>
			</ul>
		
			
			
			
			
		
			<ul class="famous-wrapper">
				<li class="famous-wrapper-title"><i class="material-icons">tv</i>미디어/테크놀로지</li>
				<li>평면 TV</li>
				<li>케이블 채널</li>
				<li>위성 채널</li>
				<li>전화기</li>
				<li>TV</li>
				<li><br></li>
				<li class="famous-wrapper-title"><i class="material-icons">local_dining</i>식음료</li>
				<li>생수</li>
				<li><br></li>
				<li class="famous-wrapper-title"><i class="material-icons">wifi</i>인터넷</li>
				<li>
					<c:if test="${fn:contains(hotel.h_internet,'무료') }">
					 Wi-Fi(은)는 호텔 전 구역에서 무료입니다
					</c:if>
					
					
				</li>
				<li><br></li>
				<li class="famous-wrapper-title"><i class="material-icons">accessible</i>접근성</li>
				<li>비상 알람이 설치된 화장실</li>
				<li>유닛 전역에서 휠체어 사용 가능</li>
				<li>엘리베이터로 위층 이동 가능</li>
				<li>지상층 전체 유닛</li>
				<li><br></li>
				<li class="famous-wrapper-title"><i class="material-icons">drive_eta</i>주차</li>
				<li>
					<c:if test="${fn:contains(hotel.h_parking,'무료') }">
					호텔 내 (사전 예약 불필요) 전용 주차장이 무료로 이용 가능합니다.
					</c:if>
					<c:if test="${fn:contains(hotel.h_parking,'유료') }">
					호텔 내 (사전 예약 필요) 전용 주차장이 유료로 이용 가능합니다.
					</c:if>
				
				</li>
				<li><br></li>
				<li class="famous-wrapper-title"><i class="material-icons">business_center</i>리셉션 서비스</li>
				<li>전용 체크인/체크아웃</li>
				<li>수하물 보관소</li>
				<li>환전</li>
				<li>24시간 프런트 데스크</li>
			</ul>
			
			
			
		
		
	
			
			<ul  class="famous-wrapper">
				<li class="famous-wrapper-title"><i class="material-icons">room_service</i>청소 서비스</li>
				<li>하우스키핑 (매일)</li>
				<li>다림질 서비스</li>
				<li>드라이클리닝 </li>
				<li>세탁 </li>
				<li><br></li>
				<li class="famous-wrapper-title"><i class="material-icons">local_printshop</i>비즈니스 시설</li>
				<li>팩스/복사</li>
				<li>비즈니스 센터</li>
				<li>회의/연회 시설 </li>
				<li><br></li>
				<li class="famous-wrapper-title">보안 시설</li>
				<li>소화기</li>
				<li>숙소 외부 CCTV</li>
				<li>공용 공간 CCTV</li>
				<li>화염 경보</li>
				<li>보안 알람</li>
				<li>24시간 보안</li>
				<li><br></li>
				<li class="famous-wrapper-title"><i class="material-icons">live_help</i>일반</li>
				<li>에어컨</li>
				<li>모닝콜 서비스</li>
				<li>금연 객실</li>
				<li>세탁 </li>
			</ul>
			
		

		
			
	
	
	</div>
	

	</div>
	
	
	<div class="houserule-wrapper">
		<h5 class="houserule-title">하우스 룰</h5>
		<p class="houserule-subtitle">${hotel.h_name }에 별도 요청 접수 가능 - 다음 단계에서 입력하세요!</p>
		<table class="houserule-box">
			<tr>
				<td class="houserule-titles">체크인</td>
				<td class="houserule-details">
					<div class="houserule-checkin" >
						<div class="houserule-checkin-checkin" data-percent="75">
						
							<span>15:00 이후 체크인</span>
						</div>
						
					</div>
						
				</td>
			</tr>
			<tr>
				<td class="houserule-titles">체크아웃</td>
				<td class="houserule-details">
					<div class="houserule-checkin" >
						<div class="houserule-checkin-checkout" data-percent="75" style="width: 40%;">
						
							<span>11:00 이전 체크아웃</span>
						</div>
						
					</div>
				</td>
			</tr>
			<tr>
				<td class="houserule-titles">취소/선결제</td>
				<td class="houserule-details">숙소 유형에 따라 취소 및 선결제 정책이 달라집니다. 옵션을 선택할 때는 반드시 예약조건을 확인해주시기 바랍니다.</td>
			</tr>
			<tr>
				<td class="houserule-titles">아동/침대 요금 정책</td>
				<td class="houserule-details">
					<p>모든 연령의 아동이 투숙 가능합니다.</p>
					<p>정확한 요금과 투숙 정원 정보를 확인하려면 함께 숙박할 아동의 수를 검색 조건에 추가하시기 바랍니다.</p>
					<p>이 숙소에서는 유아용 침대를 이용하실 수 없습니다.</p>
					<p>이 숙소에서는 엑스트라 베드를 이용하실 수 없습니다.</p>
					
				</td>
			</tr>
			<tr>
				<td class="houserule-titles">연령 제한 없음</td>
				<td class="houserule-details">체크인 시 연령 제한이 없습니다</td>
			</tr>
			<tr>
				<td class="houserule-titles">사용 가능한 신용카드</td>
				<td class="houserule-details">
					<div class="houserule-cardimg visa"></div>
					<div class="houserule-cardimg master"></div>
					
					<div>도착 전 신용카드 가승인으로 일정 금액을 한시적으로 결제 유보할 권리가 숙박 업체 측에 있습니다.</div></td>
			</tr>
		
		</table>
		
		
	
	</div>
	
	
	
	
	
	
	
	
	
	

	
	<div class="review-wrapper">
	
	
	
	
		<c:forEach items="${review }" var="rv">
		<input type="hidden" name="c_num" class="c_num" value="${rv.c_num }">
		<h3>이용 후기</h3>
		<table>
			<tr>
				<td colspan="2">
					<div>후기 작성일 ${rv.c_date }</div>
				</td>
			</tr>
			<tr>
				<td>닉네임 ${rv.m_nickname }</td>
				<td>
					<div>평점 ${rv.c_star }</div>
					<div>작성내용 ${rv.c_comment }</div>
					
					
					
					
				</td>
				
			</tr>

			<tr>
				<td colspan="2">
				
					<div>투숙한 방 타입 
						${rv.r_type }
					</div>
				
					<div>숙박일 ${rv.o_checkin } ~ ${rv.o_checkout }</div>
				</td>
			</tr>
		
		</table>
		
		</c:forEach>
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
	</div>
	
	
		
</div>
	
	
	
	
	
	
	
	
	
	
	


</div>






<%@include file="/WEB-INF/common/footer.jsp"%>

</body>
</html>