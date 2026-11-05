<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div id="store">
<img class="bg" src="./resources/img/storebg.png">
<div class="store-wrap">
<div align="center" id="moviesbt">
	<button class="popcorn selected" type="button" value="popcorn">팝콘</button>
	<button class="drink" type="button" value="drink">음료</button>
	<button class="snack" type="button" value="snack">스낵</button>
	<button class="combo" type="button" value="combo">콤보</button>
	<button class="gift" type="button" value="gift">영화 관람권</button>
</div>
<div class="popcornpage">
	<ul>
	<c:forEach  var="list" items="${StoreList}">
	<c:if test="${list.type eq 'popcorn' }">
		<li class=item>
			<img class="storeimg" src="./resources/img/store/${list.img_file }">
			<div class="title-wrap"><div class="subtitle"> ${list.subtitle} </div><br><div class="title">${list.title}</div></div>
		 	<button class="detail" onclick="storeDetail('${list.store_id}')">상세정보</button>
		 	<button class="rev" onclick="storeBuy(${list.store_id},'${NowUser }')">구매하기</button>
		 </li>
		 </c:if>
	</c:forEach>
	</ul>
</div>
<div class="drinkpage">
	<ul>
	<c:forEach  var="list" items="${StoreList}">
	<c:if test="${list.type eq 'drink' }">
		<li class=item>
			<img class="storeimg" src="./resources/img/store/${list.img_file }">
			<div class="title-wrap"><div class="subtitle"> ${list.subtitle} </div><br><div class="title">${list.title}</div></div>
		 	<button class="detail" onclick="storeDetail('${list.store_id}')">상세정보</button>
		 	<button class="rev" onclick="storeBuy(${list.store_id},'${NowUser }')">구매하기</button>
		 </li>
		 </c:if>
	</c:forEach>
	</ul>
</div>
<div class="snackpage">
	<ul>
	<c:forEach  var="list" items="${StoreList}">
	<c:if test="${list.type eq 'snack' }">
		<li class=item>
			<img class="storeimg" src="./resources/img/store/${list.img_file }">
			<div class="title-wrap"><div class="subtitle"> ${list.subtitle} </div><br><div class="title">${list.title}</div></div>
		 	<button class="detail" onclick="storeDetail('${list.store_id}')">상세정보</button>
		 	<button class="rev" onclick="storeBuy(${list.store_id},'${NowUser }')">구매하기</button>
		 </li>
		 </c:if>
	</c:forEach>
	</ul>
</div>
<div class="combopage">
	<ul>
	<c:forEach  var="list" items="${StoreList}">
	<c:if test="${list.type eq 'combo' }">
		<li class=item>
			<img class="storeimg" src="./resources/img/store/${list.img_file }">
			<div class="title-wrap"><div class="subtitle"> ${list.subtitle} </div><br><div class="title">${list.title}</div></div>
		 	<button class="detail" onclick="storeDetail('${list.store_id}')">상세정보</button>
		 	<button class="rev" onclick="storeBuy(${list.store_id},'${NowUser }')">구매하기</button>
		 </li>
		 </c:if>
	</c:forEach>
	</ul>
</div>
<div class="giftpage">
	<ul>
	<c:forEach  var="list" items="${StoreList}">
	<c:if test="${list.type eq 'gift' }">
		<li class=item>
			<img class="storeimg" src="./resources/img/store/${list.img_file }">
			<div class="title-wrap"><div class="subtitle"> ${list.subtitle} </div><br><div class="title">${list.title}</div></div>
		 	<button class="detail" onclick="storeDetail('${list.store_id}')">상세정보</button>
		 	<button class="rev" onclick="storeBuy(${list.store_id},'${NowUser }')">구매하기</button>
		 </li>
		 </c:if>
	</c:forEach>
	</ul>
</div>



</div>

<div class='storeDtail mfp-hide'>
	<div class="d_hidden"></div>
	<button type='button' class='mfp-close'>×</button>
	<div class="store_top">
		<div class="store_POSTER"> <img src="#"> </div>
		<div class="store_top_right">
			<div class="store_name">
				<div class="store_subtitle">subtitle</div>
				<div class="store_title">title</div>
			</div>
			<ul class="storeinfo_wrap">
				<li><strong>가격</strong> : 99999</li>
				<li><strong>상품설명</strong> : 쉐이크 팝콘 체다치즈맛(대)
새로운 맛을 찾고 있는 분들에게 강력 추천!
오직 CGV에서만 즐길 수 있는 어디에도 없는 팝콘!</li>
				<li><strong>사용가능극장</strong> : 전국</li>
				<li><strong>유효기간</strong> : 구매 후 6개월 이내</li>
			</ul>
		</div>
	</div>
	
	</div>

</div>
