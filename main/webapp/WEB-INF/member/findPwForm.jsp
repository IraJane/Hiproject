<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

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
.btn-primary {
	background-color: #0000ac;
}
</style>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-5 mx-auto">
				<div>
					<div class="myform form">
						<div class="logo mb-3">
							<div class="col-md-12 text-center">
								<h1>Find Password</h1>
							</div>
						</div>
						<form id="findPwForm" commandname="member" name="findPwForm">
						
							<div class="form-group">
								<label for="exampleInputEmail1">Email</label> <input
									type="text" name="m_email" class="form-control"
									id="m_email">
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number</label> <input
									type="text" name="m_phone" class="form-control"
									id="m_phone">
							</div>
							
							<div class="col-md-12 text-center mb-3">
								<button type="button" id="btnSubmit" onclick="findPw()"
									class=" btn btn-block mybtn btn-primary tx-tfm">비밀번호 찾기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>