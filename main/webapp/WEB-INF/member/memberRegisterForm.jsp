<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

memberRegisterForm.jsp<br>

<style type="text/css">
	.err {
		color : red;
		font-weight : bold;
	}
</style>

<form:form commandName="member"  action="register.mem" method="post">
	<p>
		<label for="m_email">이메일</label>
		<input type="text" name="m_email">
		<form:errors cssClass="err" path="m_email"/>
	</p>
	
	<p>
		<label for="m_password">비밀번호</label>
		<input type="password" name="m_password">
		<form:errors cssClass="err" path="m_password"/>
	</p>
	
	<p>
		<label for="m_name">이름</label>
		<input type="text" name="m_name">
		<form:errors cssClass="err" path="m_name"/>
	</p>
	
	<p>
		<label for="m_nickname">닉네임</label>
		<input type="text" name="m_nickname">
		<form:errors cssClass="err" path="m_nickname"/>
	</p>
	
	<p>
		<label for="m_phone">전화번호</label>
		<input type="text" name="m_phone">
		<form:errors cssClass="err" path="m_phone"/>
	</p>
	
	<p>
		<input type="submit" value="가입">
	</p>
</form:form>