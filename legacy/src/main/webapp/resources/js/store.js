$(document).ready(function(){ 
    $('.popcorn').click(function(){
            $('.drinkpage').hide();     
            $('.snackpage').hide();     
            $('.combopage').hide();     
            $('.giftpage').hide();     
            $('.popcornpage').show();
            $('.popcorn').css({"background-color" : "#017467", "color" : "#fff"});
            $('.drink').css({"background-color" : "transparent", "color" : "#017467"});
            $('.snack').css({"background-color" : "transparent", "color" : "#017467"});
            $('.combo').css({"background-color" : "transparent", "color" : "#017467"});
            $('.gift').css({"background-color" : "transparent", "color" : "#017467"});
    });
    
    $('.drink').click(function(){
        $('.snackpage').hide();     
        $('.combopage').hide();     
        $('.giftpage').hide();     
        $('.popcornpage').hide();
        $('.drinkpage').show();     
        $('.drink').css({"background-color" : "#017467", "color" : "#fff"});
        $('.popcorn').css({"background-color" : "transparent", "color" : "#017467"});
        $('.snack').css({"background-color" : "transparent", "color" : "#017467"});
        $('.combo').css({"background-color" : "transparent", "color" : "#017467"});
        $('.gift').css({"background-color" : "transparent", "color" : "#017467"});
    });
    $('.snack').click(function(){
    	$('.drinkpage').hide();     
    	$('.combopage').hide();     
    	$('.giftpage').hide();     
    	$('.popcornpage').hide();
    	$('.snackpage').show();     
    	$('.snack').css({"background-color" : "#017467", "color" : "#fff"});
    	$('.popcorn').css({"background-color" : "transparent", "color" : "#017467"});
    	$('.drink').css({"background-color" : "transparent", "color" : "#017467"});
    	$('.combo').css({"background-color" : "transparent", "color" : "#017467"});
    	$('.gift').css({"background-color" : "transparent", "color" : "#017467"});
    });
    $('.combo').click(function(){
    	$('.drinkpage').hide();     
    	$('.snackpage').hide();     
    	$('.giftpage').hide();     
    	$('.popcornpage').hide();
    	$('.combopage').show();     
    	$('.combo').css({"background-color" : "#017467", "color" : "#fff"});
    	$('.popcorn').css({"background-color" : "transparent", "color" : "#017467"});
    	$('.snack').css({"background-color" : "transparent", "color" : "#017467"});
    	$('.drink').css({"background-color" : "transparent", "color" : "#017467"});
    	$('.gift').css({"background-color" : "transparent", "color" : "#017467"});
    });
    $('.gift').click(function(){
    	$('.drinkpage').hide();     
    	$('.snackpage').hide();     
    	$('.combopage').hide();     
    	$('.popcornpage').hide();
    	$('.giftpage').show();     
    	$('.gift').css({"background-color" : "#017467", "color" : "#fff"});
    	$('.popcorn').css({"background-color" : "transparent", "color" : "#017467"});
    	$('.snack').css({"background-color" : "transparent", "color" : "#017467"});
    	$('.combo').css({"background-color" : "transparent", "color" : "#017467"});
    	$('.drink').css({"background-color" : "transparent", "color" : "#017467"});
    });
});

function decode(data){
	var Ca = /\+/g;
	var result = decodeURIComponent(data).replace(Ca, " ");
	return result;
}

function storeDetail(store_id) {
	var Ca = /\+/g;
	$.ajax({
		url: "StoreDetail.do",
		data: "store_id=" +store_id,
		dataType: "json",
		type: "GET",
		success: function(data) { 
				$(".storeDtail .store_POSTER").html('<img src="./resources/img/store/'+decode(data.imgfile)+'">');
				$(".storeDtail .store_title").html(decode(data.title));
				$(".storeDtail .store_subtitle").html(decode(data.subtitle));
				$(".storeDtail .storeinfo_wrap li").eq(0).html('<strong>가격</strong> : '+data.price);
				$(".storeDtail .storeinfo_wrap li").eq(1).html('<strong>상품설명</strong> : '+decode(data.content));
		},
		error: function(data) {
			alert(data);
			console.log(data);
		}
	});
	//asdasd수정용
	
	$.magnificPopup.open({
		  items: {
		      src: '.storeDtail',
		      type: 'inline',
		  },
		 closeBtnInside: true
	});
}

function storeBuy(store_id,user) {
	if(user==null || user=="" || user==''){
		g_alert("로그인후 이용하세요.");
		return;
	}else{
		var url = "buy.do?id="+store_id;
		$(location).attr('href',url);
	}
}
