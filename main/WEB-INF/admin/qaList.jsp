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
<title>QA List</title>

<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	
</script>
<style type="text/css">
table {
	table-layout: fixed;
	word-wrap: break-word;
	/*     overflow-y: hidden; */
}
.material-icons.red {
	color: #FF0000;
}
.material-icons.green {
	color: #04B404;
}
#page {
	text-align: center;
}
</style>
</head>

<body>	
<%@include file="/WEB-INF/common/header.jsp"%>

	<div class="container">
		<!-- <div class="container-fluid"> -->
		<div class="row">
			<div class="col-md-12" >
				<ul class="nav nav-tabs nav-justified">
					<li role="presentation"><a href="main.ad" id="home">Home</a></li>
					<li role="presentation"><a href="listSel.ad" id="seller">Seller</a></li>
					<li role="presentation"><a href="listMem.ad" id="member">Member</a></li>
					<li role="presentation" class="active"><a href="listQa.ad" id="qa">QA</a></li>
					<li role="presentation"><a href="listReview.ad">Reviews</a></li>
				</ul>
			</div>
			
		</div>


		<div class="row" id="rowdata">
			<div class="col page-header">
				<h1>
					QA관리 페이지<small>QA manager</small>
				</h1>
				<a href="<%=request.getContextPath()%>/main.ad">관리자 메인 페이지로 돌아가기</a>
				<p>기본적으로 QA등록일 기준으로 정렬됩니다</p>
			</div>
		</div>

		<div class="row">
			<div class="col">
				<form action="listQa.ad" method="get">
					<select name="whatColumn">
						<option value="all"
							<c:if test="${whatColumn eq 'all' }">selected</c:if>>전체 보기</option>
						<option value="q_checked"
							<c:if test="${whatColumn eq 'q_checked' }">selected</c:if>>미해결 검색</option>
						<option value="q_num"
							<c:if test="${whatColumn eq 'q_num' }">selected</c:if>>사건번호 검색</option>
						<option value="q_title"
							<c:if test="${whatColumn eq 'q_title' }">selected</c:if>>분류 검색</option>
						<option value="q_comment"
							<c:if test="${whatColumn eq 'q_comment' }">selected</c:if>>내용 검색</option>
					</select> 
					<input type="text" name="keyword" value=${keyword }> 
					<input type="submit" value="검색">
				</form> 
			</div>
		
					
		</div>



		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover table-condensed">
					<tr>
						<th class="col-md-1">번호</th>
						<th class="col-md-2">이메일</th>
						<th class="col-md-1">분류</th>
						<th class="col-md-4">문의내용</th>
						<th class="col-md-2">등록일</th>
						<th class="col-md-1">상태</th>
						<th class="col-md-1">삭제</th>
					</tr>

					<c:forEach items="${qaList}" var="qa" varStatus="status">
						<tr>
							<td>${qa.q_num }</td>
							<td>${qa.m_email}</td>
							<td>${qa.q_title}</td>
							<td>${qa.q_comment }</td>
							<td><fmt:formatDate value="${qa.q_regdate}"
									pattern="yyyy-MM-dd" /></td>

							<td><c:choose>
									<c:when test="${qa.q_checked eq 1}">
										<a href="<%=request.getContextPath() %>/updateQa.ad?q_num=${qa.q_num}&pageNumber=${pageInfo.pageNumber}&whatColumn=${whatColumn }&keyword=${keyword}"><i class="material-icons green">mood</i></a>
										<%-- <a href="#" onclick="check()">${qa.q_num }<i class="material-icons green">mood</i></a> --%>

									</c:when>
									<c:otherwise>
										<a href="<%=request.getContextPath() %>/updateQa.ad?q_num=${qa.q_num}&pageNumber=${pageInfo.pageNumber}&whatColumn=${whatColumn }&keyword=${keyword}"><i class="material-icons red">sentiment_very_dissatisfied</i></a>

									</c:otherwise>
								</c:choose></td>

							<td>
								<a href="deleteQa.ad?q_num=${qa.q_num }&pageNumber=${pageInfo.pageNumber }&whatColumn=${whatColumn }&keyword=${keyword}">
								<i class="material-icons">delete_forever</i></a>
							</td>
	
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row" id="page">
			<div class="col" >${pageInfo.pagingHtml}</div>
		</div>

	</div>
	
	

	
	
	
</body>
</html>