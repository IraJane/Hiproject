<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
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




<h3>예약 확인</h3> 
<form action="orderThis.der" method="post">
<input type="hidden" name="m_num" value="${sessionScope.loginfo.m_num }">
<input type="hidden" name="person" value="${adult }">
<table>
	
	<tr>
		<td colspan="2">
			${hotel.h_type }${hotel.h_name }
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
					<input type="text" class="priceofThisRoom-${i.count }" value="${list.r_price * rooms.getValue() }">
				</td>
				
			</tr>
		
			
			
		</c:if>

	</c:forEach>
	</c:forEach>
	
	<tr>
		<td colspan="2">
			예약 날짜:	${search.checkin } ~ ${search.checkout }
			<input type="hidden" name="o_checkin" value="${search.checkin }">
			<input type="hidden" name="o_checkout" value="${search.checkout }">
		</td>
		
				
	</tr>
	<tr>
		<td colspan="2">
			총 금액:	<span class="totalprice"></span>
		</td>
		
				
	</tr>
	
	


	
</table>

<h3>상세 정보를 입력해 주십시오.</h3>
	<div><input type="text" name="o_engname" placeholder="성(영문) 이름(영문)"></div>
	
	<h3>별도 요청 사항</h3>

	<p>별도 요청 제공이 보장되지 않습니다. 그러나 숙소 측에서 최선을 다해 준비할 것입니다.<br>
	예약 후에도 별도 요청 사항을 보내실 수 있어요!</p>
	
	<div><textarea name="o_comment" ></textarea></div>



	<input type="submit" value="예약하기">













</form>