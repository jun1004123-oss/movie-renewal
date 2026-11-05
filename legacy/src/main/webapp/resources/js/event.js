function eventdetail(event_id){
	$.ajax({
		url:"eventDetail.do",
		data: "event_id="+event_id,
		dataType: "json",
		type: "GET",
		success: function(data){
			$(".eventpopup .e_title").html("<h3>"+data.title+"</h3>");
			$(".eventpopup .event_id").html("No."+data.event_id);
			$(".eventpopup .start").html(data.e_start+" ~ "+data.e_end);
			$(".eventpopup .e_middle img").eq(0).attr('src', './resources/img/event/'+data.img);
			
			$.magnificPopup.open({
				  items: {
				      src: '.eventpopup',
				      type: 'inline',
				  },
				 closeBtnInside: true
			});
		},//sucess end
		error: function(data){
			alert("실패"+data);
			console.log(data);
		}
	
	});//eventdetail end
	
	
}

///////////////////////////////////////////////////////////////////////

var NowUser ="";
var starNum;
var AVG;
var AVG_NUM;


function userIDsave(id){
	NowUser = id;
}

function starID(id, Num){
	NowUser = id;
	starNum = Num;
}
$(document).ready(function(){ 
	$('.endeventpage').hide(); 
});
$(document).ready(function(){ 
    $('.nowevent').click(function(){
            $('.endeventpage').hide();     
            $('.noweventpage').show();
            $('.endevent').removeClass('selected');
            $('.nowevent').addClass('selected');
    });
    
    $('.endevent').click(function(){
            $('.noweventpage').hide();     
            $('.endeventpage').show();
            $('.nowevent').removeClass('selected');
            $('.endevent').addClass('selected');
    });
});

function decode(data){
	var Ca = /\+/g;
	var result = decodeURIComponent(data).replace(Ca, " ");
	return result;
}










