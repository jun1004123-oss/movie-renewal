<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="adminMemberList" align="center">
	<table class="table table-hover"  style="width: 80%; margin-top: 100px;">
		<thead style=" border-bottom: 5px solid #017467;"><tr><th>회원ID</th><th>이름</th><th>성별</th><th>생일</th><th>전화번호</th><th>이메일</th></tr></thead>
		<c:forEach var="memberBean" items="${memberList}">
			<tr>
				<td>${memberBean.userid}</td>
				<td>${memberBean.name}</td>
				<td>${memberBean.gender}</td>
				<td>${memberBean.birth}</td>
				<td>${memberBean.telnum}</td>
				<td>${memberBean.email}</td>
			</tr>
		</c:forEach>
	</table>
</div>