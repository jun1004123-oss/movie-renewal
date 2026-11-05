<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function(){
		initSeat();
		
		$('.datepicker').datepicker({
			dateFormat: 'yy-mm-dd'
		});
	});
	
	function initSeat() {
		var seat = "";
		var zero = "";
		for(i = 0; i < 26; i++) {
			seat = seat + String.fromCharCode(i + 65) + "행 ";
			for(j = 0; j < 30; j++) {
				if(j < 9) { zero = "0"; }
				else { zero = ""; }
				seat = seat + "<input type='checkbox' name='listSeat' value='" + String.fromCharCode(i + 65) + zero + (j + 1) + "'>";
				seat = seat + zero + (j + 1);
			}
			seat = seat + "<p></p>";
		}
		$('#theaterSeat').html(seat);
	}
</script>
<div id="adminTheaterEdit"  align="center">
	<form action="adminTheaterEdit.do">
		<table class="table table-hover" style="width: 50%;  margin-top: 100px;">
			<tr><td>도시이름</td><td>
				<input name="cname" type="text" placeholder="도시이름" required="required">
				<select>
					<option>직접 작성</option>
					<option>서울</option>
				</select>
			</td></tr>
			<tr><td>지역이름</td><td>
				<input name="lname" type="text" placeholder="지역이름" required="required">
				<select>
					<option>직접 작성</option>
				</select>
			</td></tr>
			<tr><td>영화관이름</td><td><input name="tname" type="text" placeholder="영화관이름" required="required"></td></tr>
			<tr><td>영화관종류</td><td>
				<select name="ttype">
					<option value="2D">2D</option>
					<option value="3D">3D</option>
				</select>
			</td></tr>
			<tr><td>영화이름</td><td><input name="mname" type="text" placeholder="영화이름" required="required"></td></tr>
			<tr><td>상영시작시간</td><td><input name="mstarthour" class="datepicker" type="text" placeholder="상영시작시간" required="required"></td></tr>
			<tr><td>상영종료시간</td><td><input name="mendhour" class="datepicker" type="text" placeholder="상영종료시간" required="required"></td></tr>
			<tr><td>가격</td><td><input name="price" type="number" min="0" max="99999" placeholder="가격" required="required">원</td></tr>
		</table>
		<h3>좌석 배치</h3>
		<div id="theaterSeat"></div>
		<input type="submit" value="등록">
	</form>
</div>