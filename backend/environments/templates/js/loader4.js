$(document).ready(function(){
    $("#inner_rect_loader").animate({
        width: "420px"
    }, 2000);
    setTimeout(function (){
        window.location.href = "{{url_for('institute')}}";
      }, 2000);
})