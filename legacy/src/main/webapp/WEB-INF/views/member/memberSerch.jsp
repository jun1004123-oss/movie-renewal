<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head> 
<script>
$(document).ready(function(){ 
    $('#idSearch').click(function(){
        var state = $('.id').css('display');
        if(state == 'none'){
            $('.id').show();
            $('#idName').focus();
        }else{ 
            $('.id').hide();     
        }
    });
    $('.close').click(function(){
    	$('.id').hide();
    });
});
$(document).ready(function(){ 
    $('#pwSearch').click(function(){
        var state = $('.pw').css('display');
        if(state == 'none'){
            $('.pw').show();
            $('#pwName').focus();
        }else{ 
            $('.pw').hide();     
        }
    });
    $('.close').click(function(){
    	$('.pw').hide();
    });
});
$(document).ready(function(){
	$("#idSerchBtn").click(function() {
		if ($("#idName").val() == "") {
			g_alert("이름을 입력해주세요.");
			return;
		} else if($("#idEmail").val() == "") {
			g_alert("이메일 주소를 입력해주세요.");
			return;
		} else{
		$.ajax({
			url: "memberidSerch.do",
			data: "searchName=" + $("#idName").val() + "&searchEmail=" + $("#idEmail").val(),
			dataType: "json",
			type: "GET",
			success: function(data) {
				if(data.check==1){
					g_alert("잃어버리신 아이디입니다. <br>"+data.id);
				}else{
					$("#idName").val("");
					$("#idEmail").val("");
					g_alert("이름과 이메일을 확인해 주세요.");
					$("#idName").focus();
				}
			},
			error: function(data) {
				alert("error = " + data);
			}
		}); }
	});
	});
	
$(document).ready(function(){
	$("#pwSerchbtn").click(function() {
		if ($("#pwId").val() == "") {
			g_alert("아이디를 입력해주세요.");
			return;
		}
		else if ($("#pwName").val() == "") {
			g_alert("이름을 입력해주세요.");
			return;
		} else if($("#pwEmail").val() == "") {
			g_alert("이메일 주소를 입력해주세요.");
			return;
		} else{
		$.ajax({
			url: "memberpwSerch.do", //메일컨트롤러	
			data: "searchId=" + $("#pwId").val() +"&searchName=" + $("#pwName").val() + "&searchEmail=" + $("#pwEmail").val(),
			dataType: "json",
			type: "GET",
			success: function(data) {
				if(data.check==0){
					g_alert("아이디를 확인해주세요.");
					$("#pwId").val("");
					$("#pwId").focus();
				}else if(data.check==1){
					g_alert("이름을 확인해주세요.");
					$("#pwName").val("");
					$("#pwName").focus();
				}else if(data.check==2){
					g_alert("이메일을 확인해주세요.");
					$("#pwEmail").val("");
					$("#pwEmail").focus();
				}else if(data.check==3){
					g_alert(data.ok);
				}
			},
			error: function(data) {
				alert("error = " + data);
			}
		}); }
	});
	});
</script>
</head>

<ul class="nav">
	<li><button id="idSearch">아이디 찾기</button></li>
		<div class="id" style="display: none;">
			<button type="button" class="close">&times;</button>
			<input type="text" id="idName" placeholder="이름"> <br>
			<input type="text" id="idEmail" placeholder="이메일 주소"> <br>
			<input type="button" id="idSerchBtn" value="확인"> <br>
		</div>
	<li><button id="pwSearch">비밀번호 찾기</button></li>
		<div class="pw" style="display: none;">
			<button type="button" class="close">&times;</button>
			<input type="text" id="pwId" name="pwId" placeholder="아이디"> <br>
			<input type="text" id="pwName" name="pwName" placeholder="이름"> <br>
			<input type="text" id="pwEmail" name="pwEmail" placeholder="이메일 주소"> <br>
			<input type="button" id="pwSerchbtn" name="pwSerchbtn" value="확인"> <br>
		</div>
</ul>