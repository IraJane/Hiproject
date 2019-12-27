<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.Member"%>
<%@include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Main</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	
	function calopen(){
		window.open("https://calendar.google.com/calendar/r/eventedit", "일정 삽입하기", "width=800, heigth=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
	
	}
	
	/* 
	$(document).ready(function(){
		
		$('#home').click(function(){
			location.href="main.ad";
		});	
		
		
		$('#seller').click(function(){
			$.ajax({
				url : 'listSel.ad',
				type : 'GET',
				dataType : 'html',
				success : function(data){
					$('#ajaxdata').html(data);
				}
			});
			return false;		
		});	

		$('#member').click(function(){
			$.ajax({
				url : 'listMem.ad',
				type : 'GET',
				dataType : 'html',
				success : function(data){
					$('#ajaxdata').html(data);
				}
			}); 
			return false;		
		});	
		
		$('#qa').click(function(){
			$.ajax({
				url : 'listQa.ad',
				type : 'GET',
				dataType : 'html',
				success : function(data){
					$('#ajaxdata').html(data);
				}
			}); 
			return false;		
		});	
	}); 
	navbar ajax종료*/
</script>

<style>
/* body { padding-top: 70px; } */
.jumbotron {
	color: white;
	text-align: center;
	height: 300px;
	background: #000e98;
	background-size: cover;
}


iframe {
	border-width : 0px;
	width: 100%;
	height: 408px;
	margin : 5 auto;
}

.material-icons add {
	float: left	;
}

.bold {
	font-weight: bold;
}

.arrow_box {
	width: 100%;
	margin-top : 15px;
	margin: 0 auto;
	position: relative;
	background: #ffffff;
	border: 1px solid #000e98;
	border-radius: 15px;
	text-align: center;
	margin-top: 15px;
}

.arrow_box:after, .arrow_box:before {
	margin-top : 15px;
	bottom: 100%;
	left: 50%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

.arrow_box:after {
	margin-top : 15px;
	border-color: rgba(255, 255, 255, 0);
	border-bottom-color: #ffffff;
	border-width: 10px;	
	margin-left: -10px;
}
.arrow_box:before {
	margin-top : 15px;
	border-color: rgba(0, 14, 152, 0);
	border-bottom-color: #000e98;
	border-width: 10px;
	margin-left: -16px;
}

a:hover {
	text-decoration: none;
}

.thumbnail{ 
	margin: 10 auto;
}

.img-circle{
	float:inherit;
}

.btn btn-primary {
	text-align: right;
}

.main {
	padding-top: 25px;
}

p {
	margin: -5px;
}

</style>
</head>
<body>

	<%@include file="/WEB-INF/common/header.jsp"%>
	<!-- <div class="jumbotron" style="height: 300px; background: url(resources/img/11.jpg) no-repeat center top; background-size: cover;"> -->
	<div class="jumbotron">
		<div class="container">
			<h2>AAA Manager</h2>
			<hr style="color: white">
			<p>Manage accounts, hotels, reservations...</p>
			<p>ㅡ all in one place. It's free.</p>
			<!-- <p>
				<a class="btn btn-primary btn-lg" href="#" role="button">More About >> </a>
			</p> -->
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col">
				<ul class="nav nav-tabs nav-justified">
					<li role="presentation" class="active"><a href="main.ad" id="home">Home</a></li>
					<li role="presentation"><a href="listSel.ad" id="seller">Seller</a></li>
					<li role="presentation"><a href="listQa.ad" id="qa">Q & A</a></li>
					<li role="presentation"><a href="listMem.ad" id="member">Member</a></li>
					<li role="presentation"><a href="listReview.ad">Reviews</a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<a href="listQa.ad">
				<div class="arrow_box">
					<h5>
						<span class="bold">${newQ }개</span>의 새로운 질문들이 있습니다.
					</h5>
				</div>
				</a>
			</div>
		</div>


		
		<div class="main">
		<div class="row">
			<div class="col-md-3">
				<div class="thumbnail">
					<img id="img_form_1" class="img-circle" src="resources/img/octo.png" alt="...">
					<div class="caption">
						<h3>Manager A</h3>
						<h5>Energizer</h5>
						<hr>
						<ul>
						<li>QA dept.</li>
						<li>Email: admin@admin.com</li>
						</ul>
						<!-- <p>
							<a href="#" class="btn btn-primary" role="button">Button</a> 
							<a href="#" class="btn btn-default" role="button">Button</a>
						</p> -->
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="thumbnail">
					<img id="img_form_2" class="img-circle" src="resources/img/face.png" alt="...">
					<div class="caption">
						<h3>Robo</h3>
						<h5>...!@$!@#</h5>
						<hr>
						<ul>
						<li>Dev dept.</li>
						<li>Email: robo@aaa.com</li>
						</ul>
						<!-- <p>
							<a href="#" class="btn btn-primary" role="button">Button</a> 
							<a href="#" class="btn btn-default" role="button">Button</a>
						</p> -->
					</div>
				</div>
			</div>
			

			<div class="col-md-6">
				<a href="#" onclick="calopen()">
				<i class="material-icons add">add</i>캘린더에 일정 추가하기</a>
				<iframe
					src="https://calendar.google.com/calendar/embed?height=500&amp;wkst=1&amp;bgcolor=%23ffffff&amp;ctz=Asia%2FSeoul&amp;src=cnJud2xyQGdtYWlsLmNvbQ&amp;color=%2322AA99&amp;showTitle=0&amp;showTabs=1&amp;showCalendars=0&amp;showTz=0"
					frameborder="0" scrolling="no"></iframe>
			</div>

		</div>
	</div>
</div>





</body>
</html>