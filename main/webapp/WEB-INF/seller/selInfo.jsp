<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

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


</style>



<div class="container">
<a class="btn btn-default" href="<%=request.getContextPath() %>/selMain.sel">메인으로</a>
<form:form commandName="sel" action="selInfo.sel" method="post">
<input type="hidden" name="num" value="${seller.num }">
<input type="hidden" name="email" value="${seller.email }">
	<div class="form-horizontal">
		<div>
			<p class="form-group">아이디</p>
			<p>${seller.email }</p>

		</div>
		<div>
			<p>현재 비밀번호</p>
			<p><input class="form-control" type="password" name="password" value="${seller.password }" readonly><form:errors class="error" path="password"/></p>

		</div>
		<div>
			<p>비밀번호 변경</p>
			<p ><input class="form-control" type="password" name="password" value=""><form:errors class="error" path="password"/></p>

		</div>
		<div>
			<p>비밀번호 확인</p>
			<p><input class="form-control" type="password" name="password-check" value=""></p>
			<p><span class="message"></span></p>
		</div>
		<div>
			<p>이름</p>
			<p><input class="form-control" type="text" name="name" value="${seller.name }"><form:errors class="error" path="name"/>
			</p>

		</div>
		<div>
			<p>전화번호</p>
			<p><input class="form-control" type="text" name="phone" value="${seller.phone }"><form:errors class="error" path="phone"/></p>

		</div>
		<div>
			<p>사업자번호</p>
			<p><input class="form-control" type="text" name="comnumber" value="${seller.comnumber }"><form:errors class="error" path="comnumber"/></p>

		</div>






	</div>
<div class="col-md-8">
	<input class="btn btn-primary" type="submit" value="수정하기">
	<a class="btn btn-default" href="<%=request.getContextPath() %>/selDelete.sel?num=${seller.num }">탈퇴하기</a>
</div>
</form:form>
</div>



