<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="reservationList" align="center">
	<table class="table table-hover"  style="width: 80%; margin-top: 100px;">
		<thead style=" border-bottom: 5px solid #017467;"><tr><th>회원ID</th><th>영화제목</th><th>도시</th><th>지역</th><th>일반</th><th>청소년</th><th>가격</th><th>시간</th><th>좌석</th></tr></thead>
		<c:forEach var="revBean" items="${reservationList}">
			<tr>
				<td>${revBean.userid}</td>
				<td>${revBean.name_k}</td>
				<td>${revBean.cname}</td>
				<td>${revBean.lname}</td>
				<td>${revBean.adult}</td>
				<td>${revBean.children}</td>
				<td>${revBean.pricecomma}</td>
				<td><fmt:formatDate value="${revBean.mstarthour}" pattern="yyyy-MM-dd HH:mm"/> </td>
				<td>${revBean.seat}</td>
			</tr>
		</c:forEach>
	</table>
</div>

