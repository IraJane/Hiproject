<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.Member"%>
<%@include file="./../common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, tr, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	
	<%-- <%
		if (session.getAttribute("loginfo") == null) {
			response.sendRedirect("main.jsp");
		} else {
			Member loginfo = (Member) session.getAttribute("loginfo");
			if (!loginfo.getM_email().equals("admin@admin.com")) {
				response.sendRedirect("main.jsp");
			}
		}
	%> --%>



	<h2>${num }번 판매자가 등록한 매물 목록</h2>
	<br>
	<a href="insertHo.ad?num=${num }">객실 추가</a>
	<br>
	<a href="listSel.ad">판매자 관리 페이지로 돌아가기</a>
	




	<c:choose>

		<c:when test="${empty hotelList}">

			<h2>매물이 없습니다.</h2>

		</c:when>

		<c:otherwise>
			<table>
				<tr>
					<th>번호</th>
					<!-- 			<th>판매자</th> -->
					<th>호텔 이름</th>
					<th>국가</th>
					<th>지역</th>
					<th>주소</th>
					<th>호텔유형</th>
					<th>호텔전화번호</th>
					<th>편의 시설</th>
					<th>인터넷</th>
					<th>반려동물</th>
					<th>주차</th>
					<th>흡연구역</th>
					<th>지원언어</th>
					<th>호텔 이미지</th>
					<th>홈페이지</th>
					<th>기타설명</th>
					<th>총객실수</th>
				</tr>

				<c:forEach items="${hotelList }" var="hotel" varStatus="i">
					<tr>
						<td>${hotel.num }</td>
						<%-- 				<td>${hotel.selNum }</td> --%>
						<td>${hotel.h_name }</td>
						<td>${hotel.h_nation }</td>
						<td>${hotel.h_address1 }</td>
						<td>${hotel.h_address2 }</td>
						<td>${hotel.h_type }</td>
						<td>${hotel.h_phone }</td>
						<td>${hotel.h_facilities }</td>
						<td>${hotel.h_internet }</td>
						<td>${hotel.h_animal }</td>
						<td>${hotel.h_parking }</td>
						<td>${hotel.h_smoke }</td>
						<td>${hotel.h_language }</td>
						<td>${hotel.h_image }</td>
						<td>${hotel.h_hotel_url }</td>
						<td>${hotel.h_comment }</td>
						<td><a
							href="listHo.ad?num=${hotel.selNum }&email=${email }&hname=${hotel.h_name }">${hotel.h_room_num }개</a></td>
					</tr>
				</c:forEach>
			</table>

			<hr>

			<c:if test="${not empty roomList}">
				<table>	
					<tr>
						<th>호텔 이름</th>
						<th>객실 유형</th>
						<th>객실 허용인원</th>
						<th>객실 가격(1박)</th>
						<th>객실 수</th>
						<th>조식포함여부</th>
						<th>객실 수정</th>
						<th>객실 삭제</th>
					</tr>

					<c:forEach items="${roomList }" var="room">
						<tr>
							<td>${room.hname }</td>
							<td>${room.r_type}</td>
							<td>${room.r_person}</td>
							<td>${room.r_price}</td>
							<td>${room.r_stock}</td>
							<td>${room.r_breakfast}</td>
							<td><a href="#">객실 수정</a></td>
							<td><a href="#">객실 삭제</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</c:otherwise>
	</c:choose>




</body>
</html>