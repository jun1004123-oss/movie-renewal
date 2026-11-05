<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
         
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<div id="qna">
<img class="bg" src="./resources/img/customerbg.png">
<div class="qna-wrap" align="center">
	<form action="qnaEdit.do" method="get">
	<input name="qna_id" type="hidden" value="${bean.qna_id}">
		<table class="qnainputtable">
			<tr>
				<th Colspan="2">
					<i class="fa fa-pencil fa-lg" style="color:#C71B1B;"></i> 글 수정
				</th>
			</tr>
			
			<tr>
				<td>사용자</td>
				<td><input name="userid" type="text" readonly style="width: 180px;" value="${NowUser}"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="title" type="text" required style="width: 397px;"  value="${bean.title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
				<textarea rows="11" cols="45" name="contents" required> ${bean.contents}</textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="수정" style=" margin-top: -10px;">
		<input type="button" value="목록" onclick="location.href='qnaList.do'" style=" margin-top: -10px;">
		
	</form>
</div>
</div>
	
	
<%-- 	
<div id="qna">
<img class="bg" src="./resources/img/customerbg.png">
<div class="qna-wrap">
	<form action="qnaEdit.do" method="get">
		<input name="qna_id" type="hidden" value="${bean.qna_id}">
		<table>
			<tr>
				<td>제목 : </td>
				<td><input name="title" type="text" value="${bean.title}"></td>
			</tr>
			<tr>
				<td>내용 : </td>
				<td><input name="contents" type="text" value="${bean.contents}"></td>
			</tr>
			<tr><td colspan="2" align="center">
				<input type="submit" value="수정">
			</td></tr>
		</table>
	</form>
</div>
</div> --%>