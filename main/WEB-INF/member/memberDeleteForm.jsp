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

<script type="text/javascript">
function deleteMem() {
	if(confirm("탈퇴하시겠습니까?")) {
	var formData = $("#deleteForm").serialize();
	
	$.ajax({
		cache : false,
		url : "deleteConfirm.mem",
		type : "POST",
		data : formData,
		dataType : 'text',
		success : function(data) {
			 if(data == "1") { 
			alert("회원 탈퇴 완료");
			opener.parent.location="main.jsp";
			window.close();
			 } else {
				alert("비밀번호가 틀립니다");
			} 
		},
		error : function(data) {
			
			alert("탈퇴 실패");
		}
		});
	}
}
</script>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-5 mx-auto">
				<div>
					<div class="myform form">
						<div class="logo mb-3">
							<div class="col-md-12 text-center">
								<h1>Secession</h1>
							</div>
						</div>
						<form id="deleteForm" commandname="member" name="deleteForm">
						<input type="hidden" name="m_email" value="${member.m_email }">
							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> <input
									type="password" name="m_password" class="form-control"
									id="m_password">
							</div>
							<div class="col-md-12 text-center mb-3">
								<button type="button" id="btnSubmit" onclick="deleteMem()"
									class=" btn btn-block mybtn btn-primary tx-tfm">탈퇴</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>