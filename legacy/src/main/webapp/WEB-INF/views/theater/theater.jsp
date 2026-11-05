<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="theater">
<img class="bg" src="./resources/img/theaterbg.png">
	<div class="theater_wrap">
		<div class="city_menu">
			<ul>
				<li><a class="all" href="#" onclick="showTheater('전체',null)">전체</a></li>
				<c:forEach var="cnameBean" items="${cnameList}">
					<li><a class="cname" href="#" onclick="showTheater('${cnameBean.cname}',null)">${cnameBean.cname}</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="location_menu">
		</div>
		
		<div align="center" id="theatercontent">
		<table class="theaterListTable table table-hover"  style="width: 100%;">
			<thead style=" border-bottom: 5px solid #017467;"><tr>
				<th>도시이름</th>
				<th>지역이름</th>
				<th>영화관이름</th>
				<th>영화관종류</th>
				<th>좌석개수</th>
			</tr></thead>
			<tbody class="theaterlist">
			</tbody>
				
		</table>
		</div>
	</div>
</div>