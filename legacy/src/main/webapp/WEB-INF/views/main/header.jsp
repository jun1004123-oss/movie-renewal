<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(document).ready(function menuselect(){ 
	for (var i = 0; i <= 5; i++) {
		$('.nav li a').eq(i).removeClass("select")
	}
	var nowpage = '${page}';
	if(nowpage=='movie'){$('.nav li a').eq(0).addClass("select")} //영화
	if(nowpage=='reservation'){$('.nav li a').eq(1).addClass("select")} //예매
	if(nowpage=='theater'){$('.nav li a').eq(2).addClass("select")} //영화관
	if(nowpage=='store'||nowpage=='buy'){$('.nav li a').eq(3).addClass("select")} //스토어
	if(nowpage=='event'){$('.nav li a').eq(4).addClass("select")} //이벤트
	if(nowpage=='qnaList'||nowpage=='qnaDetail'||nowpage=='qnaInsert'||nowpage=='qnaEdit'){$('.nav li a').eq(5).addClass("select")} //고객센터
	
});
</script>


<div id="scroll"><i class="fa fa-chevron-up fa-lg"></i></div>

<div class="backcolor"></div>
<div class="header-wrap">
	
	<span class="logo">
		<a href="main.do"><img id="logoimg" src="./resources/img/Gaonlogo.png"></a>
	</span>

	<ul class="nav">
		<li><a href="movie.do">영화</a></li>
		<c:if test="${empty NowUser}"><li><a href="#" onclick="g_alert('로그인부터 해주세요')">예매</a></li></c:if>
		<c:if test="${not empty NowUser}"><li><a href="reservation.do">예매</a></li></c:if>
		<li><a href="theater.do">영화관</a></li>
		<!-- <li><a href="#" onclick="g_alert('준비중입니다.'); menuselect();">영화관</a></li> -->
		<li><a href="store.do">스토어</a></li>
		<li><a href="event.do">이벤트</a></li>
		<li><a href="qnaList.do">고객센터</a></li>
	<c:choose>
		<c:when test="${NowUser==null}">
			<li><button id="loginbt">로그인</button></li>
		</c:when>
		<c:otherwise>
			<li><button id="memberbt">
			<div class="profile100 img-circle memberbt">
				<img class="nowimg" src="./resources/img/member/${Nowimg}" onload="resize(this)">
			</div>
			<%-- <img class="nowimg img-circle memberbt" src="./resources/img/member/${Nowimg}"> --%>
			${Nowname}</button></li>
		</c:otherwise>
	</c:choose>
	
	</ul>
	<div class="login">

		<button type="button" class="close">&times;</button>
	 	<img id = "loginlogo" src="./resources/img/login_logo.png">
		<input type="text" id="loginID" placeholder="아이디"> <br>
		<input type="password" id ="loginPW" name="secret" placeholder="비밀번호">
		<input type="button" id="loginbtn" value="로그인"><br>
		<input type="button" id="idpwFind" value="ID/PW찾기">
		<a href="write.do"><input type="button" id="joinbt" value="회원가입"></a>
	</div>
	
	<div class="idpwFind_wrap">
		<button type="button" class="close">&times;</button>
	 	<img id = "loginlogo" src="./resources/img/login_logo.png">
	 	<button id="idSearch">아이디 찾기</button><button id="pwSearch">비밀번호 찾기</button>
	 	<div class="id" style="display:block; ">
			<input type="text" id="idName" placeholder="이름"> <br>
			<input type="text" id="idEmail" placeholder="이메일 주소"> <br>
			<input type="button" id="idSerchBtn" value="확인"><input type="button" class="closebtn" value="취소"> <br>
		</div>
		<div class="pw" style="display: none;">
			<input type="text" id="pwId" name="pwId" placeholder="아이디"> <br>
			<input type="text" id="pwName" name="pwName" placeholder="이름"> <br>
			<input type="text" id="pwEmail" name="pwEmail" placeholder="이메일 주소"> <br>
			<input type="button" id="pwSerchbtn" name="pwSerchbtn" value="확인"><input type="button" class="closebtn" value="취소"> <br>
		</div>
	</div>
	
	
	
	<div class="member">
	<c:if test="${NowUser=='admin'}">
	 	<img id = "loginlogo" src="./resources/img/login_logo.png"><br>
		<button type="button" class="close">&times;</button>
		<div class="profile100 img-circle">
			<img class="nowimg" src="./resources/img/member/${Nowimg}">
		</div>
		<br>
		<span class="membercontent">
		<b>아이디 :${NowUser}</b><br>	
		<b>이 름 : ${Nowname}</b><br>
		<b>포인트 :${Nowpoint}</b><br>
		</span>
		<a href="adminMemberList.do" id="a_member">회원관리</a>
		<a href="adminReservationList.do" id="a_rev" >예약관리</a><br><br><br>
		<a href="adminMovieTheaterList.do" id="a_movie" >영화관리</a>
		<a href="logout.do" id="a_logout">로그아웃</a>
	</c:if>
	<c:if test="${NowUser!='admin'}">
	 	<img id = "loginlogo" src="./resources/img/login_logo.png"><br>
		<button type="button" class="close">&times;</button>
		<div class="profile100 img-circle">
			<img class="nowimg" src="./resources/img/member/${Nowimg}" onload="resize(this)">
		</div><br>
		<%-- <img class="nowimg img-circle" src="./resources/img/member/${Nowimg}"><br> --%>
		<span class="membercontent">
		<b>아이디 : ${NowUser}</b><br>	
		<b>이 름 : ${Nowname}</b><br>
		<b>포인트 :${Nowpoint}</b><br>
		</span>
		<a href="member.do" id="m_detail" >회원정보</a>
		<a href="LikeMovie.do?NowUser=${NowUser}" id="m_like" >찜한영화</a><br><br><br>
		<a href="selectrev.do?userid=${NowUser}" id="m_rev" >예약확인</a>
		<a href="logout.do" id="m_logout">로그아웃</a>
	</c:if>
	</div>
	
</div>

