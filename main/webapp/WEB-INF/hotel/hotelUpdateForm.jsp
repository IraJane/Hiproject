<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function changeFile(){
		$("input[name=filebtn]").attr("value","change");
		$("input[type=file]").click();
	}
	
	function addFile(){
		$("input[name=filebtn]").attr("value","add");
		$("input[type=file]").click();
	}
	$(function(){
		var str="<tr><td><input type='text' name='type'></td>"+
		"<td><input type='text' name='person'></td>" +
		"<td><input type='text' name='price'></td>" +
		"<td><input type='text' name='stock'></td>" +
		"<td>"+
		"<select name='breakfast'>" +
			"<option value='포함'>포함</option>" +
			"<option value='미포함'>미포함</option>" +
		"</select>" +
		"</td>" +
		"<td><button type='button' class='removebtn'>객실 삭제</button></td></tr>";
		$(".addbtn").click(function(){
			$("#roomtable").append(str);
		});
		$("#roomtable").on("click",".removebtn",function(){
			$(this).closest("tr").remove();
		});
		
		$("input[type='file']").change(function(e){
			$("#preview").empty();
			var files=e.target.files; //fileList 객체
			var arr=Array.prototype.slice.call(files);
			preview(arr);
		});
		function preview(arr){
			arr.forEach(function(f){
				var fileName=f.name;
				if(fileName.length>10){ 
					fileName=fileName.substring(0,7)+"...";
				}  
				var str="";
				var reader=new FileReader();
				reader.onload=function(e){
					str='<div style="display:inline-flex; padding:10px">';
					str+='<li><span>'+fileName+'</span><br>';
					str+='<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />'
					str+='</li></div>';
					$("#preview").append(str);
				};
				reader.readAsDataURL(f);
			});
			
		};
		
	});
</script>
</head>
<body>
	<form action="updateHotel.ho" method="post" enctype="multipart/form-data" id="hotelInsertForm"> 
	<input type="hidden" name="h_num" value="${hotel.h_num }">
	<input type="hidden" name="originName" value="${hotel.h_name }">
	<p>
		<label for="h_name">호텔이름</label>
		<input type="text" name="h_name" value="${hotel.h_name }">	
	</p>
	<p>
		<label for="h_nation">국가</label>
		<input type="text" name="h_nation" placeholder="대한민국" value="${hotel.h_nation }">	
	</p>
	<p>
		<label for="h_address1">지역</label>
		<input type="text" name="h_address1" placeholder="제주도" value="${hotel.h_address1 }">	
	</p>
	<p>
		<label for="h_address2">주소</label>
		<input type="text" name="h_address2" value="${hotel.h_address2 }">	
	</p>
	<p>
		<label for="h_type">호텔유형</label>
		<input type="radio" name="h_type" value="호텔" <c:if test="${hotel.h_type eq '호텔' }">checked</c:if>>호텔	
		<input type="radio" name="h_type" value="아파트" <c:if test="${hotel.h_type eq '아파트' }">checked</c:if>>아파트	
		<input type="radio" name="h_type" value="모텔" <c:if test="${hotel.h_type eq '모텔' }">checked</c:if>>모텔	
		<input type="radio" name="h_type" value="게스트하우스" <c:if test="${hotel.h_type eq '게스트하우스' }">checked</c:if>>게스트하우스	
	</p>
	<p>
		<label for="h_phone">호텔 전화번호</label>
		<input type="text" name="h_phone" placeholder="02-123-1234" value="${hotel.h_phone }">	
	</p>
	<p>
		<label for="h_facilities">편의 시설</label>
		<c:set value="${hotel.h_facilities }" var="facilities"/>
		<input type="checkbox" name="h_facilities" value="피트니스센터" <c:if test="${fn:contains(facilities,'피트니스센터') }">checked</c:if>>피트니스센터	
		<input type="checkbox" name="h_facilities" value="수영장" <c:if test="${fn:contains(facilities,'수영장') }">checked</c:if>>수영장
		<input type="checkbox" name="h_facilities" value="카페" <c:if test="${fn:contains(facilities,'카페') }">checked</c:if>>카페
		<input type="checkbox" name="h_facilities" value="스파" <c:if test="${fn:contains(facilities,'스파 및 마사지') }">checked</c:if>>스파 및 마사지
		<input type="checkbox" name="h_facilities" value="오락시설" <c:if test="${fn:contains(facilities,'오락시설') }">checked</c:if>>오락시설
		<input type="checkbox" name="h_facilities" value="사우나" <c:if test="${fn:contains(facilities,'사우나') }">checked</c:if>>사우나
		<input type="checkbox" name="h_facilities" value="비즈니스센터" <c:if test="${fn:contains(facilities,'비즈니스센터') }">checked</c:if>>비즈니스센터
		<input type="checkbox" name="h_facilities" value="물품보관소" <c:if test="${fn:contains(facilities,'물품보관소') }">checked</c:if>>물품보관소
		<input type="checkbox" name="h_facilities" value="기념품가게" <c:if test="${fn:contains(facilities,'기념품가게') }">checked</c:if>>기념품가게
		<input type="checkbox" name="h_facilities" value="안전금고" <c:if test="${fn:contains(facilities,'안전금고') }">checked</c:if>>안전금고
		<input type="checkbox" name="h_facilities" value="세탁실" <c:if test="${fn:contains(facilities,'세탁실') }">checked</c:if>>세탁실
		<input type="checkbox" name="h_facilities" value="환전소" <c:if test="${fn:contains(facilities,'환전소') }">checked</c:if>>환전소
		<input type="checkbox" name="h_facilities" value="반려동물센터" <c:if test="${fn:contains(facilities,'반려동물센터') }">checked</c:if>>반려동물센터
		<input type="checkbox" name="h_facilities" value="의료시설" <c:if test="${fn:contains(facilities,'의료시설') }">checked</c:if>>의료시설
		<input type="checkbox" name="h_facilities" value="없음" <c:if test="${fn:contains(facilities,'없음') }">checked</c:if>>없음
	</p>
	<p>
		<label for="h_internet">인터넷</label>
		<input type="radio" name="h_internet" value="무료 인터넷" <c:if test="${hotel.h_internet eq '무료 인터넷' }">checked</c:if>> 무료 인터넷	
		<input type="radio" name="h_internet" value="유료 인터넷" <c:if test="${hotel.h_internet eq '유료 인터넷' }">checked</c:if>> 유료 인터넷	
	</p>
	<p>
		<label for="h_animal">반려동물</label>
		<input type="radio" name="h_animal" value="가능" <c:if test="${hotel.h_animal eq '가능' }">checked</c:if>>가능	
		<input type="radio" name="h_animal" value="불가능" <c:if test="${hotel.h_animal eq '불가능' }">checked</c:if>>불가능	
	</p>
	<p>
		<label for="h_parking">주차</label>
		<input type="radio" name="h_parking" value="유료주차" <c:if test="${hotel.h_parking eq '유료주차' }">checked</c:if>>유료주차	
		<input type="radio" name="h_parking" value="무료주차" <c:if test="${hotel.h_parking eq '무료주차' }">checked</c:if>>무료주차
		<input type="radio" name="h_parking" value="주차불가능" <c:if test="${hotel.h_parking eq '주차불가능' }">checked</c:if>>주차불가능
	</p>
	<p>
		<label for="h_smoke">흡연구역</label>
		<input type="radio" name="h_smoke" value="건물내" <c:if test="${hotel.h_smoke eq '건물내' }">checked</c:if>>건물내	
		<input type="radio" name="h_smoke" value="건물외" <c:if test="${hotel.h_smoke eq '건물외' }">checked</c:if>>건물외	
		<input type="radio" name="h_smoke" value="흡연불가" <c:if test="${hotel.h_smoke eq '흡연불가' }">checked</c:if>>흡연불가	
	</p>
	<p>
		<label for="h_language">지원언어</label>
		<input type="text" name="h_language" placeholder="한국어,영어,중국어" value="${hotel.h_language }">
	</p>
	<p>
		<label for="h_hotel_url">호텔 홈페이지 주소</label>
		<input type="text" name="h_hotel_url" placeholder="www.hotel.com" value="${hotel.h_hotel_url }">
	</p>
	<div>
		<label for="file">호텔 이미지</label>
		<input multiple="multiple" type="file" name="file" style="display:none">
		<button type="button" onclick="changeFile()">사진변경</button>
		<button type="button" onclick="addFile()">사진추가</button>
		<input type="hidden" name="filebtn">
		
		<div id="preview"></div>  
	</div>
	<textarea rows="7" cols="60" name="h_comment" form="hotelInsertForm" placeholder="추가설명">${hotel.h_comment }</textarea>
	<p>
		<label for="h_room_num">총 객실 수</label>  
		<input type="text" name="h_room_num" placeholder="10" value="${hotel.h_room_num }">
	</p>
	<table id="roomtable">
		<tr>
			<th>객실 유형</th>
			<th>객실 허용인원</th>
			<th>객실 가격(1박)</th>
			<th>객실 수</th>
			<th>조식 포함여부</th>
			<th>객실 추가</th>
		</tr>
		<c:forEach items="${hotel.rooms }" var="room" varStatus="status">
		<tr>
			<td><input type="text" name="type" placeholder="일반룸" value="${room.r_type }"></td>
			<td><input type="text" name="person" placeholder="3" value="${room.r_person }"></td>
			<td><input type="text" name="price" placeholder="80000" value="${room.r_price }"></td>
			<td><input type="text" name="stock" placeholder="3" value="${room.r_stock }"></td>
			<td>
			<select name="breakfast">
				<option value="포함" <c:if test="${room.r_breakfast eq '포함' }">selected</c:if>>포함</option>
				<option value="미포함" <c:if test="${room.r_breakfast eq '미포함' }">selected</c:if>>미포함</option>
			</select>
			</td>
			<c:choose>
				<c:when test="${status.first }">
					<td>
						<button type="button" class="addbtn">객실추가</button>		
					</td>
				</c:when>
				<c:otherwise>
					<td>
						<button type='button' class='removebtn'>객실 삭제</button>
					</td>
				</c:otherwise>
			</c:choose>
		</tr>
		</c:forEach>
	</table>
	<input type="submit" value="호텔등록">
	</form>
	
</body>
</html>