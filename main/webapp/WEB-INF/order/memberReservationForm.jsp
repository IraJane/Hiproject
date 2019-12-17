<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/common/common.jsp"%>
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
<%@include file="/WEB-INF/common/header.jsp"%>
<div class="total-container">
<h2 class="bigtitle">예약 조회</h2>
<hr>

	

	<c:set var="ho" value="${totalOrder.list[0].hotel }" />  
	<c:set var="ro" value="${totalOrder.list[1].room }" />  
	<c:set var="od" value="${totalOrder.list[2].odetail }" />  
	

	

<c:forEach  items="${totalOrder }" var="total">
<c:forEach  items="${mainOrderd }" var="mo">
<c:forEach begin="0" end="${od.size()-1 }" var="i">
<c:forEach begin="0" end="${ho.size()-1 }" var="k">
<c:forEach begin="0" end="${ro.size()-1 }" var="j">
<%-- <c:if test="${mo.o_num == od[i].o_num }">
<c:if test="${od[i].r_num == ro[j].r_num }"> --%>

<%-- ${od[i].r_num }
<c:if test="${ro[j].h_num == ho[k].h_num }"> --%>

<c:if test="${mo.o_num == od[i].o_num && od[i].r_num == ro[j].r_num && ro[j].h_num == ho[k].h_num }">
	
 <table class="table-wrapper">
	<tr>
		<td>
			<c:if test="${mo.o_checker == 0}"><span class="waitcheckin">예약확정</span></c:if>
			<c:if test="${mo.o_checker == 1}"><span class="donecheckin">숙박완료</span></c:if>

		
		</td>
	</tr>
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
	<tr>
		<td>
			예약한 방 종류 : ${ro[j].r_type }&nbsp;&nbsp;&nbsp; ${od[i].o_count   } 개
		
		</td>
	</tr>
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
			<button class="button" type="button">결제취소</button>
		
		</td>
	</tr>
</table>  
</c:if>

</c:forEach>
</c:forEach>
</c:forEach>
</c:forEach>
</c:forEach>





</div>