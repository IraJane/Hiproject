<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/common/common.jsp"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">


<script type="text/javascript">
/* 	$(function() {
		$('#reviewComplete').hide();
	})
 */
 
 	var selectedIdx = -1;
 
	function pushLayer(target) {
		$('#myModal').show();
		
		selectedIdx = parseInt(target.getAttribute("idx"));
		var n=selectedIdx;
		/*  alert(n);  */
		
		var a = document.getElementsByClassName("o_num");
		var c = document.getElementsByClassName("h_num");
	
	
/* 		 alert(a[n].value);    */
		
		var b = parseInt(a[n].value);
		var d = parseInt(c[n].value);
		
		this.b = b;
		this.d = d;
		
		
	}
	
	
	
	/* $('.c_comment').keyup(function (e){
	    var content = $(this).val();
	    $('.counter').html("("+content.length()+" / 최대 100자)");    //글자수 실시간 카운팅
	    if (content.length > 100){
	        alert("최대 100자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 100));
	        $('.counter').html("(100 / 최대 100자)");
	    }
	 */
	
	
	function review() {
		var that = this;
		/* alert(that.b); */
		var star = document.getElementById("c_star");
		var comment = document.getElementById("c_comment");
		
		if(star.value < 0 || star.value > 5) {
			alert("평점은 0~5사이의 숫자로 입력해주세요")
			star.focus();
			return false;
		}
	
		if(comment.value.length > 100) {
			alert("후기는 100자 이하로 작성해주세요");
			comment.focus();
			return false;
		}
		
		
		
		
		$.ajax({
			cache : false,
			url : "review.mem",
			type : "POST",
			data : { "o_num" : that.b,
				"h_num" : that.d,
				"c_comment" : $("#c_comment").val(),
				"c_star" : $("#c_star").val()},
			success : function(data) {
				alert("후기 작성완료");
				$('#myModal').hide();
				location.reload();
/* 				
				$('#review').hide();
				$('#reviewComplete').show(); */
			},
			error : function(data) {
				alert("후기작성 오류");
			}
		});
	}
	//팝업 Close 기능
	function close_pop(flag) {
		$('#myModal').hide();
	};
	
</script>




<style>
body {
	margin:0;
	padding:0;
}

h4{
	display: inline-block;
    font-size: 30px;
    margin: 0 10px;
}
.total-container {
	width: 80%;
	margin: 10px auto;
}
.bigtitle {
	width: 100%;
	text-align:center;
}
.table-wrapper {
	border: 1px solid gray;
	border-radius:5px;
	width: 95%;
    margin: 10px auto;

}

.table-wrapper:hover{
	    background: #adc2ff40;
}
.hoteltype {
	    background: #bdbdbd;
    padding: 3px;
    font-size: 13px;
    border-radius: 5px;
}
.totitle{
text-decoration:none;
color: black;
}
.totitle:visited,.totitle:link {
	text-decoration:none;
}
.totitle:hover,.totitle:active {
	text-decoration:none;
	color:#ec6200;
}

.waitcheckin {
    background: #028602de;
    color: white;
    font-size: 17px;
    padding: 1px;
    border-radius: 5px;
}
.donecheckin{
	background: #929292f7;
    color: white;
    font-size: 17px;
    padding: 1px;
    border-radius: 5px;
}
.button{
	border: none;
    border-radius: 5px;
    float: right;
    background: #969696;
    color: white;
    padding: 3px;
}

/************** 후기 팝업 **************/
/* The Modal (background) */
.myModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(203, 220, 247, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.modal-content {
	background-color: rgb(203, 220, 247);
	margin: 15% auto; /* 15% from the top and centered */
	/* padding: 20px; */
	border: 1px solid #888;
	width: 40%; /* Could be more or less, depending on screen size */
}
.c_comment {
	width: 100%;
	height: 150px;
	border-radius: 10px;
	border: solid cornflowerblue;
	word-break:break-all;	
}
.c_star {
	width: 15%;
	border-radius: 5px;
	border: solid cornflowerblue;
}
.form-group-star {
	float: right;
	padding: 10px;
	text-align: right;
}
.form-group-comment {
	padding: 20px;
}
.submit-review1 {
	cursor: pointer;
	background-color: lightgreen;
	text-align: center;
	padding-bottom: 10px;
	padding-top: 10px;
	float:left;
	margin-left:20%;
}
.submit-review2 {
	cursor: pointer;
	background-color: palevioletred;
	text-align: center;
	padding-bottom: 10px;
	padding-top: 10px;
	float:right;
	margin-right: 20%;
}
.btn btn-block mybtn btn-primary tx-tfm {
	border-radius: .90rem;
	border: solid cornflowerblue;
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
}
.col-md-12 text-center {
	float: left;
}



</style>
<%@include file="/WEB-INF/common/header.jsp"%>
<div class="total-container">
<h2 class="bigtitle">예약 조회</h2>
<hr>

	

	<c:set var="ho" value="${totalOrder.list[0].hotel }" />  
	<c:set var="ro" value="${totalOrder.list[1].room }" />  
	<c:set var="od" value="${totalOrder.list[2].odetail }" />  
	

	

<c:forEach  items="${mainOrderd }" var="mo" varStatus="stt">
<c:set var="loop_flag" value="false" />


	
 <table class="table-wrapper">
	<tr>
		<td>
			<input type=hidden class="o_num" value="${mo.o_num }">
			<c:if test="${mo.o_checker == 0}"><span class="waitcheckin">예약확정</span></c:if>
			<c:if test="${mo.o_checker == 1}"><span class="donecheckin">숙박완료</span></c:if>

		
		</td>
	</tr>
<c:forEach begin="0" end="${od.size()-1 }" var="i">
<c:if test="${mo.o_num==od[i].o_num }">
<c:forEach begin="0" end="${ro.size()-1 }" var="j">
<c:if test="${ro[j].r_num==od[i].r_num }">
<c:forEach begin="0" end="${ho.size()-1 }" var="k">
<c:if test="${not loop_flag }">
<c:if test="${ho[k].h_num==ro[j].h_num}">
	<tr>
		<td>
			<span class="hoteltype">${ho[k].h_type }</span>
			<h4>
			<input type="hidden" name="h_num" class="h_num" id="h_num" value="${ho[k].h_num }"><a class="totitle" href="hotelDetail.ho?h_num=${ho[k].h_num }">${ho[k].h_name }</a></h4>
		
		</td>
	</tr>
	
	<tr>
		<td>
			예약 일자 : ${mo.o_checkin } ~ ${mo.o_checkout  }
		
		</td>
	</tr>
<c:set var="loop_flag" value="true" />
</c:if>
</c:if>
</c:forEach>
	<tr>
		<td>
			<div>
				예약한 방 : ${ro[j].r_type }&nbsp;&nbsp;&nbsp; ${od[i].o_count   } 개
				<c:if test="${mo.o_checker ==0 }">
				<a href="#?mo=${mo.o_num}&od=${ od[i].r_num}">취소</a>
				</c:if>
			</div>
		
		</td>
	</tr>
	
</c:if>
</c:forEach>
</c:if>
</c:forEach>
<tr>
		<td>
			영문 이름 : ${mo.o_engname } 
		
		</td>
	</tr>
	<tr>
		<td>
			요구 사항 : ${mo.o_comment } 
		
		</td>
	</tr>
	<tr>
		<td>
			결제일자 : ${mo.o_orderdate }
		
		</td>
	</tr>
	<tr>
				<td><c:if test="${mo.o_checker == 0}">
						<button class="button" type="button" id="cancel">결제취소</button>
					</c:if> <c:if test="${mo.o_checker == 1}">
						<c:if test="${mo.o_reviewchecker == 0 }">
							<button idx="${stt.index }" class="review" type="button"
								id="review" onclick="pushLayer(this)">후기쓰기</button>
						</c:if>
						<c:if test="${mo.o_reviewchecker == 1 }">
							<button class="reviewComplete" type="button" id="reviewComplete">후기
								작성 완료</button>
						</c:if>
					</c:if></td>
			</tr>
</table>  


</c:forEach>

<div id="myModal" class="myModal">
			<div class="modal-content">
				<div class="col-md-12 text-center">
					<h2 style="text-align:center;">방문 후기</h2>
				</div> 
				<!-- <button type="button" class="btn btn-outline-dark" onclick="close_pop()">X</button> -->
				<form name="reviewForm" id="reviewForm" class="reviewForm">
					<div class="form-group-star">
						<label for="c_star">평점</label> <input type="text" name="c_star"
							class="c_star" id="c_star"> / 5
					</div>
					<div class="form-group-comment">
						<label for="c_comment">후기</label> <!-- <input type="text"
							name="c_comment" id="c_comment" class="c_comment" > -->
							
						<textarea rows="40" cols="10" name="c_comment" id="c_comment" class="c_comment" wrap="hard"
						placeholder="여러분의 솔직한 후기를 환영합니다"></textarea>  
					</div>
					<!-- <div class="submit-review">
						<button class="review-btn" type="button" id="reviewbtn"
							onclick="review()">작성하기</button>
					</div> -->
					<div class="submit-review1" onClick="review()">
						<span class="review_bt" style="font-size: 13pt;"> &nbsp;&nbsp;작성하기&nbsp;&nbsp; </span>
					</div>
					
					<div class="submit-review2" onClick="close_pop()">
						<span class="pop_bt" style="font-size: 13pt;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;닫기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
					</div>
				</form>
			</div>  
		</div>






</div>