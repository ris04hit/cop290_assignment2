$(document).ready(function(){
    // Get Started
    $("#button_start1").click(function(){
        var left = $(document).outerWidth() - $(window).width();
        $('body, html').animate({
            scrollLeft: left
        })
    });

    $("#text_start7").click(function(){
        $("#forgot_start").show();

    })

    // close forgot password
    $("#close_pop_start").click(function(){
        $("#forgot_start").hide();
    })

    //hover forgot
    $("#text_start7").hover(function(){
        $("#text_start7").css("color","rgba(250, 0, 255, 0.809443)");
    }, function(){
        $("#text_start7").css("color","#3300FF");
    })
});