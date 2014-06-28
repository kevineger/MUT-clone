$(document).ready(function(){
    $('#categories-box').on('click','li', function(event){
        $('li','#categories-box').removeClass('active');
        var atag = $('a',$(this));

        var category = atag.text();
        var id = atag.data('id');
        $.ajax({
            type: "GET",
            url: "classifieds/1/page",
            success: function(data){
                $('#category-section').append(data);
            }
        });
        $(this).addClass('active');
        return false;
    });
});


