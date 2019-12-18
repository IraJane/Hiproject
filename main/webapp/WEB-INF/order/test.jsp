<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">



	
	
	
	

var obj = {'o_num ':0, 'm_num ':0, 'o_orderdate': '2012/12/12','o_checkin ': '2012/12/12','o_checkout ': '2012/12/12','o_totalpeople ': '3','o_comment ': 'ddd','o_checker ': '1','o_engname ': 'd' };

var objList = [
	{'o_num ':0, 'm_num ':0, 'o_orderdate': '2012/12/12','o_checkin ': '2012/12/12','o_checkout ': '2012/12/12','o_totalpeople ': '3','o_comment ': 'ddd','o_checker ': '1','o_engname ': 'd' },
	{'o_num ':0, 'm_num ':0, 'o_orderdate': '2012/12/12','o_checkin ': '2012/12/12','o_checkout ': '2012/12/12','o_totalpeople ': '3','o_comment ': 'ddd','o_checker ': '1','o_engname ': 'd' }
				];


	
	

function call_ajax(){
	var xmlhttp = new XMLHttpRequest();

	 xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status == 200){
			alert(xmlhttp.responseText); 
			
			/* document.getElementById("qwer").innerHTML = xmlhttp.responseText;

			
			var contentlist = JSON.parse(xmlhttp.responseText);
			var table = document.createElement("table");
			
			for(content of contentlist){
				//alert(contentlist[i].name);
					var tr = document.createElement("tr");
					
					var td1 = document.createElement("td");
					td1.innerText = content.name;
					
					var td2 = document.createElement("td");
					td2.innerText = content.title;
					tr.appendChild(td1);
					tr.appendChild(td2);
					table.appendChild(tr);
				
			}
			
			document.getElementById("qwer").appendChild(table);  */
			
		}
		alert("not");
	};
	
	xmlhttp.open("get","./tester.der" , true);
	//get 방식일때는  ./board?id=s001&page=3 이렇게 
	xmlhttp.setRequestHeader("Content-type",
	"application/x-www-form-urlencoded");

	xmlhttp.send();
	//send할게 없으니 안에것 다 삭제 함 
	//xmlhttp.send("id=s001&page=3");		
	

}

	
	
	
	
	
	
	
	
	
	







</script>


<h3>test</h3>
<button onclick="call_ajax()">push</button>