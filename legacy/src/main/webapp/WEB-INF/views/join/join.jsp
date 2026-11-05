<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div id="joinwrap">
	<form name="insert" method="post" enctype="multipart/form-data" onsubmit="return check()" action="join.do">
		<table id="jointable">
			<tr>
				<th Colspan="2">
					<i class="fa fa-pencil fa-lg" style="color:#C71B1B;"></i> 회원가입
				</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input  type="text" name="userid" id=checkId placeholder="아이디">
					<input  type=button value="ID중복확인" class="joinIdcheckBtn">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type=password name=userpw onblur="pass()" placeholder="비밀번호">
					&nbsp;<span  id="ch_pw1"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td>
					<input type=password name=userpw2 onblur="pass1()" placeholder="비밀번호 확인">
					&nbsp;<span id="ch_pw2"></span>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type=text name=name placeholder="이름">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type=radio id=man name=gender value=male>남자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type=radio id=woman name=gender value=female>여자 </td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<input  type="text" id="year" name="year" onblur="yearcheck()" placeholder="년도">
					<input  type="text" id="month" name="month" onblur="monthcheck()" placeholder="월">
					<input  type="text" id="day" name="day" onblur="daycheck()" placeholder="일">
				</td>
			</tr>
			<tr>
				<td>우편번호</td>
			  <td>
					<input type="text" id="postcode" name="zipcode" placeholder="우편번호" readonly="readonly">
					<input class="zipcodesearch" type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="address" name="address1" placeholder="주소" readonly="readonly"><br>
					<input type="text" id="address2" name="address2" placeholder="상세주소" >
				</td>
	 		</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type=text name=email onblur="emailcheck()" placeholder="이메일">
					<span id="email"></span>
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
					<input type=text name=telnum onblur="telcheck()" placeholder="연락처">
					<span id=telnum></span>
				</td>
			</tr>
			<tr>
				<td>프로필 사진</td>
				<td style="padding-bottom: 4px;">
				<input type="text" id="fileName" class="file_input_textbox" readonly="readonly" style="width:285px;">
					<div class="file_input_div">
					<input type="button" value="파일선택" class="file_input_button" />
					<input type="file" name=upload title="파일을 선택하세요" class="file_input_hidden" onchange="javascript: document.getElementById('fileName').value = this.value" />
					</div>
				</td>
				<!-- <td><input type=file class="filebt" name=upload value=img placeholder="프로필사진"></td> -->
			</tr>
		</table>
	</form>
					<input onclick="check()" type="button" value="확인">
					<input onclick="document.insert.reset();" type=button value="취소">
	
</div>
