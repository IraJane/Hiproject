<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<script type="text/javascript">
function login() {
	var popupX = (window.screen.width/2)-(500/2);
	var popupY = (window.screen.height/2)-(500/2);
	
	window.open(	
			'login.mem','_blank','height=500, width=500, toolbar=no, menubar=no, location=no, scrollbars=no, status=no, resizable=no, fullscreen=no, channelmode=yes, left='+ popupX +', top='+ popupY
			); return false
}
function logout() {
	location.href="logout.mem";
	alert("로그아웃 되었습니다");
}
</script>
<style>

.header {
	font-size: 50px;
	
}
.mainLogo{
    background: url(resources/img/logo4.png) no-repeat center top;
    background-size: contain;
    width: 10%;
    height: 75%;
}


.hmain-menu {
    /* border: 1px solid #000f79db; */
    width: 100%;
    height: 50px;
    background: #000f79db;
	
}

.hmain-menu .ha {
text-decoration: none;
color:white;
	
}
.hmain-menu .ha:link,.ha:visited {
	color:white;
	text-decoration: none;
}
.hmain-menu .ha:hover,.ha:active {
	color:red;
	text-decoration: none;
}

.hmainright{
	float:right;
	margin:10px;
	border: 2px solid white;
    border-radius: 10px;
    font-size: 12px;
    padding: 2px;
	
}
.hmain{
	margin: 6px;
	float: left;
	
}


.hmain-login {
	margin:10px;
	float:right;

}




.drop {
	position: relative;
	display: inline-block;
	float: right;
    margin: 10px;
}
.drop-atag {
	    color: white;
    width: 100%;
    padding: 12px;
    font-size: 19px;
    color:white;
}
.drop-content {
	display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 190px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    text-align: center;
    margin: 13px 0 0 0;
}
.drop-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  font-size:13px;
  text-align:center;
  

}
.hmain-infotag{
	    margin: auto;
    width: 100%;
    color: #464646;
    
}

.drop-content a:hover {background-color: #f1f1f1}
.drop:hover .drop-content {
  display: block;
}
.drop:hover .drop span {
  background-color: #3e8e41;
}



</style>




<header class="hmain-menu">
		<a href="main.jsp" class="hmain ha mainLogo"></a> 
		<c:if test="${sessionScope.loginfo == null }">
			<a class="hmain-login ha" href="register.mem" >회원가입</a>
			<a href="#" onclick="login()" class="hmain-login ha">로그인</a>
		</c:if>
		<c:if test="${sessionScope.loginfo != null }">
			<a href="#" onclick="logout()" class="hmain-login ha" >로그아웃</a>
			<span></span>
			<div class="drop">
				<a style="color:white;" class="drop-atag">${sessionScope.loginfo.m_name }님 반갑습니다</a>
				<div class="drop-content">
					<a class="hmain-login ha hmain-infotag" href="info.mem" style="color: #464646;">내 정보</a> 
					<a class="hmain-login ha hmain-infotag" href="memberReservationForm.der" style="color: #464646;">내 예약</a>
				</div>
			</div>
			
		
		</c:if>
	
		<a class="hmainright ha" href="selMain.sel" target="_blank">판매자</a>
		<a class="hmainright ha" href="insertQa.ad">고객센터</a>
	
</header>