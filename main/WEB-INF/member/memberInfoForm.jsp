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
function deleteMem() {
	var popupX = (window.screen.width/2)-(500/2);
	var popupY = (window.screen.height/2)-(200/2);
	
	window.open(	
			'delete.mem','_blank','height=200, width=500, toolbar=no, menubar=no, location=no, scrollbars=no, status=no, resizable=no, fullscreen=no, channelmode=yes, left='+ popupX +', top='+ popupY
			); return false
}
</script>


<script type="text/javascript">
	function register() {
		var chk1 = /^[a-zA-Z0-9]{4,12}$/
		var chk2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		var email = document.getElementById("m_email");
		var pwd = document.getElementById("pwd");
		var pwd1 = document.getElementById("pwd1");
		var pwd2 = document.getElementById("pwd2");
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
		
		if(pwd1.value != ""){
			if (!chk1.test(pwd1.value)) {
			alert("비밀번호 형식에 맞지 않습니다")
			password.focus();
			return false;
			}
		}
		
		if(pwd1.value == pwd.value){
			alert("현재 비밀번호와 같습니다")
			password.focus();
			return false;
		}
		
		if(pwd1.value != pwd2.value){
			alert("비밀번호 확인에 실패했습니다")
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
		
		if(confirm("수정하시겠습니까?")) {
			var formData = $("#updateForm").serialize();
			
			$.ajax({
				cache : false,
				url : "update.mem",
				type : "POST",
				data : formData,
				success : function(data) {
					
					alert("정보 수정 완료");
					location.href="main.jsp";
					
				},
				error : function(data) {
					alert("정보 수정 실패");
				}
			});
		}
		
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
								<h1>My Info</h1>
							</div>
						</div>
						<form id="updateForm" commandname="member" name="updateForm">
							<input type="hidden" name="m_num" value="${member.m_num }">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="" name="m_email" class="form-control" id="m_email"
									value="${member.m_email }" readOnly>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> <input
									type="password" name="m_password" id="pwd"
									class="form-control" 
									value="${member.m_password }" readOnly>
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">New Password</label> <input
									type="password" name="new_m_password" id="pwd1"
									class="form-control" placeholder="Enter New Password">
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Check Password</label> <input
									type="password" id="pwd2"
									class="form-control" placeholder="Enter New Password">
							</div>
							
								<!-- 	<div class="form-group" id="alert-success">비밀번호가 일치합니다.</div>
									<div class="form-group" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
									<div class="form-group" id="alert-danger2">현재 비밀번호와 일치합니다.</div> -->
							
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text"
									name="m_name" class="form-control" id="m_name" placeholder="Enter Name"
									value="${member.m_name }">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">NickName</label> <input
									type="text" name="m_nickname" class="form-control"
									id="m_nickname" placeholder="Enter Nickname"
									value="${member.m_nickname }">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">PhoneNumber</label> <input
									type="text" name="m_phone" id="m_phone" class="form-control" placeholder="Enter Phone"
									value="${member.m_phone }">
							</div>
							<div class="col-md-12 text-center mb-3">
								<button type="button" id="btnSubmit" onclick="register()"
									class=" btn btn-block mybtn btn-primary tx-tfm">정보 수정</button>
							</div>
							<div class="col-md-12 ">
								<div class="form-group">
									<p class="text-center">
										<a href="#" id="signin" onclick="deleteMem()">탈퇴</a>
									</p>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>