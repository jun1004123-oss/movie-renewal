<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>

</style>

<script type="text/javascript">

$(document).ready(function(){
	$('.bottom-col .link1').hover(function(){$(".bottom-col .link1").addClass("fa-spin");});
	$('.bottom-col .link2').hover(function(){$(".bottom-col .link2").addClass("fa-spin");});
	$('.bottom-col .link3').hover(function(){$(".bottom-col .link3").addClass("fa-spin");});
	$('.bottom-col .link1').mouseleave(function(){$(".bottom-col .link1").removeClass("fa-spin");});
	$('.bottom-col .link2').mouseleave(function(){$(".bottom-col .link2").removeClass("fa-spin");});
	$('.bottom-col .link3').mouseleave(function(){$(".bottom-col .link3").removeClass("fa-spin");});
});



</script>

<div class="bottom-col">
<div class="container">
<div class="row">
  <div class="col-md-12">
  	<div class="container">
	  	<div class="col-md-4 cen">
	  		<img src="./resources/img/Gaonlogo.png" width="80px">
	  	</div>
	  	<div class="col-md-4 cen">
	  		<div class="bottomtitle">Site Map</div>
			<div class="comment cen">
				<a href="index.jsp">Home</a><br>
				<a href="movie.do">Movie</a><br>
				<a href="reservation.do">Reservation</a><br>
				<a href="theater.do">Theater</a><br>
				<a href="store.do">Store</a><br>
				<a href="event.do">Event</a><br>
				<a href="qnaList.do">Q & A</a><br>
	        </div>
	  	</div>
	  	<div class="col-md-4 cen">
	  		<div class="bottomtitle">Our Address</div>
			<div class="bottomname">
				<i class="fa fa-map-marker igray"></i> <span class="comment">63-14, Sinsu-dong, Mapo-gu, Seoul</span> <br>
				<i class="fa fa-phone igray"></i><span class="comment"> +82 3387 2200</span><br>
				<i class="fa fa-envelope igray"></i> <span class="comment">Gaoncinema16@gmail.com</span><br>
			</div>
				<i class="fa fa-facebook-square fa-3x link1"></i>&nbsp; &nbsp;
				<i class="fa fa-twitter-square fa-3x link2"></i>&nbsp; &nbsp;
				<i class="fa fa-instagram fa-3x link3"></i>
	  	</div>
  	</div>
  </div>
 </div>
</div>
</div>
 <div class="copy">copyright &copy; by Gaon.com</div>
