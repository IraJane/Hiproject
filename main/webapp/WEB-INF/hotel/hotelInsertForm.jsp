<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	/* function fileDelete(index){
		selectFiles.splice(index,1);
		var img_id="#img_id_"+index;
		$(img_id).remove();
	} */
	/* id="img_id_'+index+'" */
/* 	<a href="javascript:void(0);" onclick="fileDelete('+index+')">삭제</a> */
	/* var selectFiles=[]; */
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
	<form action="hotelInsert.ho" method="post" enctype="multipart/form-data" id="hotelInsertForm"> 
	<p>
		<label for="h_name">호텔이름</label>
		<input type="text" name="h_name">	
	</p>
	<p>
		<label for="h_nation">국가</label>
		<input type="text" name="h_nation" placeholder="대한민국">	
	</p>
	<p>
		<label for="h_address1">지역</label>
		<input type="text" name="h_address1" placeholder="제주도">	
	</p>
	<p>
		<label for="h_address2">주소</label>
		<input type="text" name="h_address2">	
	</p>
	<p>
		<label for="h_type">호텔유형</label>
		<input type="radio" name="h_type" value="호텔" checked>호텔	
		<input type="radio" name="h_type" value="아파트">아파트	
		<input type="radio" name="h_type" value="모텔">모텔	
		<input type="radio" name="h_type" value="게스트하우스">게스트하우스	
	</p>
		<label for="h_grade">호텔등급</label>
		<input type="radio" name="h_grade" value="1" checked>1등급
		<input type="radio" name="h_grade" value="2">2등급
		<input type="radio" name="h_grade" value="3">3등급	
		<input type="radio" name="h_grade" value="4">4등급
		<input type="radio" name="h_grade" value="5">5등급
		<input type="radio" name="h_grade" value="0">등급없음	
	<p>
	</p>
	<p>
		<label for="h_phone">호텔 전화번호</label>
		<input type="text" name="h_phone" placeholder="02-123-1234">	
	</p>
	<p>
		<label for="h_facilities">편의 시설</label>
		<input type="checkbox" name="h_facilities" value="피트니스센터">피트니스센터	
		<input type="checkbox" name="h_facilities" value="수영장">수영장
		<input type="checkbox" name="h_facilities" value="카페">카페
		<input type="checkbox" name="h_facilities" value="스파 및 마사지">스파 및 마사지
		<input type="checkbox" name="h_facilities" value="오락시설">오락시설
		<input type="checkbox" name="h_facilities" value="사우나">사우나
		<input type="checkbox" name="h_facilities" value="비즈니스센터">비즈니스센터
		<input type="checkbox" name="h_facilities" value="물품보관소">물품보관소
		<input type="checkbox" name="h_facilities" value="기념품가게">기념품가게
		<input type="checkbox" name="h_facilities" value="안전금고">안전금고
		<input type="checkbox" name="h_facilities" value="세탁실">세탁실
		<input type="checkbox" name="h_facilities" value="환전소">환전소
		<input type="checkbox" name="h_facilities" value="반려동물센터">반려동물센터
		<input type="checkbox" name="h_facilities" value="의료시설">의료시설
		<input type="checkbox" name="h_facilities" value="없음">없음
	</p>
	<p>
		<label for="h_internet">인터넷</label>
		<input type="radio" name="h_internet" value="무료 인터넷" checked> 무료 인터넷	
		<input type="radio" name="h_internet" value="유료 인터넷"> 유료 인터넷	
	</p>
	<p>
		<label for="h_animal">반려동물</label>
		<input type="radio" name="h_animal" value="가능">가능	
		<input type="radio" name="h_animal" value="불가능" checked>불가능	
	</p>
	<p>
		<label for="h_parking">주차</label>
		<input type="radio" name="h_parking" value="유료주차" checked>유료주차	
		<input type="radio" name="h_parking" value="무료주차">무료주차
		<input type="radio" name="h_parking" value="주차불가능">주차불가능
	</p>
	<p>
		<label for="h_smoke">흡연구역</label>
		<input type="radio" name="h_smoke" value="건물내">건물내	
		<input type="radio" name="h_smoke" value="건물외">건물외	
		<input type="radio" name="h_smoke" value="흡연불가" checked>흡연불가	
	</p>
	<p>
		<label for="h_language">지원언어</label>
		<input type="text" name="h_language" placeholder="한국어,영어,중국어">
	</p>
	<p>
		<label for="h_hotel_url">호텔 홈페이지 주소</label>
		<input type="text" name="h_hotel_url" placeholder="www.hotel.com">
	</p>
	<div>
		<label for="file">호텔 이미지</label>
		<input multiple="multiple" type="file" name="file">
		<div id="preview"></div>  
	</div>
	<textarea rows="7" cols="60" name="h_comment" form="hotelInsertForm" placeholder="추가설명"></textarea>
	<p>
		<label for="h_room_num">총 객실 수</label>
		<input type="text" name="h_room_num" placeholder="10">
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
		<tr>
			<td><input type="text" name="type" placeholder="일반룸"></td>
			<td><input type="text" name="person" placeholder="3"></td>
			<td><input type="text" name="price" placeholder="80000"></td>
			<td><input type="text" name="stock" placeholder="3"></td>
			<td>
			<select name="breakfast">
				<option value="포함">포함</option>
				<option value="미포함">미포함</option>
			</select>
			</td>
			<td>
				<button type="button" class="addbtn">객실추가</button>		
			</td>
		</tr>
	</table>
	<input type="submit" value="호텔등록">
	</form>
</body>
</html>