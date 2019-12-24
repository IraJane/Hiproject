<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%-- <script>
function change(){
	location.href="<%=request.getContextPath() %>/selMain.sel";
	
}
</script> --%>
  
<style>
body {
	background:#e0e0e0a1;
  
}
td {
    padding: 10px;
}
form {
    width: 50%;
   	margin-left:80px;
   	padding-top:30px;  
}
.error {
    font-size: 12px;
    color: #ff2121;
    float: right;
}
.container {
	width: 50%;
	height: 700px;
	/* padding-top: 60px; */
	padding:0;
    background: white;
    margin: 40px auto;
    /* box-shadow: 0px 1px 6px 2px #c3c3c3; */     
    border-radius:10px;
}
.wrapper{
	width: 100%;
	margin:  0 auto;
	display: flex;
	display: -webkit-flex;
	justify-content: center;
	-o-justify-content: center;
	-ms-justify-content: center;
	-moz-justify-content: center;
	-webkit-justify-content: center;
	align-items: center;
	-o-align-items: center;  
	-ms-align-items: center;
	-moz-align-items: center;
	-webkit-align-items: center;	
	position:relative;   
	
}
.wrapper::after{
	content:"";
	background: url(../../ex/resources/img/gro.jpg);
	background-size:cover; 
	opacity:0.8;   
	top:0;  
	left:0;
	bottom:0;
	right:0;
	position:absolute;
	z-index:-1;
}
.col-md-8 {
    margin: 10px 5px;
}
.btn-primary{
	background:#980000;
	border:none;
}
div.left{  
	border-top-left-radius:10px; 
	border-bottom-left-radius:10px; 
	width:30%;	  
	height:100%;
	float:left;
	background:#3e4061;  
}
div.right{
	width:70%;
	float:right;
}
</style>
<script>
	$(function(){
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$('#pwd2').keyup(function(){
			var pwd1=$("#pwd1").val();
			var pwd2=$("#pwd2").val();
			if(pwd1!=""){
				if(pwd1==pwd2){
					$("#alert-success").show();
					$("#alert-danger").hide();
				}else{
					$("#alert-danger").show();
					$("#alert-success").hide();
				}
			}
		});
	});
</script>
</head>
<body>
<%@include file="../common/selHeader.jsp"%>	
<div class="wrapper">
<div class="container">
<div class="left">
<!-- <div style="padding-top:60px; margin-left:40px">
<div class="btn btn-success" onclick="change()">메인으로</div>  
</div>   -->
</div>
<div class="right">
<form:form commandName="sel" action="selInfo.sel" method="post">
<input type="hidden" name="s_num" value="${seller.s_num }">
<%-- <input class="form-control" type="text" name="s_email" value="${seller.s_email }" readonly> --%>
	<div class="form-horizontal">
		<div>
			<h2 style="text-align:center">내 정보 보기</h2>
		</div>
		<div>
			<p>아이디</p>
			<p><input class="form-control" type="text" name="s_email" value="${seller.s_email }" readonly></p>

		</div>
		<div>
			<p>현재 비밀번호</p>
			<p><input class="form-control" type="password"  name="s_password"  value="${seller.s_password }" readonly><%-- <form:errors class="error" path="s_password"/> --%></p>

		</div>
		<div>
			<p>비밀번호 변경</p>
			<p ><input class="form-control" type="password" name="new_password" id="pwd1" value=""></p>
		</div>
		<div>
			<p>비밀번호 확인</p>  
			<p><input class="form-control" type="password" id="pwd2"></p>
			<span id="alert-success" style="height:30px; color:#155724;"><small>비밀번호가 일치합니다.</small></span>
			<span id="alert-danger" style="height:30px; color:#DB0000;"><small>비밀번호가 일치하지 않습니다.</small></span>
			  
		</div>
		<div>  
			<p>이름</p>
			<p><input class="form-control" type="text" name="s_name" value="${seller.s_name }"><form:errors class="error" path="s_name"/>
			</p>

		</div>
		<div>
			<p>전화번호</p>
			<p><input class="form-control" type="text" name="s_phone" value="${seller.s_phone }"><form:errors class="error" path="s_phone"/></p>

		</div>
		<div>
			<p>사업자번호</p>
			<p><input class="form-control" type="text" name="s_comnumber" value="${seller.s_comnumber }"><form:errors class="error" path="s_comnumber"/></p>

		</div>

	</div><!-- form-horizonal -->
		<div class="col-md-8">
			<input class="btn btn-success"  type="submit" value="수정하기">
			<a class="btn btn-default" href="<%=request.getContextPath() %>/selDelete.sel?num=${seller.s_num }">탈퇴하기</a>
		</div>
</form:form>
</div>
</div>
</div>
<%@include file="../common/selFooter.jsp"%>
</body>
</html>