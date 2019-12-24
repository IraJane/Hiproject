<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.Member"%>
<%@include file="./../common/common.jsp"%>

<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<link href="<c:url value="/css/hotelNow.css" />" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">


<style>
body {
	margin:0;
	padding:0;
	
}
.top-title {
	    text-align: center;
    font-size: 30px;
}
h4{
    background: #2911007d;
    border-radius: 5px;
    font-size: 20px;
    margin: 3px;
    padding: 10px;
    color: white;
}
.table {
	    background: #cccccc82;
    width: 98%;
    margin: 10px auto;
    border-radius:5px;
    display: inline-block;
}
.listTable {
	width: 100%;
    border: 2px solid #b5b4b4;
    border-radius: 5px;
}
.listOrders {
	margin: 10px 0;
    border-radius: 5px;
    border: 1px solid #cccccc;
    text-align: center;
 	
}
.total-wrapper {
	width: 80%;
	margin:auto;
}
.h_nameDetail {
	font-size:30px;
	color:blue;
	width:40px;
	
}
.h_typeDetail {
	border-radius: 5px;
    background: #b7b7b7;
    font-size: 15px;
    /* padding: 5px; */
    color: white;
}
.updatedeletebtn {
	float: right;
}
.updatedeletebtn a{
    color:black;
    text-decoration:none;
}
.checkCheckin {
	background: #009a00;
    border-radius: 5px;
    padding: 2px;
    font-size: 15px;
    border: none;
    color: white;
}
.checkForm{
	margin: 0px;
}
</style>






				
<%@include file="/WEB-INF/common/header.jsp"%>

<h3 class="top-title">호텔 예약 현황</h3>
<div class="total-wrapper">

<a href="insertHo.ad?s_num=${s_num }">추가하기</a>

<br>

	<c:forEach items="${hotel }" var="list" varStatus="i">

		<table class="listTable">


			<tr>
				<td><i class="material-icons">home</i>${i.count }번</td>

			</tr>
			<tr>

				<td colspan="2" class="h_nameDetail"><span class="h_typeDetail">${list.h_type }</span>&nbsp;&nbsp;${list.h_name }

				</td>
			</tr>
			<tr>
				<td colspan="2">주소: ${list.h_nation }, ${list.h_address1 },${list.h_address2 }

				</td>
			</tr>
			<tr>

				<td colspan="2">전화번호: ${list.h_phone }</td>
			</tr>
			<tr>
				<td colspan="2">소개글:${list.h_comment }</td>
			</tr>
			<tr>

				<td colspan="2" class="updatedeletebtn">
				<a href="updateHotel.ad?h_num=${list.h_num }">수정하기</a>&nbsp;&nbsp;
				<a href="deleteHotel.ad?h_num=${list.h_num }">삭제하기</a></td>
			</tr>
		</table>


	
 	<div class="listOrders">
		<h4>예약내역</h4> 
 
		<c:forEach items="${mainOlist }" var="mainOrder">
			<c:forEach items="${roomList }" var="room">
				<c:forEach items="${orderDlist }" var="orderDetail">
				<c:forEach items="${memberlist }" var="member">
				

				<c:if test="${list.h_num == room.h_num && 
				room.r_num == orderDetail.r_num && 
				orderDetail.o_num == mainOrder.o_num &&
				mainOrder.m_num == member.m_num}">
				<table class="table">
						<tr>
							<td colspan="2">예약번호: ${mainOrder.o_num }</td>
							
						</tr>
						<tr>
							<td>고객정보: ${member.m_num }</td>
							<td>영문 이름: ${mainOrder.o_engname }</td>
						</tr>
	
						<tr>
							<td>예약 일자: ${mainOrder.o_checkin } ~ ${mainOrder.o_checkout }</td>
							<td>인원: ${mainOrder.o_totalpeople }</td>
						</tr>
						<tr>
							<td>방 종류: ${room.r_type } </td>
							<td>${orderDetail.o_count }개</td>
						</tr>
						<tr>
							<td colspan="2">결제 금액: </td>
						</tr>
						<tr>
							<td colspan="2">요구사항: ${mainOrder.o_comment  }</td>
						</tr>

						<tr>
							<td colspan="2">
								
									 
									<c:if test="${mainOrder.o_checker == 0}">
										<form class="checkForm" action="checkCheckin.der">
											
											<input type="hidden" name="onum" value="${mainOrder.o_num }">
											상태 : <input class="checkCheckin" type="submit" value="&nbsp;Waiting..."><br>
											<span>※2개 이상의 예약이 있을경우 둘다 확정이 됩니다</span>
										
										
										
										</form>
										
									</c:if>
									<c:if test="${mainOrder.o_checker == 1}">상태 : <input class="checkCheckin" type="button" value="확인완료"></c:if>
							
								
							</td>
						</tr>

				</table>
			</c:if>
			
		</c:forEach>
		
		</c:forEach>
		
		</c:forEach>
		
		</c:forEach>
	</div>
	
	
	
	
	</c:forEach>
		
</div> 
	



<%@include file="../common/footer.jsp"%>