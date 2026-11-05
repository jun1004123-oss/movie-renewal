<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$('.theaterListTable').hide();
		$('.movieListButton').click(function() {
			$('.movieListButton').addClass('selected');
			$('.theaterListButton').removeClass('selected');
			$('.movieListTable').show();
			$('.theaterListTable').hide();
		});
		
		$('.theaterListButton').click(function() {
			$('.movieListButton').removeClass('selected');
			$('.theaterListButton').addClass('selected');
			$('.movieListTable').hide();
			$('.theaterListTable').show();
		});
	});
</script>

<div id="adminMovieTheaterList">
	<div  style="margin-top: 100px;">
		<button class="movieListButton selected" type="button" value="movieList">영화 목록</button>
		<button class="theaterListButton" type="button" value="theaterList">영화관 목록</button>
	</div>
	<div align="center">
		<!-- 영화 목록 출력 -->
		<table class="movieListTable table table-hover"  style="width: 90%;">
			<thead style=" border-bottom: 5px solid #017467;"><tr>
				<th>영화이름(한글)</th>
				<th>영화이름(영문)</th>
				<th>감독</th>
				<th>장르</th>
				<th>상영시간(분)</th>
				<th>상영시작일</th>
				<th>상영종료일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr></thead>
			<c:forEach var="movieBean" items="${movieList}">
				<tr>
					<td>${movieBean.NAME_K}</td>
					<td>${movieBean.NAME_E}</td>
					<td>${movieBean.DIRECTOR}</td>
					<td>${movieBean.GENRE}</td>
					<td>${movieBean.r_TIME}</td>
					<td>${movieBean.STARTDATESTRING}</td>
					<td>${movieBean.ENDDATESTRING}</td>
					<td><input type="button" value="수정" onclick="location.href='adminMoviePreEdit.do?movie_id=${movieBean.MOVIE_ID}'"></td>
					<td><input type="button" value="삭제" onclick="location.href='adminMovieDelete.do?movie_id=${movieBean.MOVIE_ID}'"></td>
				</tr>
			</c:forEach>
		</table>
		<!-- 영화관 목록 출력 -->
		<table class="theaterListTable table table-hover"  style="width: 90%;">
			<thead style=" border-bottom: 5px solid #017467;"><tr>
				<th>도시이름</th>
				<th>지역이름</th>
				<th>영화관이름</th>
				<th>영화관종류</th>
				<th>좌석개수</th>
				<th>수정</th>
				<th>삭제</th>
			</tr></thead>
			<c:forEach var="theaterBean" items="${theaterList}">
				<tr>
					<td>${theaterBean.cname}</td>
					<td>${theaterBean.lname}</td>
					<td>${theaterBean.tname}</td>
					<td>${theaterBean.ttype}</td>
					<td>${theaterBean.seatcount}</td>
					<td><input type="button" value="수정" onclick="location.href='adminTheaterPreEdit.do?theater_id=${theaterBean.theater_id}'"></td>
					<td><input type="button" value="삭제" onclick="location.href='adminTheaterDelete.do?theater_id=${theaterBean.theater_id}'"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<input type="button" value="영화 추가" onclick="location.href='adminMoviePreInsert.do'">
		<input type="button" value="영화 상영 시간표 추가" onclick="location.href='adminTheaterPreInsert.do'">
	</div>
</div>