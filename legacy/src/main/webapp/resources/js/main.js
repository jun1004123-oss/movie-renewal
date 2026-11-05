

$(document).ready(function(){ 
    $('#mainmovie .nowmovie').click(function(){
            $('#mainmovie .nextmoviepage').hide();     
            $('#mainmovie .nowmoviepage').show();
            $('#mainmovie .nextmovie').removeClass('selected');
            $('#mainmovie .nowmovie').addClass('selected');
    });
    
    $('#mainmovie .nextmovie').click(function(){
            $('#mainmovie .nowmoviepage').hide();     
            $('#mainmovie .nextmoviepage').show();
            $('#mainmovie .nowmovie').removeClass('selected');
            $('#mainmovie .nextmovie').addClass('selected');
    });
});