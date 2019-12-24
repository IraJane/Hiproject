<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	function login() {
		
		var a = document.getElementById("email");
		
		var formData = $("#loginForm").serialize();
		
		$.ajax({
			cache : false,
			url : "login.mem",
			type : "POST",
			data : formData,
			success : function(data) {
				/***************** 관리자 *****************/
				if (a.value == ("admin@admin.com")) {
					//alert(a.value);
					opener.parent.location="main.ad";
					window.close();
				} else {
				//alert(a.value);
				alert("로그인 되었습니다");
				opener.parent.location.reload();
				window.close();
				}
			},
			error : function(data) {
				alert("아이디 혹은 비밀번호 틀림");
			}
		});
	}
	
	function register() {
		opener.document.location = "register.mem";
		self.close();
	}
	
	function findPw() {
		opener.document.location = "findPw.mem";
		self.close();
	}
	
</script>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-5 mx-auto">
				<div id="first">
					<div class="myform form ">
						<div class="logo mb-3">
							<div class="col-md-12 text-center">
								<h1>Login</h1>
							</div>
						</div>
						<form name="loginForm" id="loginForm">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="m_email" class="form-control" id="email"
									aria-describedby="emailHelp" placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> <input
									type="password" name="m_password" id="password"
									class="form-control" aria-describedby="emailHelp"
									placeholder="Enter Password">
							</div>
							<div class="col-md-12 text-center ">
								<button type="button" id="btnLogin" onclick="login()"
									class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
							</div>
							<div class="col-md-12 ">
								<div class="login-or">
									<hr class="hr-or">
									<span class="span-or">or</span>
								</div>
							</div>
							<div class="col-md-12 mb-3">
								<p class="text-center">
									<a href="javascript:void();" class="google btn mybtn"><i
										class="fa fa-google-plus"> </i> Sign up using Google </a>
								</p>
							</div>
							<div class="form-group">
								<p class="text-center">
									Don't have account? <a href="#" id="signup"
										onclick="register()">Sign up here</a>
								</p>
							</div>
							<div class="form-group">
								<p class="text-center">
									Don't have account? <a href="#" id="signup"
										onclick="findPw()">Forget Password?</a>
								</p>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>