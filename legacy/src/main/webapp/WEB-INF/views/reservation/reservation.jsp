<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	/* 전역 변수 선언 */
	var movie_id = 0;
	var name_k = "";
	var age = "";
	var cname = "";
	var corder = 0;
	var corder2 = 0;
	var lname = "";
	var mstartdate = "";
	var mstarthour = "";
	var THEATER_ID = 0;
	var hour = "";
	var THEATER_SCHEDULE_ID = 0;
	
	/* 영화 전체 클릭시 */
	function selectMovieNameAgeAll() {
		this.movie_id = 0;
		this.name_k = "";
		this.age = "";
		this.cname = "";
		this.lname = "";
		this.mstartdate = "";
		this.mstarthour = "";
		$.ajax({
			url: "reservationSelectMovieNameAgeAll.do",
			dataType: "json",
			type: "GET",
			success: function(data) {
				var strHTML = "<ul>";
				for(i = 0; i < data.list.length; i++) {
					strHTML = strHTML + "<li><a href='#' class=movieid"+data.list[i].movie_id+" onclick=movieClick('" + data.list[i].movie_id +"','"+data.list[i].name_k.replace(" ","")+"','"+data.list[i].age+"')>";
					strHTML = strHTML + "<img width='30' height='30' src='resources/img/movie/movie" + data.list[i].age + ".png'> ";
					strHTML = strHTML + data.list[i].name_k + "</a></li>";
				}
				strHTML = strHTML + "</ul>";
				$('.movie_list').html(strHTML);
			},
			error: function(data) { alert("error : " + data) }
		});
	}
	
	/* 영화관 전체 클릭시(도시) */
	function selectTheaterCnameAll() {
		this.movie_id = 0;
		this.name_k = "";
		this.age = "";
		this.cname = "";
		this.lname = "";
		this.mstartdate = "";
		this.mstarthour = "";
		$.ajax({
			url: "reservationSelectTheaterCnameAll.do",
			dataType: "json",
			type: "GET",
			success: function(data) {
				var strHTML = "<ul>";
				for(i = 0; i < data.list.length; i++) {
					strHTML = strHTML + "<li><a href='#' class=theaterid"+data.list[i].corder+"  onclick=theaterCnameClick('" + data.list[i].cname + "','"+data.list[i].corder+"')>" + data.list[i].cname + "</a></li>";
				}
				strHTML = strHTML + "</ul>";
				$('.theater_city_list').html(strHTML);
				selectTheaterLnameAll(data.list[0].cname);
			},
			error: function(data) { alert("error : " + data) }
		});
	}
	
	/* 영화관 전체 클릭시(지역) */
	function selectTheaterLnameAll(cname) {
		$.ajax({
			url: "reservationSelectTheaterLnameAll.do",
			data: "cname=" + cname,
			dataType: "json",
			type: "GET",
			success: function(data) {
				var strHTML = "<ul>";
				for(i = 0; i < data.list.length; i++) {
					strHTML = strHTML + "<li><a href='#' class=theaterlid"+data.list[i].corder2+" onclick=theaterLnameClick('"+ data.list[i].lname +"','"+data.list[i].corder2+"')>" + data.list[i].lname + "</a></li>";
				}
				strHTML = strHTML + "</ul>";
				$('.theater_location_list').html(strHTML);
			},
			error: function(data) { alert("error : " + data) }
		});
	}
	
	/* 날짜 전체 클릭시 */
	function selectDateAll() {
		this.movie_id = 0;
		this.name_k = "";
		this.age = "";
		this.cname = "";
		this.lname = "";
		this.mstartdate = "";
		this.mstarthour = "";
		$.ajax({
			url: "reservationSelectDateAll.do",
			dataType: "json",
			type: "GET",
			success: function(data) {
				var strHTML = "<ul>";
				for(i = 0; i < data.list.length; i++) {
					strHTML = strHTML + "<li><a href='#' onclick=dateClick('" + data.list[i].mstartdate + "')>" + data.list[i].mstartdate + "</a></li>";
				}
				strHTML = strHTML + "</ul>";
				$('.date_list').html(strHTML);
			},
			error: function(data) { alert("error : " + data) }
		});
	}
	
	/* 영화 클릭시 */
	function movieClick(movie_id, name_k, age) {
		this.movie_id = movie_id;
		this.name_k = name_k;
		this.age = age;
		selectTheaterCname(movie_id);
		selectDate(this.movie_id, this.cname, this.lname);
		selectHour(this.movie_id, this.cname, this.lname, this.mstartdate);
		$('[class^="movieid"]').removeClass('selected');
		$('.movieid'+movie_id).addClass('selected');
		console.log('.movieid'+movie_id);
	}
	
	/* 도시 클릭시 */
	function theaterCnameClick(cname, corder) {
		this.cname = cname;
		this.corder = corder;
		selectTheaterLname(cname);
		selectMovieNameAge(cname, "", "");
		selectDate(this.movie_id, this.cname, this.lname);
		selectHour(this.movie_id, this.cname, this.lname, this.mstartdate);
		$('.movieid'+movie_id).addClass('selected');
		$('[class^="theaterid"]').removeClass('selected');
		$('.theaterid'+corder).addClass('selected');
	}
	
	/* 지역 클릭시 */
	function theaterLnameClick(lname, corder2) {
		this.corder2 = corder2;
		this.lname = lname;
		selectMovieNameAge("", lname, "");
		selectDate(this.movie_id, this.cname, this.lname);
		selectHour(this.movie_id, this.cname, this.lname, this.mstartdate);
		$('.movieid'+movie_id).addClass('selected');
		$('[class^="theaterid"]').removeClass('selected');
		$('.theaterid'+corder).addClass('selected');
		$('[class^="theaterlid"]').removeClass('selected');
		$('.theaterlid'+corder2).addClass('selected');
	}
	
	/* 날짜 클릭시 */
	function dateClick(mstartdate) {
		this.mstartdate = mstartdate;
		selectMovieNameAge("", "", mstartdate);
		selectTheaterCname(0, mstartdate);
		selectHour(this.movie_id, this.cname, this.lname, this.mstartdate);
		$('.movieid'+movie_id).addClass('selected');
	/* 	$('[class^="theaterid"]').removeClass('selected');
		$('.theaterid'+corder).addClass('selected'); */
	}
	
	/* 시간 클릭시 */
	function hourClick(hour) {
		this.hour = hour;
		$('.movieid'+movie_id).addClass('selected');
		$('[class^="theaterid"]').removeClass('selected');
		$('.theaterid'+corder).addClass('selected');
	}
	
	/* 영화 이름, 관람가 가져오기 */
	function selectMovieNameAge(cname, lname, mstartdate) {
		$.ajax({
			url: "reservationSelectMovieNameAge.do",
			data: "cname=" + cname + "&lname=" + lname + "&mstartdate=" + mstartdate,
			dataType: "json",
			type: "GET",
			success: function(data) {
				var strHTML = "<ul>";
				for(i = 0; i < data.list.length; i++) {   
					strHTML = strHTML + "<li><a href='#' class=movieid"+data.list[i].movie_id+" onclick=movieClick('" + data.list[i].movie_id +"','"+data.list[i].name_k.replace(" ","")+"','"+data.list[i].age+"')>";
					strHTML = strHTML + "<img width='30' height='30' src='resources/img/movie/movie" + data.list[i].age + ".png'> ";
					strHTML = strHTML + data.list[i].name_k + "</a></li>";
				}
				strHTML = strHTML + "</ul>";
				$('.movie_list').html(strHTML);
				$('.movieid'+movie_id).addClass('selected');
			},
			error: function(data) { alert("error : " + data) }
		});
	}
	
	/* 영화관 도시 이름 가져오기 */
	function selectTheaterCname(movie_id, mstartdate) {
		$.ajax({
			url: "reservationSelectTheaterCname.do",
			data: "movie_id=" + movie_id + "&mstartdate=" + mstartdate,
			dataType: "json",
			type: "GET",
			success: function(data) {
				var strHTML = "<ul>";
				for(i = 0; i < data.list.length; i++) {
					strHTML = strHTML + "<li><a href='#' class=theaterid"+data.list[i].corder+"  onclick=theaterCnameClick('" + data.list[i].cname + "','"+data.list[i].corder+"')>" + data.list[i].cname + "</a></li>";
				}
				strHTML = strHTML + "</ul>";
				$('.theater_city_list').html(strHTML);
				if(data.list.length == 0) {
					selectTheaterLname("");
				} else {
					selectTheaterLname(cname);
				}
				$('[class^="theaterid"]').removeClass('selected');
				$('.theaterid'+corder).addClass('selected');
			},
			error: function(data) { alert("error : " + data) }
		});
	}
	
	/* 영화관 지역 이름 가져오기 */
	function selectTheaterLname(cname) {
		$.ajax({
			url: "reservationSelectTheaterLname.do",
			data: "movie_id=" + this.movie_id + "&cname=" + cname,
			dataType: "json",
			type: "GET",
			success: function(data) {
				var strHTML = "<ul>";
				for(i = 0; i < data.list.length; i++) {
					strHTML = strHTML + "<li><a href='#' class=theaterlid"+data.list[i].corder2+" onclick=theaterLnameClick('"+ data.list[i].lname +"','"+data.list[i].corder2+"')>" + data.list[i].lname + "</a></li>";
				}
				strHTML = strHTML + "</ul>";
				$('.theater_location_list').html(strHTML);
			 	$('[class^="theaterlid"]').removeClass('selected');
				$('.theaterlid'+corder2).addClass('selected'); 
			},
			error: function(data) { alert("error : " + data) }
		});
	}
	
	/* 날짜 가져오기 */
	function selectDate(movie_id, cname, lname) {
		$.ajax({
			url: "reservationSelectDate.do",
			data: "movie_id=" + movie_id + "&cname=" + cname + "&lname=" + lname,
			dataType: "json",
			type: "GET",
			success: function(data) {
				var strHTML = "<ul>";
				for(i = 0; i < data.list.length; i++) {
					strHTML = strHTML + "<li><a href='#' onclick=dateClick('"+ data.list[i].mstartdate +"')>" + data.list[i].mstartdate + "</a></li>";
				}
				strHTML = strHTML + "</ul>";
				$('.date_list').html(strHTML);
			},
			error: function(data) { alert("error : " + data) }
		});
	}
	
	/* 시간 가져오기 */
	function selectHour(movie_id, cname, lname, mstartdate) {
		$.ajax({
			url: "reservationSelectHour.do",
			data: "movie_id=" + movie_id + "&cname=" + cname + "&lname=" + lname + "&mstartdate=" + mstartdate,
			dataType: "json",
			type: "GET",
			success: function(data) {
				var strHTML = "<ul>";
				for(i = 0; i < data.list.length; i++) {
					strHTML = strHTML + "<li><a href='#' onclick=test('${NowUser}','"+data.list[i].THEATER_ID+"','"+data.list[i].mstarthour+"','"+data.list[i].mendhour+"','"+data.list[i].tname+"','"+data.list[i].THEATER_SCHEDULE_ID+"')>" + data.list[i].mstarthour + "</a></li>";
				}
				strHTML = strHTML + "</ul>";
				$('.hour_list').html(strHTML);
			},
			error: function(data) { alert("시간가져오기error : " + data) }
		});
	}
	
	/* 날짜 보여주기 */
	function showDate() {
		var date = new Date();
		var strHTML = "";
		strHTML = strHTML + "<div class='date_month_wrap'>";
		strHTML = strHTML + "<span class='year'>" + date.getFullYear() + " </span>";
		strHTML = strHTML + "<span class='month'>" + (date.getMonth() + 1) + "</span>";
		strHTML = strHTML + "</div>";
		for(i = date.getDate(); i < date.getDate + 10; i++) {
			strHTML = strHTML + "<div class='date_date_wrap'>";
			strHTML = strHTML + "<span class='date'>" + i + "</span>";
			strHTML = strHTML + "<span class='day'>" + "화" + "</span>";
			strHTML = strHTML + "</div>";
		}
		$('.date_list').html(strHTML);
	}
	
	function test(NowUser, THEATER_ID, starthour, endhour, tname, THEATER_SCHEDULE_ID) {
		this.THEATER_ID = THEATER_ID;
		this.hour = hour;
		this.THEATER_SCHEDULE_ID = THEATER_SCHEDULE_ID;
		/* var str = "movie_id = " + movie_id + "\nname_k = " + name_k + "\nage = " + age 
						+ "\ncname = " + cname + "\nlname = " + lname + "\ndate = " + mstartdate 
						+ "\nstarthour = " + starthour + "\nendhour = " + endhour + "\nNowUser = " + NowUser + "\nTHEATER_ID = "+THEATER_ID + "\ntname = " +tname + "\nTHEATER_SCHEDULE_ID = " +THEATER_SCHEDULE_ID ;
		alert(str); */
		step2popup(NowUser, movie_id, THEATER_ID, THEATER_SCHEDULE_ID, cname, lname, tname, mstartdate, starthour, endhour);
	}
	
</script>
<!-- <img class="bg" src="./resources/img/theaterbg.png"> -->


<div id="reservation">
	<div class="steps">
		<!-- step1 -->
		<div class="step1">
			<!-- 영화 -->
			<div class="section_movie">
				<div class="head">영화</div>
				<div class="body">
					<div class="movie_wrap">
						<div class="movie_head">
							<ul>
								<li><a href="#" onclick="selectMovieNameAgeAll();">전체</a></li>
							</ul>
						</div>
						<div class="movie_body">
							<div class="movie_list">
								<ul>
									<c:forEach var="movieBean" items="${movieList}">
										<li><a href='#' class="movieid${movieBean.movie_id}" onclick='movieClick("${movieBean.movie_id}", "${movieBean.name_k }", "${movieBean.age}")' ><img width="30" height="30" src="resources/img/movie/movie${movieBean.age}.png"> ${movieBean.name_k}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 영화관 -->
			<div class="section_theater">
				<div class="head">영화관</div>
				<div class="body">
					<div class="theater_wrap">
						<div class="theater_head">
							<ul>
								<li><a href="#" onclick="selectTheaterCnameAll();">전체</a></li>
							</ul>
						</div>
						<div class="theater_body">
							<div class="theater_city_list">
								<ul>
									<c:forEach var="theaterCnameBean" items="${theaterCnameList}">
										<li><a href="#" class="theaterid${theaterCnameBean.corder}" onclick="theaterCnameClick('${theaterCnameBean.cname}','${theaterCnameBean.corder}')">${theaterCnameBean.cname}</a></li>
									</c:forEach>
								</ul>
							</div>
							<div class="theater_location_list">
								<ul>
									<c:forEach var="theaterLnameBean" items="${theaterLnameList}">
										<li><a href="#" class="theaterlid${theaterLnameBean.corder}" onclick="theaterLnameClick('${theaterLnameBean.lname}','${theaterLnameBean.corder}');">${theaterLnameBean.lname}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 날짜 -->
			<div class="section_date">
				<div class="head">날짜</div>
				<div class="body">
					<div class="date_wrap">
						<div class="date_head">
							<ul>
								<li><a href="#" onclick="selectDateAll();">전체</a></li>
							</ul>
						</div>
						<div class="date_body">
							<div class="date_list">
								<div class="date_month_wrap">
									<ul>
										<c:forEach var="dateBean" items="${dateList}">
											<li><a href="#" onclick="dateClick('${dateBean.mstartdate}')">${dateBean.mstartdate}</a></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 시간 -->
			<div class="section_hour">
				<div class="head">시간</div>
				<div class="body">
					<div class="hour_wrap">
						<div class="hour_head">
							시간 메뉴
						</div>
						<div class="hour_body">
							<div class="hour_list">
								<div class="hour">
									<ul>
										<li><a href="#"><span>20:00</span> <span>100석</span></a></li>
										<li><a href="#"><span>20:00</span> <span>100석</span></a></li>
										<li><a href="#"><span>20:00</span> <span>100석</span></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- step2 -->
		<!-- <div class="step2" style="display: none;">
		</div> -->
	</div>
	<%-- <div>
		<h1>
			<input type="button" onclick="test('${NowUser}');" value="테스트">
			여기에 예약 버튼 작업 바람
		</h1>
	</div> --%>
</div>





<div class="step2 mfp-hide">
<div class="title" >인원/좌석 선택</div>
<div class="step2_left">
	<div class="seatselect">
		일반
		<select name="adult" class="selectpicker" data-size="9">
			<option value="0">0명</option>
			<c:forEach begin="1" end="8" var="i">
				<option value="${i}">${i}명</option>
			</c:forEach>
		</select>
		청소년
		<select name="children" class="selectpicker" data-size="9">
			<option value="0">0명</option>
			<c:forEach begin="1" end="8" var="i">
				<option value="${i}">${i}명</option>
			</c:forEach>
		</select>
		<span style="float: right; margin-right: 4px; padding-top: 2px;">인원선택은 총 8명까지 가능합니다.</span>
	</div>
	<div class="seat-wrap">
		<div class="screen">SCREEN</div><br>
		<div class="seat-all">
		<!-- 좌석뿌릴곳 -->
		</div>
	</div>
	<div class="seat-setting">좌석붙임설정
	
		<div><input type="radio" name="radio" class="radio1" value="1" disabled="disabled"> <label for="radio1">■</label></div>
	    <div><input type="radio" name="radio" class="radio2" value="2" disabled="disabled"> <label for="radio2">■■</label></div>  
	    <div><input type="radio" name="radio" class="radio3" value="3" disabled="disabled"> <label for="radio3">■■■</label></div> 
	    <div><input type="radio" name="radio" class="radio4" value="4" disabled="disabled"> <label for="radio4">■■■■</label></div>
	    <input type="radio" name="radio" class="radio5" value="0" disabled="disabled">
	    <span class="seatchecktext">좌석선택인원 0/0 명</span>
	    <a href="#" class="btn reset"><i class="fa fa-repeat"></i>&nbsp; 다시선택</a>
	</div>
	
	
</div>
<div class="step2_right">
	<img class="s2_poster" src="./resources/img/movie/BG_poster.jpg">
	<div class="step2_right_bottom">
		<div class="s2_AGE"><img src="./resources/img/movie/movie12.png"></div>
		<div class="s2_NAME"><div class="s2_NAME_K">번개맨</div>
		<div class="s2_NAME_E">Bungaeman</div></div>
		<div class="s2_loc">서울 신촌 2관</div>
		<div class="s2_date">2016. 02. 17 (수) 10:20</div>
		<div class="s2_people">&nbsp;<!-- 전체인원수 삽입 --></div>
		<div class="s2_selected">
			<!-- 선택된 시트가 삽입됨 -->
		</div>
		<div class="s2_cost"><!-- 가격 삽입 -->0원</div>
		<div class="s2_btn"><input type="button" class="pre" value="이전"><input type="button" value="다음"></div>
	</div>
</div>
</div>

<c:if test="${not empty movie_id}">
<script>
window.onload = function(){
movieClick("${movie_id}", "${name_k}", "${age}");
};
</script>
</c:if>
