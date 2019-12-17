<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	
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
	<div id="address-area">
		<div>주소입력</div>  
		<input type="text" id="postcode" placeholder="우편번호">
		<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="address" name="h_address1" placeholder="주소" style="width: 20%"><br>
		<input type="text" id="detailAddress" name="h_address2" placeholder="상세주소" style="width: 20%">
		<input type="hidden" id="address_x" name="h_address_x">
		<input type="hidden" id="address_y" name="h_address_y">
	</div>
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    // 우편번호 찾기 화면을 넣을 element
	    var element_layer = document.getElementById('layer');
	    
	
	    function closeDaumPostcode() {
	        // iframe을 넣은 element를 안보이게 한다.
	        element_layer.style.display = 'none';
	    }
	
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 addr에 붙인다
	                    addr += extraAddr;
	                
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	           
	                        
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	                
	
	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_layer.style.display = 'none';
	            },
	            width : '100%',
	            height : '100%',
	            maxSuggestItems : 5
	        }).embed(element_layer);
	
	        // iframe을 넣은 element를 보이게 한다.
	        element_layer.style.display = 'block';
	
	        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	        initLayerPosition();
	    }
	
	    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	    function initLayerPosition(){
	        var width = 500; //우편번호서비스가 들어갈 element의 width
	        var height = 500; //우편번호서비스가 들어갈 element의 height
	        var borderWidth = 5; //샘플에서 사용하는 border의 두께
	
	        // 위에서 선언한 값들을 실제 element에 넣는다.
	        element_layer.style.width = width + 'px';
	        element_layer.style.height = height + 'px';
	        element_layer.style.border = borderWidth + 'px solid';
	        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
	        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	    }
	</script>
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