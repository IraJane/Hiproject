<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.Member"%>
<%@include file="./../common/common.jsp" %>

<head>
</head>

<body>

<p>판매자-계정삽입 페이지</p>

<%@include file="/WEB-INF/common/header.jsp"%>

<form:form commandName="seller" action="insertSel.ad" method="post">

	<p>
	이메일: <input type="text" name="s_email" value="${seller.s_email }">
	<form:errors path="s_email"/>
	</p>
	<p>
	비밀번호 : <input type="password" name="s_password" value="${seller.s_password }">
	<form:errors path="s_password"/>
	</p>
	<p>
	이름 : <input type="text" name="s_name" value="${seller.s_name }">
	<form:errors path="s_name"/>
	</p>
	<p>전화번호: <input type="text" name="s_phone" value="${seller.s_phone }">
	<form:errors path="s_phone"/>
	</p>
	<p>
	사업자번호: <input type="text" name="s_comnumber" value="${seller.s_comnumber }">
	<form:errors path="s_comnumber"/>
	</p>
	<p>
	<input type="submit" value="회원가입">
	</p>
</form:form>
    
</body>