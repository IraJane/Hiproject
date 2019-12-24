<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<style type="text/css">
	.btn-primary{
		background-color : #0000ac;
	}
</style>

<script type="text/javascript">
	function register() {
		var chk1 = /^[a-zA-Z0-9]{4,12}$/
		var chk2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		var email = document.getElementById("m_email");
		var password = document.getElementById("m_password");
		var name = document.getElementById("m_name");
		var nickname = document.getElementById("m_nickname");
		var phone = document.getElementById("m_phone");
		
		
		if (email.value=="") {
			alert("이메일을 입력하세요")
			email.focus();
			return false;
			}
		
		if (!chk2.test(email.value)){
			alert("이메일 형식에 맞지 않습니다")
			email.focus();
			return false;
			}
		
		if (password.value=="") {
			alert("비밀번호를 입력하세요")
			password.focus();
			return false;
			}
		if (!chk1.test(password.value)) {
			alert("비밀번호 형식에 맞지 않습니다")
			password.focus();
			return false;
		}
		if (name.value=="") {
			alert("이름을 입력하세요")
			name.focus();
			return false;
			}
		if (nickname.value=="") {
			alert("사용할 닉네임을 입력하세요")
			nickname.focus();
			return false;
			}
		if (phone.value=="") {
			alert("휴대폰 번호를 입력하세요")
			phone.focus();
			return false;
			}
		var formData = $("#registerForm").serialize();
		
		$.ajax({
			cache : false,
			url : "register.mem",
			type : "POST",
			data : formData,
			success : function(data) {
				location.href="main.jsp";
			},
			error : function(data) {
				alert("가입할 수 없는 이메일입니다.")
			}
		});
	} 
</script>
<body>
<%@include file="/WEB-INF/common/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-5 mx-auto">
				<div>
					<div class="myform form">
						<div class="logo mb-3">
							<div class="col-md-12 text-center">
								<h1>Signup</h1>
							</div>
						</div>
						<form id="registerForm" commandname="register" name="registerForm">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="text" name="m_email" class="form-control" id="m_email" placeholder="Enter Email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> <input
									type="password" name="m_password" id="m_password"
									class="form-control" placeholder="Enter Password">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text"
									name="m_name" class="form-control" id="m_name" placeholder="Enter Name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">NickName</label> <input
									type="text" name="m_nickname" class="form-control"
									id="m_nickname" placeholder="Enter Nickname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">PhoneNumber</label> <input
									type="text" name="m_phone" id="m_phone" class="form-control" placeholder="Enter Phone">
							</div>
							<div class="col-md-12 text-center mb-3">
								<button type="button" id="btnSubmit" onclick="register()"
									class=" btn btn-block mybtn btn-primary tx-tfm">Get
									Started For Free</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>