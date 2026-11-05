<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
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
</script>


<div id="movie"><div id="movie2">
<img class="bg" src="./resources/img/moviesbg.png">
<div class="movie-wrap">
<div align="center" id="moviesbt">
	<button class="nowmovie selected" type="button" value="nowmovie">현재상영작</button>
	<button class="nextmovie" type="button" value="nextmovie">상영예정작</button>
</div>
<div class="nowmoviepage">
	<ul>
		<c:forEach  var="bean" items="${nowmovie}">
		<li class=item>
			<div class="movieNum_${bean.MOVIE_ID }">
			<div class="poster-wrap" onmouseover="posterhover(${bean.MOVIE_ID}, '${NowUser}', '${bean.AVG}', '${bean.AVG_NUM}','now')" onmouseleave="posterleave(${bean.MOVIE_ID})">
				<img class="poster" src="./resources/img/movie/${bean.POSTER }" onclick="moviedetail(${bean.MOVIE_ID}, '${NowUser}', 'now')">
				<div><input class="poster_star rating" type="number" min=0 max=10 step=1 data-size="xs" data-show-clear="false" data-show-caption="false" onmouseover="starID('${NowUser}', ${bean.MOVIE_ID})"></div>
				<div class="poster_like"><button type="button" onclick="poster_likeplus(${bean.MOVIE_ID}, '${NowUser}')" class="likebt"><i class="fa fa-heart"></i></button></div>
			</div>
			<c:if test="${bean.rn <= 5}"> <span class="rank">${bean.rn}</span> </c:if>
			<c:if test="${bean.rn > 5}"> <span class="rank_empty"></span> </c:if>
			<div class="AVG-wrap"><div class="AVG">평점 ${bean.AVG }</div><div class="star-empty"><span class="star-wrap"  style="width:${13.1*bean.AVG} ;"><span class="star"></span></span></div></div>
			<div class="title-wrap"><img class="AGE" src="./resources/img/movie/movie${bean.AGE}.png"><div class="title">${bean.NAME_K}</div></div>
		 	<button class="detail" onclick="moviedetail(${bean.MOVIE_ID}, '${NowUser}', 'now')">상세정보</button><button class="rev" onclick="revmove('${NowUser}', '${bean.MOVIE_ID}', '${bean.NAME_K}', '${bean.AGE}')">예매하기</button>
		 	</div>
		 </li>
		 </c:forEach>
	</ul>
</div>
<div class="nextmoviepage">
	<ul>
		<c:forEach  var="bean" items="${nextmovie}">
		<li class=item>
			<div class="movieNum_${bean.MOVIE_ID }">
			<div class="poster-wrap" onmouseover="posterhover(${bean.MOVIE_ID}, '${NowUser}', '${bean.AVG}', '${bean.AVG_NUM}','next')" onmouseleave="posterleave(${bean.MOVIE_ID})">
				<img class="poster" src="./resources/img/movie/${bean.POSTER }" onclick="moviedetail(${bean.MOVIE_ID}, '${NowUser}', 'next')">
				<div class="poster_like"><button type="button" onclick="poster_likeplus(${bean.MOVIE_ID}, '${NowUser}')" class="likebt"><i class="fa fa-heart"></i></button></div>
			 </div>
			 <span class="rank_empty"></span>
			<div class="AVG-wrap"><div class="AVG"><fmt:formatDate value="${bean.STARTDATE }" pattern="yyyy-MM-dd"/> </div><span class="dday">D-${bean.dday}</span></div>
			<div class="title-wrap"><img class="AGE" src="./resources/img/movie/movie${bean.AGE }.png"><div class="title">${bean.NAME_K}</div></div>
		 	<button class="detail" onclick="moviedetail(${bean.MOVIE_ID}, '${NowUser}', 'next')">상세정보</button><button class="rev" onclick="revmove('${NowUser}', '${bean.MOVIE_ID}', '${bean.NAME_K}', '${bean.AGE}')">예매하기</button>
		 	</div>
		 </li>
		 </c:forEach>
	</ul>
</div>
</div>
</div>

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
				<a class="d_revbt" type="button" href="#" onclick="">예매하기</a>
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
            <div style="position: absolute; top: 0; left: 0; width: 100%; height:100%; background-color: #000; filter:alpha(opacity=30.0); opacity:0.3;"></div>
            <!-- Thumbnail Item Skin Begin -->
            <div u="slides" style="cursor: default; width:920px; height:80px;">
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

<!-- 지우지 말것 --></div><!-- 지우지 말것 -->















