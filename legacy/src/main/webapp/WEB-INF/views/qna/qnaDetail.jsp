<%@page import="org.springframework.context.annotation.Bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
         
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<script>
	function checkReplyContents() {
		if($('#replyContents').val() == '') {
			alert("댓글을 입력하세요.");
			return false;
		}
		return true;
	}
	
	function editQnaReply(qna_reply_id, contents) {
		if($('#editButton' + qna_reply_id).val() == "수정") {
			$('#editButton' + qna_reply_id).val("수정취소");
			$('#editContents' + qna_reply_id).val(contents);
			$('#editQnaReplyForm' + qna_reply_id).show();
			$('#qnaReplyContents' + qna_reply_id).hide();
		} else if($('#editButton' + qna_reply_id).val() == "수정취소") {
			$('#editButton' + qna_reply_id).val("수정");
			$('#editQnaReplyForm' + qna_reply_id).hide();
			$('#qnaReplyContents' + qna_reply_id).show();
		}
	}
</script>

<div id="qna">
<img class="bg" src="./resources/img/customerbg.png">
<div class="qna-wrap">
<div align="center">
	<table class="table">
	<thead> 
	 	<tr>
	 		<td>글번호</td><td>글쓴이</td><td>제목</td><td>작성일</td><td>조회수</td>
	 	</tr>
	 </thead>
		<tr>
	  	<td>${bean.qna_id}</td>
	  	<td>${bean.userid}</td>
	  	<td>${bean.title}</td>
	  	<td>${bean.wdate}</td>
			<td>${bean.count}</td>
		</tr>
		<tr style="text-align: center;">
		<td colspan="5"><textarea rows="11" name="contents" readonly style="width: 800px;">${bean.contents}</textarea></td>
		</tr>
		
		<tr><td colspan="5" style="text-align: center;">
			<table class="table detailreply" style="display: inline-block;">
				<thead> 
				<tr align="center">
					<td width = "15%">작성자</td>
					<td width = "55%">내용</td>
					<td width = "15%">작성일</td>
					<td></td>
					<td></td>
				</tr>
				</thead>
				<c:forEach var="bean" items="${replyList}">
					<tr>
						<td>${bean.userid}</td>
						<td id="editQnaReplyForm${bean.qna_reply_id}" style="display: none;">
							<form action="EditQnaReply.do">
								<input name="qna_reply_id" type="hidden" value="${bean.qna_reply_id}">
								<input name="qna_id" type="hidden" value="${bean.qna_id}">
								<input name="contents" id="editContents${bean.qna_reply_id}" type="text">
								<input type="submit" value="댓글수정">
							</form>
						</td>
						<td id="qnaReplyContents${bean.qna_reply_id}">${bean.contents}</td>
						<td>${bean.wdate}</td>
						<c:if test="${sessionScope.NowUser == bean.userid}">
							<td><input id="editButton${bean.qna_reply_id}" type="button" onclick="editQnaReply(${bean.qna_reply_id}, '${bean.contents}')" value="수정"></td>
							<td><input type="button" onclick="location.href='DeleteQnaReply.do?qna_id=${bean.qna_id}&qna_reply_id=${bean.qna_reply_id}'" value="삭제"></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</td></tr>
		<!-- 사용자가 로그인을 했을 경우 -->
		<c:if test="${sessionScope.NowUser != null}">
			<!-- 게시판 작성자가 로그인한 사용자와 일치 할 경우 -->
			<tr>
				<td colspan="6" align="center">
					<form action="qnaReplyInsert.do" onsubmit="return checkReplyContents()">
						<input name="qna_id" type="hidden" value="${bean.qna_id}">
						<input name="userid" type="hidden" value="<%= session.getAttribute("NowUser") %>">
						<input name="contents" id="replyContents" type="text" placeholder="댓글을 입력해주세요.">
						<input type="submit" value="댓글 등록"><input type="button" value="목록" onclick="location.href='qnaList.do?pagenum=${pagenum}'">
					</form>
				</td>
			</tr>
			<c:if test="${sessionScope.NowUser == bean.userid}">
				<tr>
					<td colspan="6" align="right" id="detailbt">
						<input type="button" value="수정" onclick="location.href='qnaPreEdit.do?qna_id=${bean.qna_id}'">
						<input type="button" value="삭제" onclick="location.href='qnaDelete.do?qna_id=${bean.qna_id}'">  
					</td>
				</tr>
			</c:if>
		</c:if>
	</table>
</div>
</div>
</div>