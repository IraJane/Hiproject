<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>




<h3>예약 확인</h3> 
<form action="orderThis.der" method="post">
<input type="hidden" name="oemail" value="${sessionScope.loginfo.m_email }">
<input type="hidden" name="person" value="${adult }">
<table>
	<tr>
	
		<td><input type="hidden" name="hname" value="${room.hname}">${room.hname}</td>
	
	</tr>
	<tr>
	
		<td><input type="hidden" name="checkin" value="${checkin}">체크인:${checkin}</td>
	
	</tr>
	<tr>
	
		<td><input type="hidden" name="checkout" value="${checkout}">체크아웃:${checkout}</td>
	
	</tr>
	<tr>
	
		<td><input type="hidden" name="roomtype" value="${room.r_type}">선택 객실 : ${room.r_type}</td>
	
	</tr>
	<tr>
	
		<td><input type="hidden" name="d" value="">총 숙박기간 :</td>
	
	</tr>
	<tr>
	
		<td><input type="hidden" name="people" value="${people}">총 인원수: ${people}</td>
	
	</tr>
	<tr>
	
		<td><input type="hidden" name="totalprice" value="${totalprice}">금액: ${totalprice}</td>
	
	</tr>
	





</table>

<h3>상세 정보를 입력해 주십시오.</h3>
	<div><input type="text" name="oname" placeholder="성(영문) 이름(영문)"></div>
	
	<h3>별도 요청 사항</h3>

	<p>별도 요청 제공이 보장되지 않습니다. 그러나 숙소 측에서 최선을 다해 준비할 것입니다.<br>
	예약 후에도 별도 요청 사항을 보내실 수 있어요!</p>
	
	<div><textarea name="comments" ></textarea></div>



	<input type="submit" value="예약하기">













</form>