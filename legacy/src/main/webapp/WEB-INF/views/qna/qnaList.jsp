<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
         
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<div id="qna">
<img class="bg" src="./resources/img/customerbg.png">
<div class="qna-wrap" align="center">
	<div class="tabletitle"><i class="fa fa-pencil fa-lg" style="color:#C71B1B;"></i> 고객센터
		<div class="tablesearch">
			<form action="qnaList.do">
				<select name="skey">
					<option value="userid">글쓴이</option>
					<option value="title">제목</option>
				</select>
				<input type="text" name="sval" style="width: 200px;" placeholder="여기에 검색하실 제목을 적어주세요.">
				<input type="submit" value="검색">
			</form>
		</div>
	</div>
	 <table class="table table-hover">
		 <thead> 
		 	<tr>
		 		 <th width="10%">글번호</th> <th width="20%">글쓴이</th> <th width="40%">제목</th>   
		  		 <th width="20%">작성일</th> <th width="10%">조회수</th>
		 	</tr>
	 	</thead>
	 	<!-- 데이터 출력 부분 -->
	 	<c:choose>
		 	<c:when test="${empty list}">
		 	<tr>
		 		<td colspan=5 align="center">
		 		  등록된 데이타가 없습니다
		 		</td>
		 	</tr>
		 	</c:when> 
		 	<c:otherwise>
			 	<c:forEach var="bean" items="${list}">
				<tr>
			  		<td> ${bean.rn} </td>
			  		<td> ${bean.userid} </td>
			  		<td><a href="qnaDetail.do?qna_id=${bean.qna_id}&pagenum=${pagenum}">${bean.title}</a></td>
			  		<td> ${bean.wdate} </td>
			  		<td> ${bean.count} </td>
				</tr>	 	
				</c:forEach>
		 	</c:otherwise>
	 	</c:choose>
	 	
		</table>
		<!-- 페이징 부분 -->
		
		<c:if test="${not empty NowUser}">
			<input type="button" value="게시글 작성" onclick="location.href='qnaPreInsert.do'">
		</c:if>
		
		<nav>
		  <ul class="pagination pagination-sm">
		  <c:if test="${pagelistnum > 1}">
		    <li><a href="qnaList.do?pagenum=${pagestart - pagelistsize}${returnstring}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
		   </c:if>
		   
		   <c:forEach var="i" begin="${pagestart}" end="${pageend}" step="1">
					<c:choose>
						<c:when test="${i == pagenum}">
							 <li class="active"><a href="#">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="qnaList.do?pagenum=${i}${returnstring}">${i}</a></li>
						</c:otherwise>
					</c:choose>
			</c:forEach>
		    <!-- <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li> -->
		   <c:if test="${pagelistnum < pagelisttotal}">
		    <li><a href="qnaList.do?pagenum=${pageend + 1}${returnstring}" aria-label="Next"><span aria-hidden="true">&raquo; </span></a></li>
		   </c:if>
		  </ul>
		</nav>
	</div>
</div>


