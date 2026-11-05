var inputPoint;
var myPoint = $(".myPoint").text();
var total;
var getPoint;
$(document).ready(function(){
	$(".userName1").blur(function(){
		var a = $(".userName1").val();
		var namePattern = /^[가-힣]{2,8}|[a-zA-Z]{2,20}\s[a-zA-Z]{2,20}$/;
		if (!namePattern.test(a)){
			alert("한/영 2~10자에 맞게 입력하세요");
			$(".userName1").val("");
			$(".userName1").focus();
			return;
		}
		else{
			return;
		}
	});
});
$(document).ready(function(){
	$("#buycancle").click(function(){
		$(".total").html($(".price_sale").text());
	});
});

$(document).ready(function(){
	$(".userEmail1").blur(function(){
		var a = $(".userEmail1").val();
		var emailPattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
		if (!emailPattern.test(a)){
			alert("올바른 이메일 주소를 입력해주세요");
			$(".userEmail1").val("");
			$(".userEmail1").focus();
			return;
		}
		else{
			return;
		}
	});
});
$(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
$(document).ready(function(){
	$(".inputPoint").change(function(){
		inputPoint = $(".inputPoint").val();
		getPoint = $(".getPoint").val();
		total = $(".total").val();
		if(inputPoint > parseInt(myPoint) || inputPoint < 0){
			g_alert("포인트를 확인해주세요.");
			$(".inputPoint").val("0");
			$(".getPoint").val("0");
			$(".buyMoney").val(total-getPoint);
			return;
		}else{
			$(".getPoint").val(inputPoint);
			getPoint = $(".getPoint").val();
			if(total == 0){
				$(".inputPoint").val(0);
				$(".getPoint").val(0);
				$(".buyMoney").val(0);
				return;
			}
			$(".myPoint").text(parseInt(myPoint)-inputPoint);
			$(".buyMoney").val(total-getPoint);
		}
	});
});


$(document).ready(function (){
	var a=0;
	$("#buycount1").change(function(){
		var count = $("#buycount1 option:selected").val();
		var sum = $(".price_sale").text();
		if($(".userName1").val()=="" || $(".userName1").val()==null || $(".userEmail1").val()=="" || $(".userEmail1").val()==null){
			g_alert("이름과 이메일주소를 모두 입력후 이용하세요");
			$('#buycount1').find('option:first').attr('selected', 'selected');  
			return;
		}else{
			inputPoint = $(".inputPoint").val();
			myPoint = $(".myPoint").text();
			getPoint = $(".getPoint").val();
			a = count * sum;
			$(".total").val(a);
			total = $(".total").val();
			$(".buyMoney").val(total-getPoint);
		}
	});
});
$(document).ready(function(){
	$(".buy").click(function(){
		var length = document.forms[0].length;
		for(var i=0; i <length; i++){
			if(document.forms[0][i].value == null || document.forms[0][i].value == ""){
				g_alert(document.forms[0][i].placeholder + "을/를 입력하세요.");
				document.forms[0][i].focus();
				return;
			}
		}
		if(document.forms[0][3].value == 0){
			g_alert("수량은 최소 1개 이상 선택하셔야합니다.");
			return;
		}
		var senderName = $(".senderName").text();
		var senderEmail = $(".senderEmail").val();
		var userName1 = $(".userName1").val();
		var userEmail1 = $(".userEmail1").val();
		var total = $(".total").val();
		var type = $(".type").val();
		var price_sale = $(".price_sale").text();
		var item_name = $(".item_name").text();
		var buycount1 = $("#buycount1").val();
		var getPoint = $(".getPoint").val();
		var buyMoney = $(".buyMoney").val();
		var store_id = $(".store_id").val();
		var myPoint = $(".myPoint").text();
		//document.insert.submit(); ajax 구현
		$.ajax({
			url:"buyMail.do",
			data:"type="+type+"&itemname="+item_name+"&store_id="+store_id+"&pricesale="+price_sale+"&senderName="+senderName+"&senderEmail="+senderEmail+"&userName1="+userName1+"&userEmail1="+userEmail1+"&buycount1="+buycount1+"&getPoint="+getPoint+"&myPoint="+myPoint+"&buyMoney="+buyMoney+"&total="+total,
			dataType:"json",
			type:"get",
			success:function(data){
				if(data.check==1){
					var url = "main.do";
					g_alert(data.msg);
					$(function() {
				    timer = setInterval(function () {
				    	$(location).attr('href',url);
				}, 3000);});
				}
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
});