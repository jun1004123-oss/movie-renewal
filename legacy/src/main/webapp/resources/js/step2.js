
var inwon=0; //선택된 총인원
var seatnum = 0; //라디오체크의 숫자
var checknum = 0; // 선택된 자리의 숫자
var remain = 0; // 남은 선택권

var revcost = 0; //비용
var NAME_K = "";
var NAME_E = "";
var AGE = "";
var POSTER = "";
var R_TIME = 0;
var revseat ="";
var adult = 0;
var children = 0;

var USER_ID; var MOVIE_ID; var THEATER_ID; var THEATER_SCHEDULE_ID; var CNAME; var LNAME; 
var TNAME; var SEATSTYLE; var REVDATE; var MSTARTHOUR; var TTYPE ; var MENDHOUR;


var revstring = "";
var revpossible = false;

function decode(data){
	var Ca = /\+/g;
	var result = decodeURIComponent(data).replace(Ca, " ");
	return result;
}

$(document).ready(function(){ 
	$(".step2 .pre").click(function(){
		checkremoveall();
		$.magnificPopup.close();
	});
	$(".step2 .reset").click(function(){
		checkremoveall();
	});
	$('.step2_right input[type="button"]').eq(1).click(function(){
		if(revpossible){
			lastrev();
		}else{alert("좌석선택이 완료되지 않았습니다");
		}
	})
});

$(document).ready(function(){ 
	$(".step2 select[name=adult]").change(function() {
		removeall();
		adult = parseInt($(".step2 select[name=adult]").val());
		children = parseInt($(".step2 select[name=children]").val());
		inwon = parseInt($(".step2 select[name=adult]").val())+parseInt($(".step2 select[name=children]").val());
		if(inwon>8){
			$(".step2 select[name=adult]").val(0);
			inwon = parseInt($(".step2 select[name=adult]").val())+parseInt($(".step2 select[name=children]").val());
			costresult();
			inwonresult();
			alert("최대인원은 8명까지 입니다.");
			return;
		}else if(inwon==0){
			$('.seat-setting input[class="radio5"]').prop("checked", true);
		}
		costresult();
		inwonresult();
		remaincheck();
	});
	
	$(".step2 select[name=children]").change(function() {
		removeall();
		adult = parseInt($(".step2 select[name=adult]").val());
		children = parseInt($(".step2 select[name=children]").val());
		inwon = parseInt($(".step2 select[name=adult]").val())+parseInt($(".step2 select[name=children]").val());
		if(inwon>8){
			$(".step2 select[name=children]").val(0);
			inwon = parseInt($(".step2 select[name=adult]").val())+parseInt($(".step2 select[name=children]").val());
			costresult();
			inwonresult();
			alert("최대인원은 8명까지 입니다.");
			return;
		}else if(inwon==0){
			$('.seat-setting input[class="radio5"]').prop("checked", true);
		}
		costresult();
		inwonresult();
		remaincheck();
	});
});

function removeall(){
	$("[class^='seat'][ckeck='ok']").removeClass("select");
	for (var int = 0; int < 8; int++) {
		$("[class^='seat'][ckeck='ok']").attr("rev", "");
		$("[class^='seat'][ckeck='ok']").attr("ckeck", "");
	}
	checknum = 0;
	checkremoveall();
}

function remaincheck() {
	remain = inwon-checknum;
	seatnum = parseInt($('.seat-setting input[name="radio"]:checked').val());
	if(remain>0){
		for (var d = 1; d <= 4; d++) {
			$('.seat-setting input[class="radio'+d+'"]').prop("disabled", false);
		};
		if(remain<=4){
			$('.seat-setting input[class="radio'+remain+'"]').prop("checked", true);
			for (var d2 = remain+1; d2 <= 4; d2++) {
				$('.seat-setting input[class="radio'+d2+'"]').prop("disabled", true);
			};
			$('.seat-setting input[class="radio'+remain+'"]').prop("checked", true);
		}else if(remain==5||remain==6){
			$('.seat-setting input[class="radio3"]').prop("checked",true);
		}else if(remain==7||remain==8){
			$('.seat-setting input[class="radio4"]').prop("checked",true);
		}
	}else{
		for (var c = 1; c <= 4; c++) {
			$('.seat-setting input[class="radio5"]').prop("checked", true);
			$('.seat-setting input[class="radio'+c+'"]').prop("disabled", true);
		}
	}
	if(remain==0&&inwon!=0){
		$('.step2_right input[type="button"]').eq(1).addClass("next");
		revpossible = true;
	}else{$('.step2_right input[type="button"]').eq(1).removeClass("next");
		revpossible = false;
	};
		$('.step2 .seatchecktext').text("좌석선택인원 "+checknum+"/"+inwon+"명");
	
}// remaincheck end


function checkadd(seat){
	$(".s2_selected").html($(".s2_selected").html()+'<div class="s2_seat">'+seat+'</div>');
	revseat += seat+"/";
}

function checkremove(seat){
	var remaintext = $(".s2_selected").html();
	seat = '<div class="s2_seat">'+$.trim(seat)+'</div>';
	$(".s2_selected").html(remaintext.replace(seat, '')); 
	revseat = revseat.replace(seat+"/", "");
}

function checkremoveall(){
	$(".s2_selected").html("");
	$(".seat-all span[ckeck='ok']").removeClass("select");
	$(".seat-all span[ckeck='ok']").attr("rev", "");
	$(".seat-all span[ckeck='ok']").attr("ckeck", "");
	revseat = "";
	checknum = 0;
	remaincheck();
}


function costresult(){
	var costall = parseInt($(".step2 select[name=adult]").val())*9000+parseInt($(".step2 select[name=children]").val())*7000;
	revcost = costall;
	costall = String(costall).replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1,'); 
	$(".s2_cost").text(costall+"원");
}

function inwonresult(){
	var adult = parseInt($(".step2 select[name=adult]").val());
	var children = parseInt($(".step2 select[name=children]").val());
	
	if(adult>0&&children==0){ 
		$(".s2_people").text("일반 " + adult +"명");
	}else if(adult==0&&children>0){
		$(".s2_people").text("청소년 " + children +"명");
	}else {
		$(".s2_people").text("일반 " + adult+"명 " +"청소년 " + children +"명");
	}
}

function lastrev(){
	$.ajax({
		url: "LastRev.do",
		data: "theater_schedule_id="+THEATER_SCHEDULE_ID+"&movie_id="+MOVIE_ID+"&cname="+CNAME+"&lname="+LNAME+"&tname="+TNAME+"&ttype="+TTYPE+"&s_mstarthour="+REVDATE+" "+MSTARTHOUR+"&s_mendhour="+REVDATE +" "+ MENDHOUR+"&name_k="+NAME_K+"&name_e="+NAME_E+"&age="+AGE+"&poster="+POSTER+"&r_time="+R_TIME+"&userid="+USER_ID+"&seat="+revseat+"&children="+children+"&adult="+adult+"&price="+revcost,
		dataType: "json",
		type: "GET",
		success: function(data) { 
			g_alert("예매가 완료되었습니다");
			 location.href = "main.do";
		},
		error: function(data) {
			alert("예매에 실패하였습니다");
			console.log(data);
		}
	});
}

function step2popup(s1_USER_ID, s1_MOVIE_ID, s1_THEATER_ID, s1_THEATER_SCHEDULE_ID, s1_CNAME, s1_LNAME, s1_TNAME, s1_REVDATE, s1_MSTARTHOUR, s1_MENDHOUR) {
	USER_ID = s1_USER_ID; //사용자 아이디
	MOVIE_ID =s1_MOVIE_ID; //영화 아이디
	THEATER_ID = s1_THEATER_ID; //영화관 아이디
	THEATER_SCHEDULE_ID = s1_THEATER_SCHEDULE_ID //영화관 스케쥴 아이디
	CNAME = s1_CNAME; //도시이름 서울
	LNAME = s1_LNAME; //지역이름 신촌
	TNAME = s1_TNAME; //1관
	REVDATE = s1_REVDATE; //예약날짜
	MSTARTHOUR = s1_MSTARTHOUR; //예약시간
	MENDHOUR = s1_MENDHOUR;
	
	$(".step2_right .s2_loc").html(CNAME+"&nbsp;"+LNAME+"&nbsp;"+TNAME);
	$(".step2_right .s2_date").html(REVDATE+"&nbsp;"+MSTARTHOUR);
	
	$.ajax({
		url: "movieDetail.do",
		data: "MOVIE_ID=" +MOVIE_ID,
		dataType: "json",
		type: "GET",
		success: function(data) { 
			$(".step2_right .s2_poster").attr("src", "./resources/img/movie/"+decode(data.POSTER));
			$(".step2_right .s2_AGE").html('<img src="./resources/img/movie/movie'+decode(data.AGE)+'.png">');
			$(".step2_right .s2_NAME_K").html(decode(data.NAME_K));
			$(".step2_right .s2_NAME_E").html(decode(data.NAME_E));
			NAME_K = decode(data.NAME_K);
			NAME_E = decode(data.NAME_E);
			AGE = decode(data.AGE);
			POSTER = decode(data.POSTER);
			R_TIME = decode(data.R_TIME);
			
			$.magnificPopup.open({
				  items: {
				      src: '.step2',
				      type: 'inline',
				  },
				 closeBtnInside: true
			});
		},
		error: function(data) {
			console.log(data);
		}
	});
	

	$.ajax({
		url: "seatNum.do",
		data: "THEATER_ID=" +THEATER_ID,
		dataType: "json",
		type: "GET",
		success: function(data) { 
			
			/*var col = data.col; 
			var row = data.row;*/
			var col = data.row; 
			var row = data.col;
			TTYPE = data.TTYPE;
			var seat_html = "";
			var ABC = 64; 
			for(var i=1; i<=col; i++){
				seat_html += '<span class="line">'+String.fromCharCode(ABC+i)+'</span>';
					for(var j=1; j<=row; j++){
					seat_html +='<span class="seat'+String.fromCharCode(ABC+i)+j+'">'+j+'</span>';
					}
				seat_html += '<br>';
			};
				
			$(".step2 .seat-all").html(seat_html); //좌석출력
			
			$.ajax({
				url: "seatRevCheck.do",
				data: "scheduleid=" +THEATER_SCHEDULE_ID,
				dataType: "json",
				type: "GET",
				success: function(data) { 
					revstring = data.revseat;
					var revnum = revstring.split("/").length-2;
					var seatName = revstring.split("/");
					for (var si = 0; si < seatName.length; si++) {
						$(".step2 .seat"+seatName[si]).addClass("selected");
						$(".step2 .seat"+seatName[si]).attr("rev", "ok");
					};
					
					$(document).ready(function(){ 
						$(".seat-all span[class*='seat']").mouseover(function(){
							seatnum = parseInt($(':radio[name="radio"]:checked').val());
							remain = inwon-checknum;
							allreturn : if($(this).attr("rev")=="ok"||remain==0){
								return;
							}else{
								var seatcol =  $(this).attr("class").substring(4,5);
								for (var i = 0; i < seatnum; i++) {
									var seatrownum = parseInt($(this).attr("class").substring(5),10);
									if(seatrownum+seatnum-1>row){
										if($(".seat"+seatcol+(seatrownum+i-(seatrownum+seatnum-1-row))).attr("rev")=="ok"){
										break allreturn;
										}
									}else {
										if($(".seat"+seatcol+(seatrownum+i)).attr("rev")=="ok"){
											break allreturn;
										}
									}
								}
								
								for (var i = 0; i < seatnum; i++) {//selet클래스 추가
									if($(this).attr("rev")!="ok"){
										var seatrownum = parseInt($(this).attr("class").substring(5),10);
										
										if(seatrownum+seatnum-1>row){
											if($(".seat"+seatcol+(seatrownum+i-(seatrownum+seatnum-1-row))).attr("rev")!="ok"){
												$(".seat"+seatcol+(seatrownum+i-(seatrownum+seatnum-1-row))).addClass("select");
											}else{return;}
										}else {
											if($(".seat"+seatcol+(seatrownum+i)).attr("rev")!="ok"){
												$(".seat"+seatcol+(seatrownum+i)).addClass("select");
											}else{return;}
										} 
									}
								}//selet클래스 추가 end
							}
							
							
						});
						$(".seat-all span[class*='seat']").mouseout(function(){
							if($(this).attr("class")=="selected"){return;}else{
								var seatcol =  $(this).attr("class").substring(4,5);
								remain = inwon-checknum;
								for (var i = 0; i < seatnum; i++) {
									if($(this).attr("rev")!="ok"){
										var seatrownum = parseInt($(this).attr("class").substring(5),10);
										if(seatrownum+seatnum-1>row){
											if($(".seat"+seatcol+(seatrownum+i-(seatrownum+seatnum-1-row))).attr("rev")!="ok"){
												$(".seat"+seatcol+(seatrownum+i-(seatrownum+seatnum-1-row))).removeClass("select");
											}else{return;}
										}else {
											if($(".seat"+seatcol+(seatrownum+i)).attr("rev")!="ok"){
												$(".seat"+seatcol+(seatrownum+i)).removeClass("select");
											}else{return;}
										}
									}
								}
							}
							
						});
					});

					
					/* 좌석 마우스클릭시 value 추가 */
					$(".seat-all span[class*='seat']").click(function(){
						
					allreturn2 : if(remain>0){
						
						if($(this).attr("ckeck")=="ok"){
							$(this).attr("rev", "");
							$(this).attr("ckeck", "");
							$(this).removeClass("select");
							--checknum;
							checkremove($(this).attr("class").replace(" select", "").substring(4));
							remaincheck();
							return;
						}else{
							var seatcol =  $(this).attr("class").substring(4,5);
							
							for (var i = 0; i < seatnum; i++) {
								var seatrownum = parseInt($(this).attr("class").substring(5),10);
								if(seatrownum+seatnum-1>row){
									if($(".seat"+seatcol+(seatrownum+i-(seatrownum+seatnum-1-row))).attr("rev")=="ok"){
									break allreturn2;
									}
								}else {
									if($(".seat"+seatcol+(seatrownum+i)).attr("rev")=="ok"){
										break allreturn2;
									}
								}
							}
							
							for (var i = 0; i < seatnum; i++) {
								if($(this).attr("rev")!="ok"){
									var seatrownum = parseInt($(this).attr("class").substring(5),10);
									if(seatrownum+seatnum-1>row){
										if($(".seat"+seatcol+(seatrownum+i-(seatrownum+seatnum-1-row))).attr("rev")!="ok"){
											$(".seat"+seatcol+(seatrownum+i-(seatrownum+seatnum-1-row))).attr("ckeck", "ok");
										}else{return;}
									}else {
										if($(".seat"+seatcol+(seatrownum+i)).attr("rev")!="ok"){
											$(".seat"+seatcol+(seatrownum+i)).attr("ckeck", "ok");
										}else{return;}
									} 
								}
							}
							
							for (var i = 0; i < seatnum; i++) {
									var seatrownum = parseInt($(this).attr("class").substring(5),10);
									if(seatrownum+seatnum-1>row){
										if($(".seat"+seatcol+(seatrownum+i-(seatrownum+seatnum-1-row))).attr("ckeck")=="ok"){
											$(".seat"+seatcol+(seatrownum+i-(seatrownum+seatnum-1-row))).addClass("select");
											$(".seat"+seatcol+(seatrownum+i-(seatrownum+seatnum-1-row))).attr("rev", "ok");
											++checknum;
											checkadd(seatcol+(seatrownum+i-(seatrownum+seatnum-1-row)));
										}else{return;}
									}else {
										if($(".seat"+seatcol+(seatrownum+i)).attr("ckeck")=="ok"){
											$(".seat"+seatcol+(seatrownum+i)).addClass("select");
											$(".seat"+seatcol+(seatrownum+i)).attr("rev", "ok");
											++checknum;
											checkadd(seatcol+(seatrownum+i));
										}else{return;}
									} 
							}
							remaincheck();
						}
					}else if($(this).attr("ckeck")=="ok"){
						$(this).attr("rev", "");
						$(this).attr("ckeck", "");
						$(this).removeClass("select");
						--checknum;
						checkremove($(this).attr("class").replace(" select", "").substring(4));
						remaincheck();
					}else if(inwon!=0){alert("모든인원만큼 체크하셨습니다")
					}else{alert("인원부터 선택해주세요")}
					});
				},
				error: function(data) {
					console.log("error : "+data);
				}
			});
			
		},
		error: function(data) {
			console.log("error : "+data);
		}
	});
	
}; //step2popup end 


