<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/common.jsp"%>
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<script>
	$(function() {
		

		
			
				
					
				$('.leftbtn').click(function(){
					var f = $(this).val();

					$('.hi'+f+'-1').animate({marginLeft:'-=205px'});
				});
				$('.rightbtn').click(function(){
					var e = $(this).val();

					$('.hi'+e+'-1').animate({marginLeft:'+=205px'});
				});
			
			
			
			
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			//******** people 구하기 ********************************************************************
			
			
			
			$('select').change(function(){
				
				var adulttxt = $('.adult:selected').val();
				$('input.adult').attr('value', adulttxt);
				
				
				var childtxt = $('.child:selected').val();
				$('input.child').attr('value', childtxt);
				
				
				var roomtxt = $('.room:selected').val();
				$('input.room').attr('value', roomtxt);
				
				
				
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
		 
		 
		//********Filter *******************************************************************
		 $(".searchAsMoney").click(function(){
				$("input[name=searchas]").attr("value","money");
				$("form[name=searchForm]").submit();
			});
			$(".searchAsComment").click(function(){
				$("input[name=searchas]").attr("value","comment");
				$("form[name=searchForm]").submit();
			});
			var filterTypeArray=$("input[name=filterType]").attr("value").split(",");
			
			$(".filterType_hotel").click(function(){
				if(filterTypeArray.indexOf("호텔")==-1){
					$(this).html("<i class='fas fa-check-square'></i>호텔");
					filterTypeArray.unshift("호텔");
					var filterType=filterTypeArray.join();
					$("input[name=filterType]").attr("value",filterType);
					$("form[name=searchForm]").submit();
				}else{
					$(this).html("<i class='far fa-square'></i>호텔");
					filterTypeArray.splice(filterTypeArray.indexOf("호텔"),1);
					var filterType=filterTypeArray.join();
					$("input[name=filterType]").attr("value",filterType);
					$("form[name=searchForm]").submit();
				}
			});
		
			$(".filterType_motel").click(function(){
				if(filterTypeArray.indexOf("모텔")==-1){
					$(this).html("<i class='fas fa-check-square'></i>모텔");
					filterTypeArray.unshift("모텔");
					var filterType=filterTypeArray.join();
					$("input[name=filterType]").attr("value",filterType);
					$("form[name=searchForm]").submit();
				}else{
					$(this).html("<i class='far fa-square'></i>모텔");
					filterTypeArray.splice(filterTypeArray.indexOf("모텔"),1);
					var filterType=filterTypeArray.join();
					$("input[name=filterType]").attr("value",filterType);
					$("form[name=searchForm]").submit();
				}
			});
			
			$(".filterType_apart").click(function(){
				if(filterTypeArray.indexOf("아파트")==-1){
					$(this).html("<i class='fas fa-check-square'></i>아파트");
					filterTypeArray.unshift("아파트");
					var filterType=filterTypeArray.join();
					$("input[name=filterType]").attr("value",filterType);
					$("form[name=searchForm]").submit();
				}else{
					$(this).html("<i class='far fa-square'></i>아파트");
					filterTypeArray.splice(filterTypeArray.indexOf("아파트"),1);
					var filterType=filterTypeArray.join();
					$("input[name=filterType]").attr("value",filterType);
					$("form[name=searchForm]").submit();
				}
			});
			$(".filterType_guestHouse").click(function(){
				if(filterTypeArray.indexOf("게스트하우스")==-1){
					$(this).html("<i class='fas fa-check-square'></i>게스트하우스");
					filterTypeArray.unshift("게스트하우스");
					var filterType=filterTypeArray.join();
					$("input[name=filterType]").attr("value",filterType);
					$("form[name=searchForm]").submit();
				}else{
					$(this).html("<i class='far fa-square'></i>게스트하우스");
					filterTypeArray.splice(filterTypeArray.indexOf("게스트하우스"),1);
					var filterType=filterTypeArray.join();
					$("input[name=filterType]").attr("value",filterType);
					$("form[name=searchForm]").submit();
				}
			});
		
		
		
		

	});
</script>

<%@include file="/WEB-INF/common/header.jsp"%>

<link href="<c:url value="resources/css/search.css" />" rel="stylesheet">



<div class="bar-wrapper">
	<div class="leftbar">

		<div class="leftSearch-wrap">
			<form action="Search.ho" class="leftsearch-form">
				<h4>검색</h4>
				<br>
				<div class="searchinput">
				<span class="searchinputSpan">여행지 이름:</span>
					<input class="inputbox" type="text" name="area" placeholder="지역을 입력하세요"
						value="${param.area }">
					<br>
					<p class="searcharea-p scheduler">
						<span class="searchinputSpan">체크인 날짜:</span>
						<input class="inputbox"  name="checkin" type="text" id="datepicker" placeholder="체크인" value="${param.checkin }" autocomplete="off">
						<br>
							<span class="searchinputSpan">체크아웃 날짜:</span>
							<input class="inputbox"  name="checkout" type="text" id="datepicker2" placeholder="체크아웃" value="${param.checkout }" autocomplete="off">
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

					<input type="hidden" name="adult" class="adult" value="${param.adult }">
					<input type="hidden" name="child" class="child"  value="${search.child }">
					<input type="hidden" name="room" class="room"  value="${search.room }">
					<input type="hidden" name="searchas" value="${search.searchas }">
					<input type="hidden" name="filterType" value="${search.filterType }">
					<input class="mainsubmitbtn" type="submit" value="검색">

				</div>
			</form>

		</div>
		<div class="leftFilter-wrap">
			<h2>필터링 기준:</h2>
			
				<div class="filterType">
				<h5>숙소 유형</h5>
				<c:set value="${search.filterType }" var="filter"/>
				 <span class="filterType_hotel">
				 	<c:if test="${fn:contains(filter,'호텔') }">
				 		<i class='fas fa-check-square'></i>호텔 
				 	</c:if>
				 	<c:if test="${fn:indexOf(filter,'호텔')==-1 }">
				 		<i class="far fa-square"></i>호텔
				 	</c:if>
				  </span>
				  <br>
				  <span class="filterType_motel">
				  <c:if test="${fn:contains(filter,'모텔') }">
				 		<i class='fas fa-check-square'></i>모텔
				 	</c:if>
				 	<c:if test="${fn:indexOf(filter,'모텔')==-1 }">
				 		<i class="far fa-square"></i>모텔
				 	</c:if>
				 	</span>
				 	<br>
				  <span class="filterType_guestHouse">
				  <c:if test="${fn:contains(filter,'게스트하우스') }">
				 		<i class='fas fa-check-square'></i>게스트하우스
				 	</c:if>
				 	<c:if test="${fn:indexOf(filter,'게스트하우스')==-1 }">
				 		<i class="far fa-square"></i>게스트하우스
				 	</c:if>
				 	</span>
				 	<br>
				  <span class="filterType_apart">
				  	<c:if test="${fn:contains(filter,'아파트') }">
				 		<i class='fas fa-check-square'></i>아파트
				 	</c:if>
				 	<c:if test="${fn:indexOf(filter,'아파트')==-1 }"> 
				 		<i class="far fa-square"></i>아파트
				 	</c:if>
				  </span>
			    </div>










			


		
		</div>

	</div>
	<div class="rightbar">

		<div class="listarea">
			
			<div class="bigtitle-wrap">
				<h3><c:if test="${param.area != ''}">${param.area}:</c:if> 검색된 숙소 ${fn:length(hotelList) }개</h3>
				
			</div>
			<div class="rowfilter" >
				<ul class="rowFilUl" >
					<li><a href="#" class="searchAsMoney">기본</a></li>
					<li><a href="#" class="searchAsMoney">요금</a></li>
					<li><a href="#" class="searchAsComment">평점</a></li>
					<li><a href="#" class="searchAsComment rowbordernone">성급</a></li>
				</ul>
			</div>
			
			
			
			
			<c:forEach items="${hotelList  }" var="hotel" varStatus="rr">
				<table class="tablelist">
					<tr class="tablerow">
						<td>
							
								<div class="img-cutter">
									
									<div class="img-only-wrap">
									<c:forEach items="${hotel.images }" var="image" varStatus="i">
										<img class="hotelimage hi${rr.count }-${i.count }" src="<%=request.getContextPath() %>/resources/Hotelimages/${hotel.h_name }/${image }">
									</c:forEach>
									</div>
								</div>
								
										<button type="button" class="leftbtn" value="${rr.count }">&laquo;</button>
										<button type="button" class="rightbtn" value="${rr.count }"
											style="margin-left: 150px;">&raquo;</button>
							
							

						</td>

						<td><span class="htypesearch">${hotel.h_type }</span><a
							class="hnamesearch" href="hotelDetail.ho?h_num=${hotel.h_num }&area=${param.area}&checkin=${param.checkin}&checkout=${param.checkout}&adult=${param.adult}&child=${param.child}&room=${param.room}">
														<b>${hotel.h_name }</b>
														<c:if test="${fn:contains(hotel.h_grade,5) }"><i class="material-icons gradestar">grade</i><i class="material-icons gradestar">grade</i><i class="material-icons gradestar">grade</i><i class="material-icons gradestar">grade</i><i class="material-icons gradestar">grade</i></c:if>
														<c:if test="${fn:contains(hotel.h_grade,4) }"><i class="material-icons gradestar">grade</i><i class="material-icons gradestar" >grade</i><i class="material-icons gradestar">grade</i><i class="material-icons gradestar">grade</i></c:if>
														<c:if test="${fn:contains(hotel.h_grade,3) }"><i class="material-icons gradestar">grade</i><i class="material-icons gradestar" >grade</i><i class="material-icons gradestar">grade</i></c:if>
														<c:if test="${fn:contains(hotel.h_grade,2) }"><i class="material-icons gradestar">grade</i><i class="material-icons gradestar">grade</i></c:if>
														<c:if test="${fn:contains(hotel.h_grade,1) }"><i class="material-icons gradestar">grade</i></c:if>

														</a>

							<div class="addsearch">
								<b>${hotel.h_address1 },&nbsp;${hotel.h_nation }</b>
							</div>

							<div>${hotel.h_comment }</div>
							<div>객실유형&nbsp;&nbsp;&nbsp;&nbsp;객실가격</div>
							<c:forEach items="${hotel.rooms }" var="room">
								<a>${room.r_type }&nbsp;&nbsp;&nbsp;&nbsp;${room.r_price }</a><br>
							</c:forEach>
					
						</td>
						
					</tr>
						
						
					
				</table>


			</c:forEach>


		


	</div>




	</div>

</div>


<%@include file="/WEB-INF/common/footer.jsp"%>
