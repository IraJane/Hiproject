<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.Member"%>
<%@ page import="java.net.URLEncoder"%>
<%@ include file="./../common/common.jsp"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Seller List</title>

<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script type="text/javascript">
	
</script>
<style>
table, th, td {
	table-layout: fixed;
	word-wrap: break-word;
	text-align: center;
}

#page {
	text-align: center;
}

.col page-header {
	background: 
}

</style>
</head>
<body>

	<%@include file="/WEB-INF/common/header.jsp"%>

	<!-- <div class="container-fluid"> -->
	<div class="container">
		
		<div class="row">
			<div class="col">
				<ul class="nav nav-tabs nav-justified">
					<li role="presentation"><a href="main.ad"
						id="home">Home</a></li>
					<li role="presentation" class="active"><a href="listSel.ad" id="seller">Seller</a></li>
					<li role="presentation"><a href="listQa.ad" id="qa">Q & A</a></li>
					<li role="presentation"><a href="listMem.ad" id="member">Member</a></li>
					<li role="presentation"><a href="listReview.ad">Reviews</a></li>
				</ul>
			</div>
		</div>
		
		<div class="row">
			<div class="col page-header">
				<h1>
					판매자 관리 페이지<small>Seller manager</small>
				</h1>
				<a href="<%=request.getContextPath()%>/main.ad">관리자 메인 페이지로 돌아가기</a>
				<p>안녕하세요.</p>
			</div>
		</div>

		<div class="row">
			<div class="col">
				<form action="listSel.ad" method="get">
					<select name="whatColumn">
						<option value="all"
							<c:if test="${whatColumn eq 'all' }">selected</c:if>>전체보기</option>
						<option value="s_email"
							<c:if test="${whatColumn eq 's_email' }">selected</c:if>>아이디검색</option>
						<option value="s_phone"
							<c:if test="${whatColumn eq 's_phone' }">selected</c:if>>연락처검색</option>
						<option value="s_comnumber"
							<c:if test="${whatColumn eq 's_comnumber' }">selected</c:if>>사업자등록번호검색</option>
					</select> <input type="text" name="keyword"> 
					<input type="submit" value="검색">
				</form>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<a href="insertSel.ad"><i class="material-icons">add</i></a>
					
				<table class="table table-hover table-condensed">
					<tr>
						<th>판매자번호</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>연락처</th>
						<th>사업자등록번호</th>
						<th>매물관리</th>
						<th>정보수정</th>

						<!-- <th>삭제</th> -->
					</tr>
					<c:forEach items="${selList }" var="sel">
						<tr>
							<td>${sel.s_num }</td>
							<td>${sel.s_email}</td>
							<td>${sel.s_password}</td>
							<td>${sel.s_name}</td>
							<td>${sel.s_phone}</td>
							<td>${sel.s_comnumber}</td>
							<td><a href="hotelNow.ad?s_num=${sel.s_num }">매물관리</a></td>
							<td><a href="updateSel.ad?s_num=${sel.s_num }">정보수정</a></td>
							<%-- <td><a href="deleteSel.ad?s_num=${sel.s_num }">삭제</a></td> --%>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row" id="page">
			<div class="col"><h3>${pageInfo.pagingHtml}</h3></div>
		</div>






	</div>


</body>
</html>