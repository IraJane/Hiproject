<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reviews</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



<style>
table {
	table-layout: fixed;
	word-wrap: break-word;
}
#page {
	text-align: center;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/common/header.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-md-12">

			<ul class="nav nav-tabs nav-justified">
			<li role="presentation"><a href="main.ad" id="home">Home</a></li>
			<li role="presentation"><a href="listSel.ad" id="seller">Seller</a></li>
			<li role="presentation"><a href="listMem.ad" id="member">Member</a></li>
			<li role="presentation"><a href="listQa.ad" id="qa">QA</a></li>
			<li role="presentation" class="active"><a href="listReview.ad" >Reviews</a></li>
		</ul>
	</div>
</div>
	<div class="row">
		<div class="col page-header">
			<h1>
				리뷰 관리 페이지<small>Review manager</small>
			</h1>
			<a href="<%=request.getContextPath()%>/main.ad">관리자 메인 페이지로 돌아가기</a>
			<p>안녕하세요.</p>
		</div>
	</div>
	<!-- <a href="#">리뷰등록</a> -->
	<div class="row">
		<div class="col">
			<form action=listReview.ad method="get">
				<select name="whatColumn">
					<option value="all">전체보기</option>
					<option value="h_name">숙소이름검색</option>
					<option value="m_nickname">작성자검색</option>
				</select>
				<input type="text" name="keyword">
				<input type="submit" value="검색">
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<table class="table table-hover table-condensed">
				<tr>
					<th class="col-md-1">리뷰번호</th>
					<th class="col-md-1">숙소이름</th>
					<th class="col-md-1">룸타입</th>
					<th class="col-md-2">숙박시간</th>
					<th class="col-md-1">작성자</th>
					<th class="col-md-1">평점</th>	
					<th class="col-md-3">리뷰내용</th>
					<th class="col-md-1">등록일</th>
					<th class="col-md-1">삭제</th>
				</tr>
					<c:forEach items="${list }" var="rvc">
						<tr>
							<td>${rvc.c_num }</td>
							<td>${rvc.h_name }</td>
							<td>${rvc.r_type }</td>
							<td><fmt:formatDate value="${rvc.o_checkin }" pattern="yyyy-MM-dd hh:mm"/>
								~ <fmt:formatDate value="${rvc.o_checkout }" pattern="yyyy-MM-dd hh:mm"/>
							</td>
							<td>${rvc.m_nickname }</td>
							<td>${rvc.c_star }</td>
							<td>${rvc.c_comment }</td>
							<td>
								<fmt:formatDate value="${rvc.c_date }" pattern="yyyy-MM-dd"/></td>
							<td><a href="deleteReview.ad?c_num=${rvc.c_num }" >삭제</a></td>
						</tr>		
					</c:forEach>		
			</table>
		</div>	
	</div>
	<div class="row" id="page">
		<div class="col">${pageInfo.pagingHtml}</div>
	</div>



</div>

</body>
</html>