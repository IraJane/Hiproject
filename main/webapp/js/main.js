$(function(){
	$(".h_name").hide();
	$(".h_nation").hide();
	$(".h_postcode").hide();
	$(".h_phone").hide();       
	$(".h_language").hide();
	$(".type").hide();
    $("#form-total").steps({
        headerTag: "h2",
        bodyTag: "section",
        transitionEffect: "fade",
        enableAllSteps: true,
        stepsOrientation: "vertical",
        autoFocus: true,
        transitionEffectSpeed: 500,
        titleTemplate : '<div class="title">#title#</div>',  
        labels: {
            previous : 'Back Step',
            next : '<i class="zmdi zmdi-arrow-right"></i>',
            finish : '<i class="zmdi zmdi-check"></i>',
            current : ''
        },
    })

});
function submitHotel(){
	var type_str='<span class="type" style="margin-left:5px"><small style="color:#DB0000">객실유형은 필수입니다.</small></span>';
	var price_str='<span class="type" style="margin-left:5px"><small style="color:#DB0000">객실가격은 필수입니다.</small></span>';
	var price_str_number='<span class="type" style="margin-left:5px"><small style="color:#DB0000">숫자만 입력해주세요.</small></span>';
	var roomNum_str='<span class="type" style="margin-left:5px"><small style="color:#DB0000">전체객실수는 필수입니다.</small></span>';
	var roomNum_str_number='<span class="type" style="margin-left:5px"><small style="color:#DB0000">숫자만 입력해주세요.</small></span>';
	var str='<span class="type" style="margin-left:5px"><small style="color:#DB0000">필수항목</small></span>';
	var str_number='<span class="type" style="margin-left:5px"><small style="color:#DB0000">숫자만가능</small></span>';
	var a=false;
	var b=false;
	var c=false;
	var d=false;
	var e=false;
	var f=false;
	
	
		$("input[name=type]").each(function(idx){
			var type=$(this).val();
			if(type=="" || type==null){
				a=false;
				$(this).parent().next().html(type_str);
				$(this).keyup(function(){
					$(this).parent().next().children().remove();
				});
			}else{
				a=true;
			}
			
		});
		$("input[name=price]").each(function(idx){
			var price=$(this).val();
			if(price=="" || price==null){
				b=false;
				$(this).parent().next().html(price_str);
				$(this).keyup(function(){   
					$(this).parent().next().children().remove();
				});
			}
			else if(isNaN(price)==true){
				b=false;
				$(this).parent().next().html(price_str_number);
				$(this).keyup(function(){
					$(this).parent().next().children().remove();
				});
			}else{
				b=true;
			}
			
		});
		$("input[name=person").each(function(idx){
			var person=$(this).val();
			if(person=="" || person==null){
				c=false
				$(this).parent().next().html(str);
				$(this).keyup(function(){   
					$(this).parent().next().children().remove();
				});
			}
			else if(isNaN(person)==true){
				c=false
				$(this).parent().next().html(str_number);
				$(this).keyup(function(){
					$(this).parent().next().children().remove();
				});
			}else{
				c=true;
			}
			
		})
		$("input[name=stock").each(function(idx){
			var stock=$(this).val();
			if(stock=="" || stock==null){
				d=false;
				$(this).parent().next().html(str);
				$(this).keyup(function(){   
					$(this).parent().next().children().remove();
				});
			}
			else if(isNaN(stock)==true){
				d=false;
				$(this).parent().next().html(str_number);
				$(this).keyup(function(){
					$(this).parent().next().children().remove();
				});
			}else{
				d=true;
			}
			
		})
		$("input[name=breakfast").each(function(idx){
			var breakfast=$(this).val();
			if(breakfast=="" || breakfast==null){
				e=false;
				$(this).parent().next().html(str);
				$(this).keyup(function(){   
					$(this).parent().next().children().remove();
				});
			}else{
				e=true;
			}
			
		});
		
		
		var h_room_num=$("input[name=h_room_num").val();
		if(h_room_num=="" || h_room_num==null){
			f=false;
			$("input[name=h_room_num").parent().next().html(roomNum_str);
			$("input[name=h_room_num").keyup(function(){   
				$("input[name=h_room_num").parent().next().children().remove();
			});
		}
		else if(isNaN(h_room_num)==true){
			f=false;
			$("input[name=h_room_num").parent().next().html(roomNum_str_number);
			$("input[name=h_room_num").keyup(function(){
				$("input[name=h_room_num").parent().next().children().remove();
			});
		}else{
			f=true;
		}
		  
		
		if(a==true && b==true && c==true && d==true && e==true && f==true){
			
			$("#hotelInsertForm").submit();
		}
		
	
		
	
};   
  
