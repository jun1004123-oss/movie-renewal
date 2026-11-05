
$(function() {
		showTheater("전체", null);
	});
	
	function showTheater(cname, lname) {
		if(cname == "전체" && lname == null) { //전체 클릭
			selectIntroAll();
			$('.location_menu').hide();
		} else if(cname != null && lname == null) { //도시 클릭
			selectLname(cname);
			selectIntroByCname(cname);
			$('.location_menu').show();
			$('html, body').animate({scrollTop:500}, 500);
		} else if(cname == null && lname != null) { //지역 클릭
			selectIntroByLname(lname);
			$('html, body').scrollTop(500);
			$('html, body').animate({scrollTop:500}, 500);
		}
	}
	
	/* 지역목록 가져오기 */
	function selectLname(cname) {
		$.ajax({
			url: "theaterSelectLname.do",
			data: "cname=" + cname,
			dataType: "json",
			type: "GET",
			success: function(data) {
				console.log("selectLname success : " + data.list[0].lname);
				var str = "<ul>";
				for(i = 0; i < data.list.length; i++) {
					str = str + "<li><a href='#' class='lname' onclick=showTheater(null,'"+data.list[i].lname+"')>"+data.list[i].lname+"</a></li>";
				}
				str = str + "</ul>";
				$('#theater .location_menu').html(str);
			},

			error: function(data) { g_alert("selectLname error : " + data) }
		});
	}
	
	/* 전체 영화관 소개 가져오기 */
	 function selectIntroAll() {
		$.ajax({
			url: "theaterSelectIntroAll.do",
			dataType: "json",
			type: "GET",
			success: function(data) {
				//console.log("success : " + data.list);
				var str ="";
				for(i = 0; i < data.list.length; i++) {
					str+="<tr>";
					str += "<td>"+data.list[i].cname+"</td>"
					str += "<td>"+data.list[i].lname+"</td>"
					str += "<td>"+data.list[i].tname+"</td>"
					str += "<td>"+data.list[i].ttype+"</td>"
					str += "<td>"+data.list[i].seatcount+"</td>"
					str+="</tr>";
				}
				$('#theater .theaterlist').html(str);
			},
			error: function(data) { g_alert("selectIntroAll error : " + data) }
		});
	} 
	
	/* 도시 영화관 소개 가져오기 */
	function selectIntroByCname(cname) {
		$.ajax({
			url: "theaterSelectIntroByCname.do",
			data: "cname=" + cname,
			dataType: "json",
			type: "GET",
			success: function(data) {
				var str ="";
				for(i = 0; i < data.list.length; i++) {
					str+="<tr>";
					str += "<td>"+data.list[i].cname+"</td>"
					str += "<td>"+data.list[i].lname+"</td>"
					str += "<td>"+data.list[i].tname+"</td>"
					str += "<td>"+data.list[i].ttype+"</td>"
					str += "<td>"+data.list[i].seatcount+"</td>"
					str+="</tr>";
				}
				$('#theater .theaterlist').html(str);
			},
			error: function(data) { g_alert(" selectIntroByCname error : " + data) }
		});
	} 
	
	/* 지역 영화관 소개 가져오기 */
	function selectIntroByLname(lname) {
		$.ajax({
			url: "theaterSelectIntroByLname.do",
			data: "lname=" + lname,
			dataType: "json",
			type: "GET",
			success: function(data) {
				var str ="";
				for(i = 0; i < data.list.length; i++) {
					str+="<tr>";
					str += "<td>"+data.list[i].cname+"</td>"
					str += "<td>"+data.list[i].lname+"</td>"
					str += "<td>"+data.list[i].tname+"</td>"
					str += "<td>"+data.list[i].ttype+"</td>"
					str += "<td>"+data.list[i].seatcount+"</td>"
					str+="</tr>";
				}
				$('#theater .theaterlist').html(str);
			},
			error: function(data) { g_alert("selectIntroByLname error : " + data) }
		});
	}