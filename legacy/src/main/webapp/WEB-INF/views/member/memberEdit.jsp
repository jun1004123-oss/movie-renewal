<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<script type="text/javascript">
$(document).ready(function(){ 
	if($('#gender').val()=='남'){
		$('#man').attr("checked", "checked");
	}else{$('#woman').attr("checked", "checked");}
	idchecked = true;
	});
	
</script>
<div id="memverEditWarp">
	<form name="insert" method="post" enctype="multipart/form-data" onsubmit="return check()" action="memberEdit.do">
		<table id="memberEdittable">
			<tr>
				<th Colspan="2">
					<i class="fa fa-pencil fa-lg" style="color:#C71B1B;"></i> 회원정보수정
				</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input  type="text" name="userid" id=checkId value="${member.userid}" readonly>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type=password name=userpw onblur="pass()" placeholder="비밀번호" >
					<span  id="ch_pw1"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td>
					<input type=password name=userpw2 placeholder="비밀번호 확인" onblur="pass1()" >
					<span id="ch_pw2"></span>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type=text name=name placeholder="이름" value="${member.name}">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="hidden" id="gender" value="${member.gender}">
					<input type=radio id=man name=gender value=male >남자 
	 			 	<input type=radio id=woman name=gender value=female readonly="readonly">여자 </td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<input type="text" id="year" name="year" value="${year}" onblur="yearcheck()">
					<input type="text" id="month" name="month" value="${month}" onblur="monthcheck()">
					<input type="text" id="day" name="day" value="${day}" onblur="daycheck()">
				</td>
			</tr>
			<tr>
			 	<td>우편번호</td>
			  <td>
					<input type="text" id="postcode" name="zipcode" placeholder="우편번호" readonly="readonly" value="${member.zipcode}">
					<input class="zipcodesearch" type="button" onclick="execDaumPostcode()" value="우편번호 찾기" ><br>
					<input type="text" id="address" name="address1" placeholder="주소" readonly="readonly" value="${member.address1}"><br>
					<input type="text" id="address2" name="address2" placeholder="상세주소" value="${member.address2}">
				</td>
	 		</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type=text name=email onblur="emailcheck()" placeholder="이메일" value="${member.email}">
					<span id="email"></span>
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
					<input type=text name=telnum onblur="telcheck()" placeholder="연락처" value="${member.telnum}">
					<span id=telnum></span>
				</td>
			</tr>
			<tr>
				<td>프로필 사진</td>
				<td style="padding-bottom: 4px;">
				<input type="text" id="fileName" class="file_input_textbox" readonly="readonly" style="width:285px;" placeholder="프로필사진">
					<div class="file_input_div">
					<input type="button" value="파일선택" class="file_input_button" />
					<input type="file" name=upload title="파일을 선택하세요" class="file_input_hidden" onchange="javascript: document.getElementById('fileName').value = this.value" />
					</div>
				</td>
			</tr>
		</table>
	</form>
					<input onclick="check()" type="button" value="수정">
					<input onclick="document.insert.reset();" type=button value="취소">
</div>
