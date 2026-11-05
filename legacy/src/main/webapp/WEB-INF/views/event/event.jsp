<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div id="event">
<img class="bg" src="./resources/img/eventbg.png">
<div class="event-wrap">
<div align="center" id="eventsbt">
	<button class="nowevent selected" type="button" value="nowmovie">현재 이벤트</button>
	<button class="endevent" type="button" value="nextmovie">지난 이벤트</button>
</div>
<div class="noweventpage">
	<ul>
		<c:forEach  var="now" items="${nowevent}">
			<li class="list">
				<img class="e_poster" onclick="eventdetail('${now.event_id}')" src="./resources/img/event/${now.poster }">
				<div class="title-wrap"><div class="e_title">${now.title}</div></div>
				<div class="term"><fmt:formatDate value="${now.e_start}" pattern="yyyy-MM-dd"/>~<fmt:formatDate value="${now.e_end}" pattern="yyyy-MM-dd"/></div>
			</li>
		</c:forEach>
	</ul>
</div>
<div class="endeventpage">
	<ul>
		<c:forEach  var="bean" items="${endevent}">
			<li class="list">
				<img class="e_poster" onclick="eventdetail(${bean.event_id})" src="./resources/img/event/${bean.poster }" >
				<div class="title-wrap"><div class="e_title">${bean.title}</div></div>
				<div class="term"><fmt:formatDate value="${bean.e_start}" pattern="yyyy-MM-dd"/>~<fmt:formatDate value="${bean.e_end}" pattern="yyyy-MM-dd"/></div>
			</li>
		</c:forEach>
	</ul>
</div>
</div>


<div class="eventpopup mfp-hide">         
	<div class="e_hidden">  </div>   	
	<button type='button' class='mfp-close'>×</button>
	
	<div class="e_top">	          
		<div class="e_title"> </div>  
		<div>					
			<p>
				<span class="event_id">  </span>  
				  |    
				<span class="start">  </span> 
			</p>  	
		</div>   
	</div>
	
	<div class="e_middle">	
		<div>
			<img src="./resources/img/event/img01.jpg" style="max-width: 800px;">				
		</div>					
    </div>
</div>



  
<!-- <div class='detailpopup '>
	<div class="d_hidden"></div>
	<button type='button' class='mfp-close'>×</button>
	<div class="d_top">
		<div class="d_POSTER"> <img src="./resources/img/movie/BG_poster.jpg"> </div>
		<div class="d_top_right">
			<div class="d_title">
				<div class="d_NAME_K">번개맨</div>
			</div>
			<ul class="info_wrap">
				<li><strong>개봉일</strong> : 2016.01.28</li>
			</ul>
		</div>
	</div>
	
	<div class="e_middle">							본문
		<img src="" class="e_img">				이미지
	</div>
	</div> -->
	 
	
</div> 

