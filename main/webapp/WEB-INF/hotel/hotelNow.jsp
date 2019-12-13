<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
h4{
    background: #0300a2;
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
    background: orange;
    font-size: 20px;
    padding: 5px;
}
.updatedeletebtn {
	float: right;
}
.updatedeletebtn a{
    color:black;
    text-decoration:none;
}
.checkCheckin {
	background: #00a200;
    border-radius: 5px;
    padding: 2px;
    font-size: 15px;
    border: none;
}
.checkForm{
	margin: 0px;
}
</style>


	



<div>header위치</div>
호텔 예약 현황
<br>

<div class="total-wrapper">


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
				<a href="updateHotel.ho?h_num=${list.h_num }">수정하기</a>&nbsp;&nbsp;
				<a href="deleteHotel.ho">삭제하기</a></td>
			</tr>
		</table>


<!-- 	<div class="listOrders"> -->
		<h4>예약내역</h4> 
 
		<c:forEach items="${mainOlist }" var="mainOrder">
			<c:forEach items="${roomList }" var="room">
				<c:forEach items="${orderDlist }" var="orderDetail">
				

				<c:if test="${list.h_num == room.h_num && room.r_num == orderDetail.r_num && orderDetail.o_num == mainOrder.o_num }">
				<table class="table">
						<tr>
							<td>고객정보: </td>
							<td>영문 이름: </td>
						</tr>
						<tr>
							<td>예약 일자: ~</td>
						</tr>
						<tr>
							<td>인원: </td>
						</tr>
						<tr>
							<td>방 종류: </td>
						</tr>
						<tr>
							<td>결제 금액: </td>
						</tr>
						<tr>
							<td>요구사항: </td>
						</tr>

						<tr>
							<td>
								
									 
									<c:if test="">
										<form class="checkForm" action="checkCheckin.der">
											
											<input type="hidden" name="onum" value="">
											상태:<input class="checkCheckin" type="submit" value="Waiting...">
										
										
										
										</form>
										
									</c:if>
									<c:if test="">상태:<input class="checkCheckin" type="button" value="확인완료"></c:if>
							
								
							</td>
						</tr>

				</table>
			</c:if>
		</c:forEach>
		</c:forEach>
		</c:forEach>
		</c:forEach>
		
	</div> 





