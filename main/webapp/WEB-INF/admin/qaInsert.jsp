<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.Member"%>
<%@include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>

<title>도움이 필요하세요?</title>

<style>
body {
	background-color: rgba(255, 255, 255, .99);
}
label {
	color: gray;
}
.loginlink {
	text-decoration: underline;
	font-weight: bold;
}
.container {
	width: 90%;
}
h1 {
	text-align: center;
	margin-bottom: 200px;
}
h4 {
	text-align: center;
	margin: 20px;
}
span {
	float: right;
	display: block;
	text-align: right;
}
#faq>dt {
	border-bottom: 1px solid #CCC;
}
#faq>dd {
	display: none;
	padding: 10px;
}
form {
	width: 100%;
	margin: 0 auto;
}
.err {
	float: left;
	color: red;
}
<!--
-->
img {
	display: block;
	width: 32px;
	height: 32px;
	border: 0
}
ul {
	list-style: none;
	border: 1px solid #CCC;
	border-radius: 2px;
	margin: 0;
	margin-bottom: 20px;
	padding: 0;
	heigth: 150px;
}
li {
	list-style: none;
	border: 1px solid #CCC;
	border-radius: 3px;
	float: left;
	width: 33.333333%;
	font-size: 20px;
	color: #CCC;
	text-align: center;
}
hr {
	float: clear;
}
</style>

<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<script src="<c:url value="/js/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="/js/bootstrap.min.js" />"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>


<script type="text/javascript">
	
	$(function() {
		$("#faq > dt").click(showHide);
	});
	function showHide(e) {
		var $sbj = $(e.currentTarget);
		$sbj.prevAll("dd:visible").slideUp("fast", bulletChange);
		$sbj.next().nextAll("dd:visible").slideUp("fast", bulletChange);
		//이미닫은게 반응하면 안되서 한번 건너 뛰기 위해 .next를 한번 씀
		$sbj.next().slideToggle("fast", bulletChange);
		function bulletChange() {
			var $sbjBullet = $(this).prev().find('span');
			//하나 하나 찾아가야 문자가 열고닫을때 바뀐다
			var curDisplay = $(this).css("display");
			// 여기서의this는 dd이다 
			if (curDisplay == "none") {
				$sbjBullet.text("▼");
			} else {
				$sbjBullet.text("▲");
			}
		}
	}
	
	function fnChkByte(obj, maxByte) {
		var str = obj.value;
		var str_len = str.length;
		var rbyte = 0;
		var rlen = 0;
		var one_char = "";
		var str2 = "";
		for (var i = 0; i < str_len; i++) {
			one_char = str.charAt(i);
			if (escape(one_char).length > 4) {
				rbyte += 2; //한글2Byte
			} else {
				rbyte++; //영문 등 나머지 1Byte
			}
			if (rbyte <= maxByte) {
				rlen = i + 1; //return할 문자열 갯수
			}
		}
		if (rbyte > maxByte) {
			// alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
			alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
			str2 = str.substr(0, rlen); //문자열 자르기
			obj.value = str2;
			fnChkByte(obj, maxByte);
		} else {
			document.getElementById('byteInfo').innerText = rbyte;
		}
	}
	
	function login(){
		var popupX = (window.screen.width/2)-(500/2);
		var popupY = (window.screen.height/2)-(500/2);
		window.open('login.mem', '_blank', 'height=500, width=500, toolbar=no, menubar=no left='+popupX+', top='+popupY,'true');
		return false;
	}
	
</script>
</head>
<body>

	<%@include file="/WEB-INF/common/header.jsp"%>
	<% 
		if (session.getAttribute("loginfo") != null) {
			Member loginfo = (Member) session.getAttribute("loginfo");
			int m_num = loginfo.getM_num();
			pageContext.setAttribute("m_num", m_num);
		}
	%> 

	<div class="container">
		<div class="row">
			<div class="col">
				<h1>도움이 필요하세요?</h1>
				<hr>
				<!-- <div class="top-menu"> 		
					<ul class="tab"> 
						<li class="item"><a href="#" class="item-a active">예약관리</a></li>
 						<li class="item"><a href="#" class="item-a active">결제</a></li>
						<li class="item"><a href="#" class="item-a active">기타</a></li> 		
					</ul>
				</div> -->
			</div>
		</div>
		<div class="row">
			<div class="col">
				<dl id="faq">
					<dt>
						<h4>
							내가 한 예약관리는 어떻게 하나요?<span>▼</span>
						</h4>
					</dt>
					<dd>예약관리는 로그인하신 후 내정보보기-[예약확인]에서 가능합니다.</dd>
					<dt>
						<h4>
							숙소에 주차 시설이 있는지 알 수 있나요? 더 자세한 조건으로 검색하고 싶어요.<span>▼</span>
						</h4>
					</dt>
					<dd>‘필터’기능을 이용하면 해당 부대시설을 보유한 숙소를 조회하실 수 있습니다. 추가적으로 주차가능,
						조식포함, 반려동물, 와이파이, 취사가능 의 조건도 선택 가능하며, 지역별, 가격순, 만족도 순의 순서로 정렬과
						투숙인원 기준의 조건 기능도 선택하여 검색하실 수 있습니다.</dd>
					<dt>
						<h4>
							사용가능한 결제 수단에는 무엇이 있나요? <span>▼</span>
						</h4>
					</dt>
					<dd>숙소 예약에 가장 많이 사용되는 결제 방법은 신용카드이며, 이는 대부분 예약 확정용으로 사용됩니다.
						예약한 숙소에서 사용 가능한 결제 수단은 숙소로 직접 전화하여 확인하실 수 있습니다.</dd>
					<dt>
						<h4>
							회원 탈퇴는 어떻게 하나요?<span>▼</span>
						</h4>
					</dt>
					<dd>로그인 후 [내정보수정]에서 가능합니다. 탈퇴 요청 시 즉시 처리가 완료되며 예약내역 등 기타 혜택은
						모두 소멸되어 동일한 계정으로 재가입 하더라도 복구 되지 않습니다.</dd>
					<dt></dt>
				</dl>
			</div>
		</div>

		<c:if test="${empty loginfo}">
			<div class="row">
				<div class="col">
					<h4>원하는 답을 못 찾으셨나요? ;(</h4>
					<h4>개인별 맞춤 서비스를 받으시려면 <a class="loginlink" onclick="login()" href="#">로그인</a>을
						해주세요.
					</h4>
				</div>
			</div>
		</c:if>
		<c:if test="${!empty loginfo}">
			<div class="row">
				<div class="col">
					<h4>원하는 답을 못 찾으셨나요? ;(</h4>
					<h4>1:1문의를 보내주세요.</h4>
					<h4>빠른 시일 내 계정에 연동된 이메일로 답변해드리겠습니다.</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form">


						<form:form commandName="qa" method="POST" action="insertQa.ad">

							<label for="m_email">이메일</label>
							<input class="form-control" id="m_email" type="text"
								placeholder="${sessionScope.loginfo.m_email}" readonly>
							<input type="hidden" name="m_num" value="${m_num}" />
							<br>

							<label for="q_title">문의 분류</label>
							<br>
							<select class="form-control" id="q_title" name="q_title">
								<option value="">선택하세요</option>
								<option value="예약">예약/숙박관련 문의</option>
								<option value="결제">결제관련 문의</option>
								<option value="기타">기타 문의</option>
							</select>
							<form:errors class="err" path="q_title" />
							<br>

							<label for="q_comment">문의 내용</label>
							<textarea class="form-control"
								placeholder="상세하게 적어주실수록 좋습니다! (최대 2000Byte)" id="q_comment"
								name="q_comment" style="margin: 0px 0px 0px 0px; height: 100px"
								onKeyUp="javascript:fnChkByte(this,'2000')">${qa.q_comment}</textarea>
							<p><span>/2000Byte</span><span id="byteInfo">0</span></p>
							<form:errors class="err" path="q_comment" />
							<br>
							<br>
							<button type="submit" class="btn btn-primary btn-block">보내기</button>
						</form:form>
					</div>
				</div>
				<div class="col-md-6">
					<p style="margin-top: 10px">개인 정보를 포함한 QA문의에 제출하신 모든 정보의 일부는
						제출된 피드백 내용과 관련 있는 여행 업체에 공유될 수 있는 점 미리 알려드립니다.</p>
					<a href="main.jsp">메인으로 돌아가기</a>
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>