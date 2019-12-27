<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.Member"%>
<%@include file="./../common/common.jsp" %>


<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script>

</script>
<style>

body {
background:#e0e0e0a1;
}

form {
	width: 50%;
    background: white;
	margin : auto;
	box-shadow: 1px 6px 5px #000;
	padding: 50px;
	
}

.err {
	color: red;
	font-size: 12px;
}

.container {
	text-align: center;
	padding-top: 60px;
}

.form-controll {
	width: 70%;
}


.btn btn-defualt {
	padding-top: 15px;
	/* background:#980000; */
	border:none;
}


a { 
	float: center;
}

i { 
	float: inherit;
	color: black;
}	

</style>
</head>

<body>

<%@include file="/WEB-INF/common/header.jsp"%>

<div class="container">
<h1>Seller InsertForm</h1>
<a href="listSel.ad"><i class="material-icons">keyboard_backspace</i></a>
<form:form id="insertForm" commandName="seller" action="insertSel.ad" method="post">

	<div class="form-group">	
	<label for="inputEmail" class="col-sm-2 control-label">Email</label>
	<input type="text" class="form-control" id="inputEmail" name="s_email" value="${seller.s_email }">
	<form:errors class="err" path="s_email"/>
	</div>


	<div class="form-group">
	<label for="inputPassword" class="col-sm-2 control-label">Password</label>
	<input type="password" class="form-control" id="inputPassword" name="s_password" value="${seller.s_password }">
	<form:errors class="err" path="s_password"/>
	</div>

	<div class="form-group">
	<label for="inputName" class="col-sm-2 control-label">Name</label>
	<input type="text" class="form-control" id="inputName" name="s_name" value="${seller.s_name }">
	<form:errors class="err" path="s_name"/>
	</div>	

	<div class="form-group">
	<label for="inputPhone" class="col-sm-2 control-label">PhoneNumber</label>
	<input type="text" class="form-control" id="inputPhone" name="s_phone" value="${seller.s_phone }">
	<form:errors class="err" path="s_phone"/>
	</div>	

	<div class="form-group">
	<label for="inputComnumber" class="col-sm-2 control-label">ComNumber</label>
	<input type="text" class="form-control" id="inputComnumber" name="s_comnumber" value="${seller.s_comnumber }">
	<form:errors class="err" path="s_comnumber"/>
	</div>

	<br>
	<br>
	<div class="form-group">
	<input class="btn btn-primary" type="submit" value="회원등록">
	<!-- <a href="#" onclick="javascript:submit()"><i class="material-icons">create</i></a> -->
	</div>
</form:form>
</div>
</body>
    
    
    
    
    
    