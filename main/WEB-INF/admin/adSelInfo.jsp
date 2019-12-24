<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
function change(){
	location.href="<%=request.getContextPath() %>/selMain.sel";
	
}
</script>

<style>
body {
background:#e0e0e0a1;
}
td {
    padding: 10px;
}
form {
    width: 50%;
    margin: auto;
}
.error {
    font-size: 12px;
    color: #ff2121;
    float: right;
}
.container {
width: 50%;
height: 700px;
	padding-top: 60px;
    background: white;
    margin: 40px auto;
    box-shadow: 0px 1px 6px 2px #c3c3c3;
}
.col-md-8 {
    margin: 10px 5px;
}
.btn-primary{
	background:#980000;
	border:none;
}
</style>



<div class="container">
<div class="btn btn-default" onclick="history.go(-1); return fasle;">뒤로가기</div>
<form:form commandName="sel" action="updateSel.ad" method="post">
<input type="hidden" name="s_num" value="${seller.s_num }">
<input type="hidden" name="s_email" value="${seller.s_email }">
	<div class="form-horizontal">
		<div>
			<p class="form-group">아이디</p>
			<p>${seller.s_email }</p>

		</div>
		<div>
			<p>현재 비밀번호</p>
			<p><input class="form-control" type="text" name="s_password" value="${seller.s_password }" readonly><form:errors class="error" path="s_password"/></p>

		</div>
		<div>
			<p>비밀번호 변경</p>
			<p ><input class="form-control" type="text"  value=${seller.s_password }></p>

		</div>
		<div>
			<p>비밀번호 확인</p>
			<p><input class="form-control" type="text"  value=""></p>
			<p><span class="message"></span></p>
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






	</div>
<div class="col-md-8">
	<input class="btn btn-primary"  type="submit" value="수정하기">
	<a class="btn btn-default" href="<%=request.getContextPath() %>/deleteSel.ad?s_num=${seller.s_num }">탈퇴하기</a>
</div>
</form:form>
</div>