<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.Member"%>
<%@ include file="./../common/common.jsp"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member List</title>

<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript">
	
	
	
</script>

<style type="text/css">
table {
	table-layout: fixed;
	word-wrap: break-word;
	/*     overflow-y: hidden; */
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
						<li role="presentation"><a href="main.ad" id="home" >Home</a></li>
						<li role="presentation"><a href="listSel.ad" id="seller">Seller</a></li>
						<li role="presentation" class="active"><a href="listMem.ad" id="member">Member</a></li>
						<li role="presentation"><a href="listQa.ad" id="qa">QA</a></li>
						<li role="presentation"><a href="listReview.ad" >Reviews</a></li>
					</ul>
			
			
			
			
			</div>
		</div>
		<div class="row">
			<div class="col page-header">
				<h1>
					사용자 관리 페이지<small>Member manager</small>
				</h1>
				<a href="<%=request.getContextPath()%>/main.ad">관리자 메인 페이지로 돌아가기</a>
				<p>안녕하세요.</p>
			</div>
		</div>
		
		<div class="row">
			<div class="col">
				<form action="listMem.ad" method="get">
					<select name="whatColumn">
						<option value="all" <c:if test="${whatColumn eq 'all' }">selected</c:if>>전체 보기</option>
						<option value="m_email" <c:if test="${whatColumn eq 'm_email' }">selected</c:if>>이메일 검색</option>
						<option value="m_name" <c:if test="${whatColumn eq 'm_name' }">selected</c:if>>이름 검색</option>
					</select> <input type="text" name="keyword"> 
					<input type="submit" value="검색">
				</form>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">

				<table class="table table-hover table-condensed">
					<tr>
						<td colspan="8"><a href="insertMem.ad">추가하기</a></td>
					</tr>
					<tr>
						<th>번호</th>
						<th>이메일</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>전화번호</th>
						<th>예약관리</th>
						<th>정보수정</th>
						<!-- <th>삭제</th> -->
					</tr>
					<c:forEach items="${memList }" var="mem">
						<tr>
							<td>${mem.m_num }</td>
							<td>${mem.m_email}</td>
							<td>${mem.m_password}</td>
							<td>${mem.m_name}</td>
							<td>${mem.m_nickname}</td>
							<td>${mem.m_phone}</td>
							<td><a href="reservationInfo.ad?m_num=${mem.m_num }">예약관리</a></td>
							<td><a
								href="updateMem.ad?m_num=${mem.m_num }&pageNumber=${pageInfo.pageNumber}">정보수정</a></td>
							<%-- <td><a
								href="deleteMem.ad?m_num=${mem.m_num }&pageNumber=${pageInfo.pageNumber}">삭제</a></td> --%>
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