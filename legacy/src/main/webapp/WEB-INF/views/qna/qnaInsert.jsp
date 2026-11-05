<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
         
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<div id="qna">
<img class="bg" src="./resources/img/customerbg.png">
<div class="qna-wrap" align="center">
	<form action="qnaInsert.do" method="get">
		<table class="qnainputtable">
			<tr>
				<th Colspan="2">
					<i class="fa fa-pencil fa-lg" style="color:#C71B1B;"></i> 글쓰기
				</th>
			</tr>
			<tr>
				<td>사용자</td>
				<td><input name="userid" type="text" readonly style="width: 180px;" value="${NowUser}"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="title" type="text" required style="width: 397px;"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
				<textarea rows="11" cols="45" name="contents" required></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="등록" style=" margin-top: -10px;">
		
	</form>
</div>
</div>
