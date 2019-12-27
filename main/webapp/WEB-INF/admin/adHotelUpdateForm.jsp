<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Insert title here</title>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script src="resources/hotelInsert/js/jquery-3.3.1.min.js"></script> 
<!-- Font-->
<link rel="stylesheet" type="text/css" href="resources/css/opensans-font.css">
<link rel="stylesheet" type="text/css" href="resources/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<!-- Main Style Css -->
<link rel="stylesheet" href="resources/css/style.css"/>

<script>

</script>
</head>
<body>
<%@include file="../common/selHeader.jsp"%>	
<div class="insertHotel-wrapper">
	<div class="insertHotel-content">
		<div class="wizard-form">
			<form action="updateHotel.ad" method="post" enctype="multipart/form-data" id="hotelInsertForm" class="form-register">
				<input type="hidden" name="s_num" value="${hotel.s_num }">
				<input type="hidden" name="h_num" value="${hotel.h_num }">
				<input type="hidden" name="originName" value="${hotel.h_name }">
				<div id="form-total">
					<!-- SECTION 1 -->
					<h2>
			            <p class="step-icon"><span>01</span></p>
			            <span class="step-text">호텔 수정</span>
			        </h2>
			        <section>
						<div class="inner">
		                	<div class="wizard-header">
								<h3 class="heading">호텔 수정</h3>
								<p>호텔 정보를 입력하고 다음 단계를 진행하여 호텔 세부 정보를 작성하십시오.</p>
							</div>
							<div class="form-row">
								<div class="form-holder">
									<fieldset>
										<legend>Hotel Name</legend>
										<input type="text" class="form-control" name="h_name" placeholder="호텔 이름" value="${hotel.h_name }">
									</fieldset>
								</div>
								<div class="form-holder">
									<fieldset> 
										<legend>Nation</legend>
										<input type="text" class="form-control" name="h_nation" placeholder="국가" value="${hotel.h_nation }">
									</fieldset>
								</div>
							</div>
							<div class="form-row">
								<div class="form-holder">
									<fieldset>
										<legend>Postcode</legend>
										<input type="text" class="form-control" id="postcode" name="h_postcode" placeholder="우편번호" value="${hotel.h_postcode }" readonly="readonly">
									</fieldset>
								</div>
								<div style="padding-top:17px">
									<button type="button" class="btn btn-success" onclick="execDaumPostcode()">우편번호찾기</button>
								</div>
							</div>    
							<div class="form-row">
						  		<div class="form-holder form-holder-2">
									<fieldset>
										<legend>Address</legend>
										<input type="text" class="form-control" id="address" name="h_address1" placeholder="주소" value="${hotel.h_address1 }" readonly="readonly">
									</fieldset>
								</div>
							</div>
							<div class="form-row">
								<div class="form-holder form-holder-2">
									<fieldset>
										<legend>AddressDetail</legend>
										<input type="text" class="form-control" id="detailAddress" name="h_address2" value="${hotel.h_address2 }" placeholder="상세주소">
									</fieldset>
								</div>
							</div>
							<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:2;-webkit-overflow-scrolling:touch;">
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
							        var borderWidth= 1; //샘플에서 사용하는 border의 두께
							
							        // 위에서 선언한 값들을 실제 element에 넣는다.
							        element_layer.style.width = width + 'px';
							        element_layer.style.height = height + 'px';
							        element_layer.style.border = borderWidth + 'px solid';
							        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
							        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
							        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
							    }
							</script>
							<div class="form-row">
								<div class="form-holder">
										<legend>hotel type</legend>
										<select name="h_type">
											<option value="호텔" <c:if test="${hotel.h_type eq '호텔' }">selected</c:if>>호텔</option>
											<option value="게스트하우스" <c:if test="${hotel.h_type eq '게스트하우스' }">selected</c:if>>게스트하우스</option>
											<option value="아파트" <c:if test="${hotel.h_type eq '아파트' }">selected</c:if>>아파트</option>
											<option value="모텔" <c:if test="${hotel.h_type eq '모텔' }">selected</c:if>>모텔</option>
										</select>  
					
								</div>
								<div class="form-holder">
									<legend>hotel grade</legend>
									<select name="h_grade">
										<option value="0" <c:if test="${hotel.h_grade eq '0' }">selected</c:if>>없음</option>
										<option value="1" <c:if test="${hotel.h_grade eq '1' }">selected</c:if>>1등급</option>
										<option value="2" <c:if test="${hotel.h_grade eq '2' }">selected</c:if>>2등급</option>
										<option value="3" <c:if test="${hotel.h_grade eq '3' }">selected</c:if>>3등급</option>
										<option value="4" <c:if test="${hotel.h_grade eq '4' }">selected</c:if>>4등급</option>
										<option value="5" <c:if test="${hotel.h_grade eq '5' }">selected</c:if>>5등급</option>
									</select>
								</div>
							</div>
							<div class="form-row">
								<div class="form-holder form-holder-2">
									<fieldset>
										<legend>Hotel Phone</legend>
										<input type="text" class="form-control" name="h_phone" placeholder="호텔전화번호" value="${hotel.h_phone }">
									</fieldset>
								</div>
							</div>
							<div class="form-row">
								<div class="form-holder form-holder-2">
									<fieldset>
										<legend>Hotel Url</legend>
										<input type="text" class="form-control" name="h_hotel_url" placeholder="호텔사이트주소" value="${hotel.h_hotel_url }">
									</fieldset>
								</div>
							</div>
						</div>
					</section>
					<!-- SECTION 2 -->
			            <h2>
			            	<p class="step-icon"><span>02</span></p>
			            	<span class="step-text">호텔 상세</span>
			            </h2>
			            <section>
			                <div class="inner">
			                	<div class="wizard-header">
									<h3 class="heading">Hotel Detail</h3>
									<p>Please enter hotel detail and proceed to the next step so we can build Rooms.</p>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<fieldset>
											<legend>Support Language</legend>
											<input type="text" class="form-control" placeholder="한국어,영어,중국어" value="${hotel.h_language }" name="h_language">
										</fieldset>
									</div>	
								</div>
								<div class="form-row">
									<div class="form-holder">
											<legend>Internet</legend>
											<select name="h_internet">
												<option value="" <c:if test="${hotel.h_internet eq '' }">selected</c:if>>선택</option>
												<option value="유료 인터넷" <c:if test="${hotel.h_internet eq '유료 인터넷' }">selected</c:if>>유료</option>
												<option value="무료 인터넷" <c:if test="${hotel.h_internet eq '무료 인터넷' }">selected</c:if>>무료</option>
											</select>
									</div>
									<div class="form-holder">
										<legend>Animal</legend>
										<select name="h_animal">
											<option value="" <c:if test="${hotel.h_animal eq '' }">selected</c:if>>선택</option>
											<option value="가능" <c:if test="${hotel.h_animal eq '가능' }">selected</c:if>>가능</option>
											<option value="불가능" <c:if test="${hotel.h_animal eq '불가능' }">selected</c:if>>불가능</option>
										</select>
									</div>
									<div class="form-holder">
										<legend>Parking</legend>
										<select name="h_parking">
											<option value="" <c:if test="${hotel.h_parking eq '' }">selected</c:if>>선택</option>
											<option value="유료주차" <c:if test="${hotel.h_parking eq '유료주차' }">selected</c:if>>유료주차</option>
											<option value="무료주차" <c:if test="${hotel.h_parking eq '무료주차' }">selected</c:if>>무료주차</option>
											<option value="주차불가" <c:if test="${hotel.h_parking eq '주차불가' }">selected</c:if>>주차불가</option>
										</select>
									</div>
									<div class="form-holder">
										<legend>Smoking</legend>
										<select name="h_smoke">
											<option value="" <c:if test="${hotel.h_smoke eq '' }">selected</c:if>>선택</option>
											<option value="건물외" <c:if test="${hotel.h_smoke eq '건물외' }">selected</c:if>>건물외</option>
											<option value="건물내" <c:if test="${hotel.h_smoke eq '건물내' }">selected</c:if>>건물내</option>
											<option value="흡연불가" <c:if test="${hotel.h_smoke eq '흡연불가' }">selected</c:if>>흡연불가</option>
										</select>
									</div>
								</div>
								<div class="form-holder">
										Facilities:<input type="checkbox"  name="h_facilities" value="없음" style="display: none;" checked>
										<c:set value="${hotel.h_facilities }" var="facilities"/>
								</div>  
								<div class="form-row">
								      <div class="form-holder"> 
										<input class="to-labelauty labelauty" type="checkbox" id="checkbox-1" name="h_facilities" value="사우나" style="display: none;" <c:if test="${fn:contains(facilities,'사우나') }">checked</c:if>>
									      <label for="checkbox-1" style="min-width: 70px;">
									         <span class="labelauty-unchecked-image">
									            <i class="fa fa-times"></i>
									         </span>
									         <span class="labelauty-unchecked">사우나</span>
									         <span class="labelauty-checked-image">
									            <i class="fa fa-check"></i>
									         </span>
									         <span class="labelauty-checked">사우나</span>
									      </label>
								      </div>
								       <div class="form-holder"> 
										<input class="to-labelauty labelauty" type="checkbox" id="checkbox-2" name="h_facilities" value="수영장" style="display: none;" <c:if test="${fn:contains(facilities,'수영장') }">checked</c:if>>
									      <label for="checkbox-2" style="min-width: 70px;">
									         <span class="labelauty-unchecked-image">
									            <i class="fa fa-times"></i>
									         </span>
									         <span class="labelauty-unchecked">수영장</span>
									         <span class="labelauty-checked-image">
									            <i class="fa fa-check"></i>
									         </span>
									         <span class="labelauty-checked">수영장</span>
									      </label>
								      </div>	
								      <div class="form-holder"> 
										<input class="to-labelauty labelauty" type="checkbox" id="checkbox-3" name="h_facilities" value="피트니스센터" style="display: none;" <c:if test="${fn:contains(facilities,'피트니스센터') }">checked</c:if>>
									      <label for="checkbox-3" style="min-width: 70px;">
									         <span class="labelauty-unchecked-image">  
									            <i class="fa fa-times"></i>
									         </span>
									         <span class="labelauty-unchecked">피트니스</span>
									         <span class="labelauty-checked-image">
									            <i class="fa fa-check"></i>
									         </span>
									         <span class="labelauty-checked" >피트니스</span>
									      </label>
								      </div>
								      <div class="form-holder"> 
										<input class="to-labelauty labelauty" type="checkbox" id="checkbox-4" name="h_facilities" value="스파&마사지" style="display: none;" <c:if test="${fn:contains(facilities,'스파&마사지') }">checked</c:if>>
									      <label for="checkbox-4" style="min-width: 100px;">
									         <span class="labelauty-unchecked-image">
									            <i class="fa fa-times"></i>
									         </span>
									         <span class="labelauty-unchecked">스파&마사지</span>
									         <span class="labelauty-checked-image">
									            <i class="fa fa-check"></i>
									         </span>
									         <span class="labelauty-checked">스파&마사지</span>
									      </label>
								      </div>			 
								</div>
								<div class="form-row">
									<div class="form-holder"> 
										<input class="to-labelauty labelauty" type="checkbox" id="checkbox-5" name="h_facilities" value="카페" style="display: none;" <c:if test="${fn:contains(facilities,'카페') }">checked</c:if>>
									      <label for="checkbox-5" style="min-width: 70px;">
									         <span class="labelauty-unchecked-image">
									            <i class="fa fa-times"></i>
									         </span>
									         <span class="labelauty-unchecked">카페</span>
									         <span class="labelauty-checked-image">
									            <i class="fa fa-check"></i>
									         </span>
									         <span class="labelauty-checked">카페</span>
									      </label>
								      </div>
								      <div class="form-holder"> 
										<input class="to-labelauty labelauty" type="checkbox" id="checkbox-6" name="h_facilities" value="레스토랑" style="display: none;" <c:if test="${fn:contains(facilities,'레스토랑') }">checked</c:if>>
									      <label for="checkbox-6" style="min-width: 70px;">
									         <span class="labelauty-unchecked-image">
									            <i class="fa fa-times"></i>
									         </span>
									         <span class="labelauty-unchecked">레스토랑</span>
									         <span class="labelauty-checked-image">
									            <i class="fa fa-check"></i>
									         </span>
									         <span class="labelauty-checked">레스토랑</span>
									      </label>
								      </div>
								      <div class="form-holder"> 
										<input class="to-labelauty labelauty" type="checkbox" id="checkbox-7" name="h_facilities" value="오락시설" style="display: none;" <c:if test="${fn:contains(facilities,'오락시설') }">checked</c:if>>
									      <label for="checkbox-7" style="min-width: 70px;">
									         <span class="labelauty-unchecked-image">
									            <i class="fa fa-times"></i>
									         </span>
									         <span class="labelauty-unchecked">오락시설</span>
									         <span class="labelauty-checked-image">
									            <i class="fa fa-check"></i>
									         </span>
									         <span class="labelauty-checked">오락시설</span>
									      </label>
								      </div>
								      <div class="form-holder"> 
										<input class="to-labelauty labelauty" type="checkbox" id="checkbox-8" name="h_facilities" value="기념품가게" style="display: none;" <c:if test="${fn:contains(facilities,'기념품가게') }">checked</c:if>>
									      <label for="checkbox-8" style="min-width: 100px;">
									         <span class="labelauty-unchecked-image">
									            <i class="fa fa-times"></i>
									         </span>
									         <span class="labelauty-unchecked">기념품가게</span>
									         <span class="labelauty-checked-image">
									            <i class="fa fa-check"></i>
									         </span>
									         <span class="labelauty-checked">기념품가게</span>
									      </label>
								      </div>		
								</div>
								<div class="form-row">
									<div class="form-holder"> 
										<input class="to-labelauty labelauty" type="checkbox" id="checkbox-9" name="h_facilities" value="환전소" style="display: none;" <c:if test="${fn:contains(facilities,'환전소') }">checked</c:if>>
									      <label for="checkbox-9" style="min-width: 70px;">
									         <span class="labelauty-unchecked-image">
									            <i class="fa fa-times"></i>
									         </span>
									         <span class="labelauty-unchecked">환전소</span>
									         <span class="labelauty-checked-image">
									            <i class="fa fa-check"></i>
									         </span>
									         <span class="labelauty-checked">환전소</span>
									      </label>
								      </div>
								      <div class="form-holder"> 
										<input class="to-labelauty labelauty" type="checkbox" id="checkbox-10" name="h_facilities" value="세탁실" style="display: none;" <c:if test="${fn:contains(facilities,'세탁실') }">checked</c:if>>
									      <label for="checkbox-10" style="min-width: 70px;">
									         <span class="labelauty-unchecked-image">
									            <i class="fa fa-times"></i>
									         </span>
									         <span class="labelauty-unchecked">세탁실</span>
									         <span class="labelauty-checked-image">
									            <i class="fa fa-check"></i>
									         </span>
									         <span class="labelauty-checked">세탁실</span>
									      </label>
								      </div>
								      <div class="form-holder"> 
										<input class="to-labelauty labelauty" type="checkbox" id="checkbox-11" name="h_facilities" value="의료시설" style="display: none;" <c:if test="${fn:contains(facilities,'의료시설') }">checked</c:if>>
									      <label for="checkbox-11" style="min-width: 70px;">
									         <span class="labelauty-unchecked-image">
									            <i class="fa fa-times"></i>
									         </span>
									         <span class="labelauty-unchecked">의료시설</span>
									         <span class="labelauty-checked-image">
									            <i class="fa fa-check"></i>
									         </span>
									         <span class="labelauty-checked">의료시설</span>
									      </label>
								      </div>
								      <div class="form-holder"> 
										<input class="to-labelauty labelauty" type="checkbox" id="checkbox-12" name="h_facilities" value="물품보관소" style="display: none;" <c:if test="${fn:contains(facilities,'물품보관소') }">checked</c:if>>
									      <label for="checkbox-12" style="min-width: 100px;">
									         <span class="labelauty-unchecked-image">
									            <i class="fa fa-times"></i>
									         </span>
									         <span class="labelauty-unchecked">물품보관소</span>
									         <span class="labelauty-checked-image">
									            <i class="fa fa-check"></i>
									         </span>
									         <span class="labelauty-checked">물품보관소</span>  
									      </label>
								      </div>				
								</div>  
								<div class="form-row">  
									<div class="form-holder">  
										<legend>hotel description</legend>    
										<textarea rows="6" cols="53" style="font-size:1em;border:  2px solid #e5e5e5;border-radius: 4px;" name="h_comment" form="hotelInsertForm" placeholder="추가설명">${hotel.h_comment }</textarea>
									</div>
								</div>         
								<div class="form-row">
									<div class="form-holder" style="margin-bottom:0">
										<label for="file">Hotel Images</label>
										<input multiple="multiple" type="file" name="file" style="display:none">
										<button type="button" onclick="changeFile()">사진변경</button>
										<button type="button" onclick="addFile()">사진추가</button>
										<input type="hidden" name="filebtn" value="">
									</div>    
								</div> 
									<div class="form-holder" >
										<fieldset style="border:  2px solid #e5e5e5;border-radius: 4px;">
											<legend style="font-size: 11px;font-weight: 700;color: #999;">Preview</legend>
											<div id="preview"></div>  
										</fieldset> 
									</div>
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
										$("input[type='file']").change(function(e){
											$("#preview").empty();
											var files=e.target.files; //fileList 객체
											var arr=Array.prototype.slice.call(files);
											preview(arr);
										}); 
										function preview(arr){
											arr.forEach(function(f){
												var fileName=f.name;
												if(fileName.length>15){ 
													fileName=fileName.substring(0,7)+"...";
												}  
												var str="";
												var reader=new FileReader();
												reader.onload=function(e){
													str='<div style="display:inline-flex; padding:10px">';
													str+='<li><span>'+fileName+'</span><br>';
													str+='<img src="'+e.target.result+'" title="'+f.name+'" width=150 height=150 />'
													str+='</li></div>';
													$("#preview").append(str);
												};
												reader.readAsDataURL(f);
											});
											
										};
									});
								
								</script>
							</div>
			            </section>
			            <!-- SECTION 3 -->
			            <h2>
			            	<p class="step-icon"><span>03</span></p>
			            	<span class="step-text">객실 수정</span>
			            </h2>
			            <section>
			                <div class="inner">
			                	<div class="wizard-header">
									<h3 class="heading">Room Register</h3>
									<p>Please enter room infomation and proceed to the next step so you can register your hotel and rooms</p>
								</div>
							<div id="room-insert">
								<c:forEach items="${hotel.rooms }" var="room" varStatus="status">
								
									<div id="one-of-rooms">
										<div class="form-row">
					                		<div class="form-holder">
					                			<fieldset>
													<legend>Room Type</legend>
													<input type="hidden" name="num" value="${room.r_num }">
													<input type="text" class="form-control" name="type" placeholder="객실 유형(일반,디럭스...)" value="${room.r_type }">
												</fieldset>			                			
					                		</div>
					                		<div class="form-holder">
												<fieldset>
													<legend>Room Price</legend>
													<input type="text" class="form-control" name="price" placeholder="객실 가격(1박)" value="${room.r_price }">
												</fieldset>
											</div>
					                	</div>
					                	<div class="form-row">
					                		<div class="form-holder">
												<fieldset>
													<legend>Person</legend>
													<input type="text" class="form-control" name="person" placeholder="정원(4)" value="${room.r_person }">
												</fieldset>
											</div>
											<div class="form-holder">
												<fieldset>
													<legend>Breakfast</legend>
													<input type="text" class="form-control" name="breakfast" placeholder="유/무" value="${room.r_breakfast }">
												</fieldset>
											</div>
											<div class="form-holder">
												<fieldset>
													<legend>Count</legend>
													<input type="text" class="form-control" name="stock" placeholder="객실수" value="${room.r_stock }">
												</fieldset>
											</div>
											<c:choose>
												<c:when test="${status.first }">
													<div class="form-holder">
														<div style="padding-top:17px">
															<button type="button" class="btn btn-success addbtn">추가</button>
														</div>  
													</div>
												</c:when>
												<c:otherwise>
													<div class="form-holder">
														<div style="padding-top:17px">
															<button type="button" class="btn btn-success removebtn">삭제</button>
														</div>  
													</div>
												</c:otherwise>
											</c:choose>
					                	</div>
					                </div>
				                </c:forEach>
			                </div>	
			                <script>
			                 $(function(){
			                	var str='<div id="one-of-rooms">'+
											'<div class="form-row">'+
						                		'<div class="form-holder">'+
						                			'<fieldset>'+
														'<legend>Room Type</legend>'+
														'<input type="text" class="form-control" name="type" placeholder="객실 유형(일반,디럭스..)">'+
													'</fieldset>'+			                			
						                		'</div>'+
						                		'<div class="form-holder">'+
													'<fieldset>'+
														'<legend>Room Price</legend>'+
														'<input type="text" class="form-control" name="price" placeholder="객실 가격(1박)">'+
													'</fieldset>'+
												'</div>'+
						                	'</div>'+
						                	'<div class="form-row">'+
						                		'<div class="form-holder">'+
													'<fieldset>'+
														'<legend>Person</legend>'+
														'<input type="text" class="form-control" name="person" placeholder="정원(4)">'+
													'</fieldset>'+
												'</div>'+
												'<div class="form-holder">'+
													'<fieldset>'+
														'<legend>Breakfast</legend>'+
														'<input type="text" class="form-control" name="breakfast" placeholder="유/무">'+
													'</fieldset>'+
												'</div>'+
												'<div class="form-holder">'+
													'<fieldset>'+
														'<legend>Count</legend>'+
														'<input type="text" class="form-control" name="stock" placeholder="객실수">'+
													'</fieldset>'+
												'</div>'+
												'<div class="form-holder">'+
													'<div style="padding-top:17px">'+
														'<button type="button" class="btn btn-success removebtn">삭제</button>'+
													'</div>'+
												'</div>'+
						                	'</div>'+
						                '</div>';
			                	$(".addbtn").click(function(){
			            			$("#room-insert").append(str);
			            		});
			                	$("#room-insert").on("click",".removebtn",function(){
			            			$(this).closest("div#one-of-rooms").remove();
			            		});  
		                
			                 }); 
			                </script>	
			                	<div class="form-row">
									<div class="form-holder">
										<fieldset>
											<legend>Total RoomNumber</legend>
											<input type="text" class="form-control" name="h_room_num" placeholder="Number of Rooms" value="${hotel.h_room_num }">
										</fieldset>
									</div>
								</div>
							</div>
			            </section>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="../common/selFooter.jsp"%>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/jquery.steps.js"></script>
<script src="resources/js/main.js"></script>
</body>
</html>