<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%-- <% session.getAttribute("NowUser");  %>
<% session.getAttribute("Nowname");  %>
<% session.getAttribute("Nowpoint");  %>
<% session.getAttribute("Nowimg");  %>
<% session.getAttribute("Nowpath");  %>
<% session.getAttribute("ok");  %> --%>
<html>
<head> 
	<title>가온시네마</title>
	
	<link rel="shotcut icon" href="./resources/img/favicon.ico">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<link href="./resources/css/bootstrap.css" rel="stylesheet">
	<link href="./resources/css/bootstrap-select.css" rel="stylesheet">
	<link href="./resources/css/fotorama.css" rel="stylesheet">
	<link href="./resources/css/jquery.datePicker.css" rel="stylesheet">
	<link href="./resources/css/bootstrap-theme.css" rel="stylesheet">
	<link href="./resources/css/header.css" rel="stylesheet">
	<link href="./resources/css/main.css" rel="stylesheet">
	<link href="./resources/css/footer.css" rel="stylesheet">
	<link href="./resources/css/theater.css" rel="stylesheet">
	<link href="./resources/css/admin.css" rel="stylesheet">
	<link href="./resources/css/event.css" rel="stylesheet">
	<link href="./resources/css/reservation.css" rel="stylesheet">
	<link href="./resources/css/step2.css" rel="stylesheet">
	<link rel="stylesheet" href="./resources/css/magnific-popup.css">
	<link href="./resources/css/join.css" rel="stylesheet">
	<link href="./resources/css/member.css" rel="stylesheet">
	<link href="./resources/css/memberEdit.css" rel="stylesheet">
	<link href="./resources/css/qna.css" rel="stylesheet">
	<link href="./resources/css/buy.css" rel="stylesheet">
	<link href="./resources/css/checkrev.css" rel="stylesheet">
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<script src="./resources/js/bootstrap-select.js"></script>
	<script src="./resources/js/fotorama.js"></script>
	<script src="./resources/js/jquery.datePicker.js"></script>
	<script src="./resources/js/jquery.magnific-popup.js"></script>
	<script src="./resources/js/header.js"></script>
	<script src="./resources/js/event.js"></script>
	<script src="./resources/js/buy.js"></script>
	<link href="./resources/css/store.css" rel="stylesheet">
	<script src="./resources/js/store.js"></script>
	<script type="text/javascript" src="./resources/js/jssor.slider.mini.js"></script>
	<link href="./resources/css/movie.css" rel="stylesheet">
	<script src="./resources/js/movie.js"></script>
	<script src="./resources/js/main.js"></script>
	<script src="./resources/js/theater.js"></script>
	<link href="./resources/css/flip-carousel.css" rel="stylesheet">
	<script src="./resources/js/flip-carousel.js"></script>
	<link href="./resources/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
	<script src="./resources/js/star-rating.js" type="text/javascript"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="./resources/js/join.js"></script>
	<script src="./resources/js/step2.js"></script>
	<script type="text/javascript" src="./resources/js/jssor.slider.mini.js"></script>
	
</head>
<body>
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<div id="main">
		<tiles:insertDefinition name="${page}"/>
	</div>
	
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>