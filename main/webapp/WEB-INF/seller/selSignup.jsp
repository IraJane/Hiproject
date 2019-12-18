<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

<%@include file="./../common/common.jsp" %>

<style>
body {
margin: 0;
    width: 100%;
    background: #f5f5f5;
}
h3{
    text-align: center;
    font-size: 30px;
}
.signup-container{
    width: 40%;

    height: 500px;
    margin: 100px auto;
    background: #f1f1f1;
    box-shadow: 1px 1px 5px 2px #9e9e9e;
    border-radius: 10px;
    overflow: hidden;


}

.leftbar{
    float: left;
    width: 25%;
    height: 97.777777%;
    /* border: 1px solid; */
    background: #3E4061;
    margin: 0px 25px 0 0;
    text-align: center;
    padding: 10px;
    font-size: 23px;
}
.leftbar-text{
	margin: 65px 0;
}
.rightbar {
	    width: 95%;

    margin: auto;
}

.rightbar h3{
    margin: 10px;
}
.rightbar-input{
    text-align: center;
    margin: 25px 60px;
}

.rightbar-input p{
    text-align: left;
}
.rightbar-input p input{
	padding: 10px;
    border-radius: 5px;
    border: 1px solid gray;
width: 100%;
}
.signupPtag{
	width: 91%;
    margin: auto;
    text-align: center;
}

.signupbtn{
border: none;
    background: #23308b;
    color: white;
    font-size: 15px;
}


</style>
<%@include file="./../common/selHeader.jsp" %> 
    
    
<div class="signup-container">


	
	
<!-- 	<div class="leftbar">
		
	
	</div>
 -->

<form:form commandName="sel" action="selSignup.sel" method="post">

	<div class="rightbar">
	<h3>회원가입</h3>
	<div class="rightbar-input">
			<p>
				이메일<br>
				<input type="text" name="s_email" value="${sel.s_email }" placeholder="이메일"><form:errors path="s_email"/>
			</p>
			<p>
				비밀번호<br>
				<input type="password" name="s_password" value="${sel.s_password }" placeholder="비밀번호"><form:errors path="s_password"/>
			</p>
			<p>
				이름<br>
				<input type="text" name="s_name" value="${sel.s_name }" placeholder="이름"><form:errors path="s_name"/></p>
			<p>
				전화번호<br>
				<input type="text" name="s_phone" value="${sel.s_phone }" placeholder="전화번호"><form:errors path="s_phone"/></p>
			<p>
				사업자번호<br>
				<input type="text" name="s_comnumber" value="${sel.s_comnumber }" placeholder="사업자번호"><form:errors path="s_comnumber"/></p>
			<p class="signupPtag"><input class="signupbtn" type="submit" value="회원가입"></p>

	</div>
	</div>






</form:form>
    
    

    
    
</div>
    
    
    
    
    