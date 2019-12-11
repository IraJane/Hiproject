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


	<c:forEach items="${hodetail }" var="hotel" varStatus="i">

		<table class="listTable">


			<tr>
				<td><i class="material-icons">home</i>${i.count }번</td>

			</tr>
			<tr>

				<td colspan="2" class="h_nameDetail"><span class="h_typeDetail">${hotel.h_type }</span>&nbsp;&nbsp;${hotel.h_name }

				</td>
			</tr>
			<tr>
				<td colspan="2">주소: ${hotel.h_nation }, ${hotel.h_address1 },${hotel.h_address2 }

				</td>
			</tr>
			<tr>

				<td colspan="2">전화번호: ${hotel.h_phone }</td>
			</tr>
			<tr>
				<td colspan="2">소개글:${hotel.h_comment }</td>
			</tr>
			<tr>


				<td colspan="2" class="updatedeletebtn">
				<a href="#">수정하기</a>&nbsp;&nbsp;
				<a href="#">삭제하기</a></td>
			</tr>
		</table>


	<div class="listOrders">
		<h4>예약내역</h4>

		<c:forEach items="${thisRoom }" var="room">

				<table class="table">
					<c:if test="${room.hname == hotel.h_name}">
						<tr>
							<td>고객정보: ${room.oemail }</td>
							<td>영문 이름: ${room.oname }</td>
						</tr>
						<tr>
							<td>예약 일자: ${room.checkin }~${room.checkout }</td>
						</tr>
						<tr>
							<td>인원: ${room.people }</td>
						</tr>
						<tr>
							<td>방 종류: ${room.roomtype }</td>
						</tr>
						<tr>
							<td>결제 금액: ${room.totalprice }</td>
						</tr>
						<tr>
							<td>요구사항: ${room.comments }</td>
						</tr>

						<tr>
							<td>
								
									 
									<c:if test="${room.checker == 0}">
										<form class="checkForm" action="checkCheckin.der">
											
											<input type="hidden" name="onum" value="${room.onum }">
											상태:<input class="checkCheckin" type="submit" value="Waiting...">
										
										
										
										</form>
										
									</c:if>
									<c:if test="${room.checker == 1}">상태:<input class="checkCheckin" type="button" value="확인완료"></c:if>
							
								
							</td>
						</tr>
					</c:if>

				</table>
		</c:forEach>
	</div>



</c:forEach>

</div>














