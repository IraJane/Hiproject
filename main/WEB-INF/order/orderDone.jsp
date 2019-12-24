<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
body{
margin:0;
}
.done-wrapper{
    width: 60%;
    margin: 100px auto;
    border: 2px solid #7373ff;
    border-radius: 5px;
    text-align: center;
        height: 300px;
}
.done-box{
    background: #a4cdff;
    margin: 0;
    padding: 15px;
}

a {
	color: black;
	padding:10px;
	text-decoration:none;
    background: #0000b9;
    color: white;
    border-radius: 5px;
    font-size: 15px;
       margin: 0 10px;
}
a:hover, a:active {

	text-decoration:none;
	color:red;
}
a:link, a:visited {

	text-decoration:none;
}





</style>
<%@include file="/WEB-INF/common/header.jsp"%>
<div class="done-wrapper">

	
	<h1 class="done-box">결제 완료</h1>
	<p>저희 AAA를 이용해 주셔서 감사합니다.</p>
	<p>예약 내역은 예약현황을 이용해주세요</p>
	<p>어쩌구 저쩌구</p>

	<div style="margin: 60px;">
		<a href="main.jsp">메인으로</a>
		<a href="main.jsp">예약 현황</a>
		
		
	</div>


</div>

<%@include file="/WEB-INF/common/footer.jsp"%>