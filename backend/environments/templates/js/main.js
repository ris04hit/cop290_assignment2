var next_url = "home.html"

$(function(){
    $("#header").load("{{url_for('header')}}"); 
  });

$(document).ready(function(){
    var href = document.location.href;
    var lastPathSegment = href.substr(href.lastIndexOf('/') + 1);
    if (lastPathSegment === "{{url_for('signup')}}"){
        $("#not_show_signup").hide();
    }

    $("#rect_home, #home").hover(function(){
        $("#rect_home").css("background-color", "#B6EADA");
        $("#home").css("color", "#03001C");
        }, function(){
        $("#rect_home").css("background-color", "#03001C");
        $("#home").css("color", "#FFFFFF");
      });

      $("#rect_about, #about").hover(function(){
        $("#rect_about").css("background-color", "#B6EADA");
        $("#about").css("color", "#03001C");
        }, function(){
        $("#rect_about").css("background-color", "#03001C");
        $("#about").css("color", "#FFFFFF");
      });

      $("#rect_apis, #apis").hover(function(){
        $("#rect_apis").css("background-color", "#B6EADA");
        $("#apis").css("color", "#03001C");
        }, function(){
        $("#rect_apis").css("background-color", "#03001C");
        $("#apis").css("color", "#FFFFFF");
      });

      $("#profile_rect, #profile_photo, #profile_name").hover(function(){
        $("#profile_rect").css("background-color", "#8F00FF");
        }, function(){
        $("#profile_rect").css("background-color", "#03001C");
      });      

      $(".close_pop").hover(function(){
        $(this).css("color", "#FFFAFA");
      }, function(){
        $(this).css("color", "#7F7F7F");
      })
})