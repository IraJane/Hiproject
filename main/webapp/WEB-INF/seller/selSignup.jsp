<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./../common/common.jsp" %>
    
<h3>회원가입</h3>

<form:form commandName="sel" action="selSignup.sel" method="post">




	
	<p>이메일: <input type="text" name="email" value="${sel.email }"><form:errors path="email"/></p>
	<p>비밀번호 : <input type="password" name="password" value="${sel.password }"><form:errors path="password"/></p>
	<p>이름 : <input type="text" name="name" value="${sel.name }"><form:errors path="name"/></p>
	<p>전화번호: <input type="text" name="phone" value="${sel.phone }"><form:errors path="phone"/></p>
	<p>사업자번호: <input type="text" name="comnumber" value="${sel.comnumber }"><form:errors path="comnumber"/></p>
	<p><input type="submit" value="회원가입"></p>







</form:form>
    
    

    
    
    
    
    
    
    