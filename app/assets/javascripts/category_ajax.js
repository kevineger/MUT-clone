$(document).ready(function(){
    $('#categories-box').on('click','li', function(event){
        $('li','#categories-box').removeClass('active');
        $(this).addClass('active');
    });
});
$(document).ready(function(){
    $('#back-to-top').on('click', function(event){
    	console.log("Back to top is clicked");
        $("html, body").animate({
 		scrollTop:0
 		},"slow");
    });
});


