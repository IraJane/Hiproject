<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
function toSelMain(){
	
	location.href='selMain.sel';
	
	
}

</script>
<style>
body {
margin: 0;
background:#e0e0e0a1;
}

.background-wrapper{
    border: none;
    height: 700px;
    background: url(resources/img/gro.jpg) no-repeat center;
	background-size: cover;
    margin: 0;
    padding: 0;

}
.background-wrapper::after { content: ''; dispaly: table; clear: both }

input {
    padding: 10px;
    margin: 10px 0;
    width: 100%;
    border-radius:5px;
    border: 1px solid #adadad;
}
span {
float:left;
}

.title-wrapper {

    margin: auto;
    background: #d0d0d0b8;
    padding: 10px;
    box-shadow: 2px 2px 11px 2px grey;
    width: 30%;
    text-align: center;
    border-radius:5px;
}

.form-wrapper {
	padding:15px;
}
.submitbtn {
	border:none;
	background:#212e89;
	color:white;
	font-size:20px;
	
}







</style>
<%@include file="../common/selHeader.jsp"%>
<div class="background-wrapper">

<br><br><br>
<div class="title-wrapper">

<!-- <div onclick="toSelMain()"><img src="resources/img/logo4.png"></div> -->
<h3>로그인</h3>
<a> 로그인하여 서비스를 이용하실 수 있습니다.</a>
<div class="form-wrapper">
<form action="selLogin.sel" method="post">

	<span>이메일</span> <br><input type="text" name="s_email" ><br>
	<span>비밀번호</span> <br><input type="password" name="s_password"><br>
	<span class="wrong"></span><br>
	<input class="submitbtn" type="submit" value="로그인"><br>

</form>

</div>
</div>
</div>

<%@include file="../common/selFooter.jsp"%>