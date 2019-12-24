<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
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

<!-- <script type="text/javascript">
	function findPw() {
		var a = document.getElementById("email");
		
		$.ajax({
			cache : false,
			url : "findPw.mem",
			type : "POST",
			data : a,
			dataType : text,
			success : function(data) {
				alert("임시 비밀번호 발송 완료");
				location.href="main.jsp";
			},
			error : function(data) {
				alert("등록된 이메일이 아닙니다");
				location.href="main.jsp";
			}
		});
	}
</script> -->



<!--   <h4>임시 비밀번호 발급</h4>
    <form action="mailSending.mem" method="post">
      <div>
        <input type="text" name="m_email" size="120"
        style="width: 100%" placeholder="이메일을 입력하세요"
        class="form-control">
      </div>
      
      <div align="center">
        <input type="submit" value="메일 보내기" class="btn btn-warning">
      </div>
    </form> -->
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-5 mx-auto">
				<div id="first">
					<div class="myform form ">
						<div class="logo mb-3">
							<div class="col-md-12 text-center">
								<h1>임시 비밀번호 발급</h1>
							</div>
						</div>
						<form:form name="findPw" id="findPwForm" action="findPw.mem" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="m_email" class="form-control" id="email"
									aria-describedby="emailHelp" placeholder="Enter email">
							</div>
							<div class="col-md-12 text-center ">
								<button type="submit" id="btnLogin" 
									class=" btn btn-block mybtn btn-primary tx-tfm">임시 비밀번호 발급</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>