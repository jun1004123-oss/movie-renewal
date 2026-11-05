<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div id="memberwrap">
		<table id="membertable">
			<tr>
				<th Colspan="2">
					<i class="fa fa-pencil fa-lg" style="color:#C71B1B;"></i> 회원정보
				</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" readonly="readonly" value="${member.userid}">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" readonly="readonly" value="${member.name}">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="text" name="gender" readonly="readonly" value="${member.gender}"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<input type="text" id="birth" name="birth" readonly="readonly" value="${year}/${month}/${day}">
				</td>
			</tr>
			<tr>
				<td>우편번호</td>
			  <td>
					<input type="text" id="postcode" name="postcode" readonly="readonly" value="${member.zipcode}">
					<input type="text" id="address" name="address" readonly="readonly" value="${member.address1}"><br>
				<input type="text" id="address2" name="address2" readonly="readonly" value="${member.address2}">
				</td>
	 		</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="email" class="ta" readonly="readonly" value="${member.email}">
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
					<input type="text" name="tel" class="ta" readonly="readonly" value="${member.telnum}">
				</td>
			</tr>
			<tr>
				<td>포인트</td>
				<td><input type="text" name="point" class="ta" readonly="readonly" value="${member.point}"></td>
			</tr>
			
			<tr>
				<td>프로필 사진</td>
				<td>
				<div class="profile200 img-circle">
					<img src="./resources/img/member/${member.img_file}"  onload="resize(this)">
				</div>
				</td>
			</tr>
		</table>
					<input type="button" value="수정하기" onclick="location.href='memberPreEdit.do'">
					<input type="button" value="회원탈퇴" onclick="location.href='memberDelete.do'">
</div>
	
	