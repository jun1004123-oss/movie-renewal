
$(function(){
	$('#scroll').on('click', function(e){
		$('html, body').animate({
			scrollTop:0
		}, 800);
	});
});

$(document).ready(function(){
	$(window).scroll(scrollopacity);
});

function scrollopacity() { 
    for(var i=0; i<500; i+=20 ){
    	if($(window).scrollTop()>=i) {
    		$("#scroll").css("opacity", 0.002*i);}
    }
}

$(document).ready(function(){ 
    $('#loginbt').click(function(){
        var state = $('.login').css('display');
        if(state == 'none'){
            $('.login').show();
            $('#loginID').focus();
        }else{ 
            $('.login').hide();     
        }
    });
    $('.close').click(function(){
    	$('.login').hide();
    });
});


$(document).ready(function(){ 
	$('#memberbt').click(function(){
		var state = $('.member').css('display');
        if(state == 'none'){
            $('.member').show();
        }else{ 
            $('.member').hide();     
        }
	});
	$('.member .close').click(function(){
    	$('.member').hide();
    });
});

$(document).ready(function(){ 
	$('.memberbt').click(function(){
		var state = $('.member').css('display');
        if(state == 'none'){
            $('.member').show();
        }else{ 
            $('.member').hide();     
        }
	});
	$('.member .close').click(function(){
    	$('.member').hide();
    });
});



function dialogclose(){
	$.magnificPopup.close();
}

function g_alert(data){
	$.magnificPopup.open({
		  items: {
		      src: '<div id="small-dialog"> ' +
		    	  '<div id="dialogTop"> 알림 </div> <br>'+
		    	  data+'<br>'+
		    	  '<button type="button" class="dialogbtn" onclick="dialogclose()">닫기</button></div>',
		      type: 'inline',
		  }
	});
}


$(document).ready(function(){
$("#loginbtn").click(function() {
	if ($("#loginID").val() == "") {
		g_alert("아이디를 입력해주세요.");
		return;
	} else if($("#loginPW").val() == "") {
		g_alert("비밀번호를 입력해주세요.");
		return;
	} else{
	$.ajax({
		url: "login.do",
		data: "loginID=" + $("#loginID").val() + "&loginPW=" + $("#loginPW").val(),
		dataType: "json",
		type: "GET",
		success: function(data) {
			if(data.check==2){
				location.href='main.do';
			}else if(data.check==1){
				$("#loginPW").val("");
				g_alert("비밀번호가 잘못되었습니다.");
				$("#loginPW").focus();
			}else{
				$("#loginID").val("");
				$("#loginPW").val("");
				g_alert("존재하지 않는 아이디입니다.");
				$("#loginID").focus();
			}
		},
		error: function(data) {
			console.log(data);
		}
	}); }
});
});

	$(window).scroll(menuScroll);
	
	function menuScroll() { 
	    
	    var nowscroll = $(window).scrollTop();
	    
	    if(nowscroll<=1){
	    	$('#logoimg').css({'width' : '150px', 'height' : '150px'});
	    	$('#logoimg').attr({'src' : './resources/img/Gaonlogo.png'});
	    }else {
	    	$('#logoimg').css({'width' : '150px', 'height' : '77px'});
	    	$('#logoimg').attr({'src' : './resources/img/Gaonlogo2.png'});
	    }
	}
	
	//================================= 아이디 비번 찾기 ==============================

	
	$(document).ready(function(){ 
	    $('#idpwFind').click(function(){
	        var state = $('.idpwFind_wrap').css('display');
	        if(state == 'none'){
	            $('.idpwFind_wrap').show();
	            $('#idName').focus();
	        }else{ 
	            $('.idpwFind_wrap').hide();  
	        }
	    });
	    $('.close').click(function(){
	    	$('.idpwFind_wrap').hide();
	    	$('.login').hide();
	    });
	    $('.closebtn').click(function(){
	    	$('.idpwFind_wrap').hide();
	    	$('.login').hide();
	    });
	    
	});
	
	
	$(document).ready(function(){ 
	    $('#idSearch').click(function(){
	        var state = $('.id').css('display');
	        	$('.pw').hide(); 
	        	$('#header .idpwFind_wrap').css("height", "296px");
	            $('#header #idSearch').css({"background-color": "#E08F23", "color": "#fff"});
	        	$('.id').show();
	            $('#idName').focus();
	            $("#header #idSearch").hover(function(){
	            	 $('#header #idSearch').css({"background-color": "#E08F23", "color": "#fff"})}, function(){
	                 $('#header #idSearch').css({"background-color": "#E08F23", "color": "#fff"})
	            	 });
	            $("#header #pwSearch").hover(function(){
					$("#header #pwSearch").css({"background-color": "#E08F23", "color": "#fff"})}, function(){
					$("#header #pwSearch").css({"background-color": "transparent", "color": "#E08F23"})
				});
	            $('#header #pwSearch').css({"background-color": "transparent", "color": "#E08F23"});
	            
	            
	    });
	});
	$(document).ready(function(){ 
	    $('#pwSearch').click(function(){
	        var state = $('.pw').css('display');
	        	$('.id').hide();
	        	$('#header .idpwFind_wrap').css("height", "330px");
	        	$('#header #pwSearch').css({"background-color": "#E08F23", "color": "#fff"});
	            $('.pw').show();
	            $('#pwId').focus();
	            $("#header #pwSearch").hover(function(){
	            	 $('#header #pwSearch').css({"background-color": "#E08F23", "color": "#fff"})}, function(){
	                 $('#header #pwSearch').css({"background-color": "#E08F23", "color": "#fff"})
	            	 });
	            $("#header #idSearch").hover(function(){
					$("#header #idSearch").css({"background-color": "#E08F23", "color": "#fff"})}, function(){
					$("#header #idSearch").css({"background-color": "transparent", "color": "#E08F23"})
				});
	            $('#header #idSearch').css({"background-color": "transparent", "color": "#E08F23"});
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
	
	
	function resize(img){ //이미지의 비율에 맞춰서 잘라내기
		var divAspect = 100 / 100; 
		var imgAspect = img.height / img.width;
		
		if (imgAspect <= divAspect) {
		    $('#header .member .profile100 .nowimg').css({'width': 'auto', 'height': '100%'})
		    $('#header .nav .profile100 .nowimg').css({'width': 'auto', 'height': '100%'})
		    $('.profile200 img').css({'width': 'auto', 'height': '100%'})
		} else {
			$('#header .member .profile100 .nowimg').css({'width': '100%', 'height': 'auto'})
			$('#header .nav .profile100 .nowimg').css({'width': '100%', 'height': 'auto'})
			$('.profile200 img').css({'width': '100%', 'height': 'auto'})
		}
	}
	