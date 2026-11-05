<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

$(document).ready(function(){
	$('.fotorama').fotorama({ height: screensize()});
});
$(document).ready(z);$(window).scroll(z);function z(){var q=navigator.userAgent.toLowerCase();if(q.indexOf("chrome")!=-1||q.indexOf("safari")!=-1||q.indexOf("opera")!= -1||q.indexOf("firefox")!= -1){}else{alert("크롬을 사용해서 페이지를 열어주세요");close();} };

window.onresize = function() {
	$('.fotorama').fotorama({ height: screensize()});};

function screensize(){
	var screensize = window.innerHeight
	|| document.documentElement.clientHeight
	|| document.body.clientHeight;
	screensize = screensize-174 +"px";
	return screensize;
}
<c:if test="${not empty ok }">
g_alert("${ok}");
<%
session.removeAttribute("ok");  
%>
</c:if>

$(document).ready(function(){
    
    var jssor_1_options = {
      $AutoPlay: true,
      $ArrowNavigatorOptions: {
        $Class: $JssorArrowNavigator$
      },
      $ThumbnailNavigatorOptions: {
        $Class: $JssorThumbnailNavigator$,
        $Cols: 9,
        $SpacingX: 3,
        $SpacingY: 3,
        $Align: 260
      }
    };
    
    var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);
    
    //responsive code begin
    //you can remove responsive code if you don't want the slider scales while window resizing
    function ScaleSlider() {
        var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
        if (refSize) {
            refSize = Math.min(refSize, 920);
            jssor_1_slider.$ScaleWidth(refSize);
        }
        else {
            window.setTimeout(ScaleSlider, 30);
        }
    }
    ScaleSlider();
    $(window).bind("load", ScaleSlider);
    $(window).bind("resize", ScaleSlider);
    $(window).bind("orientationchange", ScaleSlider);
    //responsive code end
});

$().ready(function(){
	$('article').flipcarousel({
		pagination : false,
		loader : true,
		itemsperpage: 4,
		randomizer: 1
	});
});

</script>
	<div class="fotorama"
  	 	data-fit = "cover" data-autoplay="6000" data-transition="dissolve"
		data-arrows="true" data-click="true" data-swipe="true" data-trackpad="true" data-loop="true" 
		style="margin: 0;">
	  <div data-img="./resources/img/panda_1600x600.jpg" class="banner-text" ><div>쿵푸팬더3</div><div class="banner-text2">쿵푸 마스터로 나선 '포'! 팬더 인생 최대의 도전이 시작된다!</div></div>
	  <div data-img="./resources/img/kumsa_1600x600.jpg" class="banner-text" ><div>검사외전</div><div class="banner-text2">검사와 사기꾼의 유쾌한 버디플레이!</div></div>
	  <div data-img="./resources/img/dongju_1600x600.jpg" class="banner-text" ><div>동주</div><div class="banner-text2">빛나는 미완의 청춘 우리가 기억해야 할 이름</div></div>
	  <div data-img="./resources/img/turandot_1600x600.jpg" class="banner-text" ><div>투란도트</div><div class="banner-text2">브레겐츠 페스티벌 70주년 기념작</div></div>
	  <div data-img="./resources/img/zoo_1600x600.jpg" class="banner-text" ><div>주토피아</div><div class="banner-text2">이것은 애니메이션의 신세계!</div></div>
	</div>
	
<div id="movie"><div id="mainmovie">
<div class="movie-wrap">
<div class="nowmoviepage">
		<c:forEach  var="bean" items="${nowmovie}">
	<article title="item${bean.rn}">
	<ul style="padding:0;">
		<li class=item>
			<div class="movieNum_${bean.MOVIE_ID }">
			<div class="poster-wrap" onmouseover="posterhover(${bean.MOVIE_ID}, '${NowUser}', '${bean.AVG}', '${bean.AVG_NUM}','now')" onmouseleave="posterleave(${bean.MOVIE_ID})">
				<img class="poster" src="./resources/img/movie/${bean.POSTER }" onclick="moviedetail(${bean.MOVIE_ID}, '${NowUser}', 'now')">
				<div style="margin-top: 0px;"><input class="poster_star rating" type="number" min=0 max=10 step=1 data-size="xs" data-show-clear="false" data-show-caption="false" onmouseover="starID('${NowUser}', ${bean.MOVIE_ID})"></div>
				<div class="poster_like"><button type="button" onclick="poster_likeplus(${bean.MOVIE_ID}, '${NowUser}')" class="likebt"><i class="fa fa-heart"></i></button></div>
			</div>
			<c:if test="${bean.rn <= 5}"> <span class="rank">${bean.rn}</span> </c:if>
			<c:if test="${bean.rn > 5}"> <span class="rank_empty"></span> </c:if>
			<div class="AVG-wrap"><div class="AVG">평점 ${bean.AVG }</div><div class="star-empty"><span class="star-wrap"  style="width:${13.1*bean.AVG} ;"><span class="star"></span></span></div></div>
			<div class="title-wrap"><img class="AGE" src="./resources/img/movie/movie${bean.AGE}.png"><div class="title">${bean.NAME_K}</div></div>
		 	<button class="detail" onclick="moviedetail(${bean.MOVIE_ID}, '${NowUser}', 'now')">상세정보</button><button class="rev">예매하기</button>
		 	</div>
		 </li>
	</ul>
	</article>
		 </c:forEach>
</div>
</div>


<div class="mainevent"><img src="./resources/img/mainevent.png"></div>

<div class='detailpopup mfp-hide'>
	<div class="d_hidden"></div>
	<button type='button' class='mfp-close'>×</button>
	<div class="d_top">
		<div class="d_POSTER"> <img src=""> </div>
		<div class="d_top_right">
			<div class="d_title">
				<div class="d_AGE"><img src="./resources/img/movie/movie12.png"></div>
				<div class="d_NAME_K">번개맨</div>
				<div class="d_NAME_E">Bungaeman</div>
			</div>
			<div class="d_rev">
				<div class="popupstar"><div class="star-empty"><span class="star-wrap"  style="width:118;"><span class="star"></span></span></div>
				<div class="d_AVG">7.5</div><div class="d_AVG_NUM">(10명 참여)</div></div>
				<a class="d_revbt" type="button" href="#">예매하기</a>
			</div>
			<ul class="info_wrap">
				<li><strong>개봉일</strong> : 2016.01.28</li>
				<li><strong>감독</strong> : 알레산드로 칼로니, 여인영</li>
				<li><strong>출연진</strong> : 더스틴 호프만<span>(시푸)</span>,&nbsp;데이빗 크로스<span>(크레인)</span>,&nbsp;루시 리우<span>(바이퍼)</span>,&nbsp;성룡<span>(몽키)</span>,&nbsp;세스 로건<span>(맨티스)</span>,&nbsp;안젤리나 졸리<span>(타이그리스)</span>,&nbsp;잭 블랙<span>(포)</span>,&nbsp;J.K. 시몬스<span>(카이)</span></li>
				<li><strong>장르</strong> : 액션, 애니메이션, 어드벤처 / 95 분</li>
				<li><strong>공식홈페이지</strong> : </li>
			</ul>
			<div class="d_rate" onclick="userIDsave(${NowUser})">
			<input id="detailstar" type="number" class=" rating" min=0 max=10 step=1 data-size="xs" data-show-clear="false">
			</div>
			<div class="like"><button type="button" onclick="likeplus()" class="likebt">찜하기</button></div>
		</div>
	</div>
	<div class="d_middle">
		<strong>줄거리</strong> :  기다려... 우리가 꼭 데리러 갈게...<br><br> 해발 8,750 미터 히말라야 에베레스트 데스존<br> 인간의 접근을 허락하지 않은 신의 영역 그곳에 우리 동료가 묻혀있다.<br> 산 아래 하나였고, 또 다른 가족이었던 사람들<br> 생을 마감한 후배 대원의 시신을 찾기 위해 기록도, 명예도, 보상도 없는 가슴 뜨거운 여정을 시작한다. 그 누구도 시도하지 않았던 위대한 도전 엄홍길 대장과 휴먼원정대의 감동 실화가 공개된다! 
	</div>
	
    <div id="jssor_1" style="position: relative; margin: 80px auto 50px; top: 0px; left: 0px; width: 920px; height: 580px; overflow: hidden; visibility: hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
            <div style="position:absolute;display:block;background:url('./img/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
        </div>
        <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 920px; height: 580px; overflow: hidden;">
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="./resources/img/movie/BG_01.jpg" />
            </div>
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="./resources/img/movie/BG_02.jpg" />
            </div>
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="./resources/img/movie/BG_03.jpg" />
            </div>
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="./resources/img/movie/BG_04.jpg" />
            </div>
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="./resources/img/movie/BG_05.jpg" />
            </div>
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="./resources/img/movie/BG_06.jpg" />
            </div>
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="./resources/img/movie/BG_07.jpg" />
            </div>
        </div>
        <!-- Thumbnail Navigator -->
        <div u="thumbnavigator" class="jssort03" style="position:absolute;left:0px;top:-80px;width:920px;height:80px;" data-autocenter="1">
            <div style="position: absolute; top: 0; left: 0; width: 100%; height:100%; background-color: #D6BA8A000; filter:alpha(opacity=30.0); opacity:0.3;"></div>
            <!-- Thumbnail Item Skin Begin -->
            <div u="slides" style="cursor: default; width:920px; height:80px;" data-hello="asdf">
                <div u="prototype" class="p" style="width:130px; height:80px;">
                    <div class="w" style="width:130px; height:80px;">
                        <div u="thumbnailtemplate" class="t" style="width:130px; height:80px;"></div>
                    </div>
                    <div class="c" style="width:130px; height:80px;"></div>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
        </div>
        <!-- Arrow Navigator -->
        <span data-u="arrowleft" class="jssora02l" style="top:200px;left:8px;width:55px;height:55px;" data-autocenter="2"></span>
        <span data-u="arrowright" class="jssora02r" style="top:200px;right:8px;width:55px;height:55px;" data-autocenter="2"></span>
    </div>
    <div class="youtube_wrap">
    <iframe width="920" height="518" src="https://www.youtube.com/embed/9FS0YFIJU7Q?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
	</div>
	</div>
</div> 
</div>
</div>










