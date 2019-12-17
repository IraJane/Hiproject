<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<link href="<c:url value="/css/reservationFormStyle.css" />" rel="stylesheet">
<script>

$(document).ready(function(){
	

		
		var oneprice = 0;
		var totalprice =0;
		
		var length = $('.rtypelength').size();
		
	
		for(var i = 1; i<length+1;i++){
			
	
			oneprice = $('.priceofThisRoom-'+i).val();
			
			oneprice = parseInt(oneprice);
			
			totalprice = totalprice + oneprice; 
		}
		$('.totalprice').append().text(totalprice);
		
		
		
	});


</script>
<script>
/* function dateDiff(_date1, _date2) {
    var diffDate_1 = _date1instanceof Date ? _date1 :new Date(_date1);
    var diffDate_2 = _date2instanceof Date ? _date2 :new Date(_date2);
 
    diffDate_1 =new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
    diffDate_2 =new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());
 
    var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
    diff = Math.ceil(diff / (1000 * 3600 * 24));
 
    return diff;
}

 */


</script>
<%@include file="/WEB-INF/common/header.jsp"%>

<div class="reservation-container">



<div class="leftbar">
	<div class="left-importantbox ">
		<h5>이메일 전송</h5>
		<p>가입하신 이메일로 예약 내역이 전송됩니다.</p>

	</div>
	<div class="left-importantbox ">
		<h5>취소 위약금</h5>
		<p>취소 시 수수료가 부과됩니다</p>

	</div>
	<div class="left-importantbox ">
		<h5>예약 포함 사항</h5>
		<p>무료 Wi-Fi</p>
		<p>무료 주차</p>
	</div>
	<div class="left-importantbox">
		<h5>중요정보</h5>
		<p>도착 전 계좌 이체로 요금을 결제하셔야 합니다. 예약이 완료되면 숙박 업체 측에서 계좌 이체 안내를 위해 직접 연락드립니다.</p>
	</div>
	







</div>










<div class="reservation-wrrapper">


<h3 class="reservation-title">내 예약 정보</h3> 
<form action="orderThis.der" method="post">
<input type="hidden" name="m_num" value="${sessionScope.loginfo.m_num }">
<%-- <input type="hidden" name="person" value="${adult }"> --%>







<table class="reservation-table">
	<tr>
		<td colspan="2">
			<c:forEach items="${hotel.images }" var="image" varStatus="i">
				<img class="hotelimage" src="<%=request.getContextPath() %>/resources/Hotelimages/${hotel.h_name }/${image }">
			</c:forEach>
		</td>
		
				
	</tr>
	
	<tr>
		<td colspan="2">
			${hotel.h_type }<a class="reservation-table-name">${hotel.h_name }</a>
		</td>
		
				
	</tr>
	<tr>
		<td colspan="2">
			${hotel.h_nation }, ${hotel.h_address1 } ${hotel.h_address2 }
		</td>
		
				
	</tr>
	<c:forEach items="${list }" var="list">
	<c:forEach items="${rooms }" var="rooms" varStatus="i">
		
		<c:if test="${list.r_num == rooms.getKey() }">
		
		
		
			
			<tr>
				<td class="rtypelength">
					원하는 방: ${list.r_type }
					<input type="hidden" name="rooms" value="${rooms }">
					
					
				</td>
				<td>
					방 갯수 : ${rooms.getValue() }개
					<input type="hidden" class="priceofThisRoom-${i.count }" value="${list.r_price * rooms.getValue() }">
				</td>
				
			</tr>
		
			
			
		</c:if>

	</c:forEach>
	</c:forEach>
	
	<tr>
		<td colspan="2">
			체크인:	${search.checkin }
			<input type="hidden" name="o_checkin" value="${search.checkin }">
			<input type="hidden" name="o_checkout" value="${search.checkout }">
		</td>
		
		
		
				
	</tr>
	<tr>
		<td colspan="2">
			체크아웃:	${search.checkout }

		</td>
				
	</tr>
	
	<tr>
		<td colspan="2">
			총 숙박일: 

		</td>
		
				
	</tr>
	<tr>
		<td colspan="2">
			
			투숙객:${rooms.r_person }
			<select>
				<c:forEach begin="1" end="10" var="i" varStatus="i">
					<option value="i">${i.count }
				</c:forEach>
			</select>
			<!-- 이부분 수정하기  -->

		</td>
		
				
	</tr>
	
	<tr>
		<td colspan="2">
			총 금액:	<span class="totalprice"></span>
		</td>
		
				
	</tr>
	
	


	
</table>

<div class="innserdetail-textbox">
	<h3>상세 정보를 입력해 주십시오.</h3>
		<div>투숙객 성명 : <input type="text" name="o_engname" placeholder="성(영문) 이름(영문)"></div>
		
		<h3>별도 요청 사항</h3>
	
		<p>별도 요청 제공이 보장되지 않습니다. 그러나 숙소 측에서 최선을 다해 준비할 것입니다.<br>
		예약 후에도 별도 요청 사항을 보내실 수 있어요!</p>
		
		<div><textarea class="commentbox" name="o_comment" ></textarea></div>
	</div>
	<div class="submit-wrapper">
		<input class="submitbtn" type="submit" value="예약하기">
	
	</div>
















</form>



</div>




</div>
<%@include file="/WEB-INF/common/footer.jsp"%>


