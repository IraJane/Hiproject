<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./../common/common.jsp" %>
    
<h3>회원가입</h3>

<form:form commandName="sel" action="selSignup.sel" method="post">




	
	<p>이메일: <input type="text" name="s_email" value="${sel.s_email }"><form:errors path="s_email"/></p>
	<p>비밀번호 : <input type="password" name="s_password" value="${sel.s_password }"><form:errors path="s_password"/></p>
	<p>이름 : <input type="text" name="s_name" value="${sel.s_name }"><form:errors path="s_name"/></p>
	<p>전화번호: <input type="text" name="s_phone" value="${sel.s_phone }"><form:errors path="s_phone"/></p>
	<p>사업자번호: <input type="text" name="s_comnumber" value="${sel.s_comnumber }"><form:errors path="s_comnumber"/></p>
	<p><input type="submit" value="회원가입"></p>







</form:form>
    
    

    
    
    
    
    
    
    