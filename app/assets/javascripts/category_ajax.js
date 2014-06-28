$(document).ready(function(){
    $('#categories-box').on('click','li', function(event){
        $('li','#categories-box').removeClass('active');
        $(this).addClass('active');
    });
});


