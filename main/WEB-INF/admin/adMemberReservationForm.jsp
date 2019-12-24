<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/common.jsp"%>
    
<head>
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
</style>

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<script>
</script>
</head>
<body>

<%@include file="/WEB-INF/common/header.jsp"%>

<div class="total-container">
<h2 class="bigtitle">예약 조회</h2>
<a href="listMem.ad">돌아가기</a>
<hr>

	

	<c:set var="ho" value="${totalOrder.list[0].hotel }" />  
	<c:set var="ro" value="${totalOrder.list[1].room }" />  
	<c:set var="od" value="${totalOrder.list[2].odetail }" />  
	

	

<c:forEach  items="${mainOrderd }" var="mo">
<c:set var="loop_flag" value="false"/>

 <table class="table-wrapper">
	<tr>
		<td>
			<c:if test="${mo.o_checker == 0}"><span class="waitcheckin">예약확정</span></c:if>
			<c:if test="${mo.o_checker == 1}"><span class="donecheckin">숙박완료</span></c:if>

		
		</td>
	</tr>


<c:forEach begin="0" end="${od.size()-1 }" var="i">
<c:if test="${mo.o_num == od[i].o_num }">
<c:forEach begin="0" end="${ro.size()-1 }" var="j">
<c:if test="${ro[j].r_num==od[i].r_num }">
<c:forEach begin="0" end="${ho.size()-1 }" var="k">
<c:if test="${not loop_flag }">
<c:if test="${ho[k].h_num==ro[j].h_num }">
<%-- <c:if test="${mo.o_num == od[i].o_num }">
<c:if test="${od[i].r_num == ro[j].r_num }"> --%>

<%-- ${od[i].r_num }
<c:if test="${ro[j].h_num == ho[k].h_num }"> --%>

	<tr>
		<td>
			<span class="hoteltype">${ho[k].h_type }</span><h4><a class="totitle" href="hotelDetail.ho?h_num=${ho[k].h_num }">${ho[k].h_name }</a></h4>
		
		</td>
	</tr>
	
	<tr>
		<td>
			예약 일자 : ${mo.o_checkin } ~ ${mo.o_checkout  }
		
		</td>
	</tr>
<c:set var="loop_flag" value="true"/>
</c:if>
</c:if>
</c:forEach>
	<tr>
		<td>
			<div>
				예약한 방 : ${ro[j].r_type }&nbsp;&nbsp;&nbsp; ${od[i].o_count } 개
				<c:if test="${mo.o_checker ==0 }">
				<a href="deleteOrder.ad?mo=${mo.o_num }&od=${od[i].r_num}&m_num=${m_num}">취소</a>
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
		<td>
			
 			<form action="deleteOrder.ad" method="post">
			<input type="hidden" name="mo" value="${mo.o_num }">
			<input type="hidden" name="m_num" value=${m_num }>
			<button class="button" type="submit" >결제취소</button>
			</form>

		</td>
	</tr>
</table>  
<hr>
</c:forEach>


</div>
</body>