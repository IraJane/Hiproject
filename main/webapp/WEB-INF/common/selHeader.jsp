<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<script>
function change(){
	location.href="<%=request.getContextPath() %>/selMain.sel";
	
}

</script>
<style>

.mainbtn {
	font-size: 30px;
    color: white;
}
.hmain-menu {
	border: 1px solid #000f79db;
	width: 100%;
	height: 50px;
	background: #000f79db;
	
}

.ha {
text-decoration: none;
color:white;
display:inline-block;
float: right;
    margin: 15px;

}
.ha:link, .ha:visited {
	color:white;
	text-decoration: none;
}
.ha:hover, .ha:active {
	color:red;
	text-decoration: none;
}

.hfloatRigth {
	float:right;
	color:white;
}








</style>

<header class="hmain-menu">
	<a onclick="change()" class="mainbtn">main</a>
<%
	if (session.getAttribute("selloginfo") == null) {
%>
	<a class="ha" href="selSignup.sel">회원가입</a>
	<a class="ha" href="selLogin.sel">로그인</a>

<%
	} else {
%>

	<a class="hfloatRigth ha">반갑습니다</a>
	
	<a class="ha" href="logout.sel">로그아웃</a> <a class="ha" href="selInfo.sel">내정보 보기</a> 
	<a class="ha" href="hotelInsert.ho">내숙소 등록하기</a> <a class="ha" href="hotelNow.der">내숙소 예약현황</a>
		
		
		
		
		
		
		
	

<%
	}
%>

</header>