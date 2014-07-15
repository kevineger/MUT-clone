$(document).ready(function(){
    $('#categories-box').on('click','li', function(event){
        $('li','#categories-box').removeClass('active');
        $(this).addClass('active');
    });
});

$(document).ready(function(){
    var offset = 220;
    var duration = 500;
    $(window).scroll(function() {
        if ($(this).scrollTop() > offset) {
            $('#back-to-top').fadeIn(duration);
            console.log("Fading in");
        } else {
            $('#back-to-top').fadeOut(duration);
            console.log("Fading out");
        }
    });
});

$(document).ready(function(){
    $('#back-to-top').on('click', function(event){
    	console.log("Back to top is clicked");
        $("html, body").animate({scrollTop:0},"slow");
        return false;
    });
});


