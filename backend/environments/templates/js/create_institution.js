// function for autotype
function autoType(elementClass, typingSpeed, specific_class){
    var thhis = $(elementClass);
    thhis.css({
      "position": "relative",
      "display": "inline-block"
    });
    thhis.prepend('<div class="cursor" style="right: initial; left:0;"></div>');
    thhis = thhis.find(specific_class);
    var text = thhis.text().trim().split('');
    var amntOfChars = text.length;
    var newString = "";
    thhis.text("|");
    setTimeout(function(){
      thhis.css("opacity",1);
      thhis.prev().removeAttr("style");
      thhis.text("");
      for(var i = 0; i < amntOfChars; i++){
        (function(i,char){
          setTimeout(function() {        
            newString += char;
            thhis.text(newString);
          },i*typingSpeed);
        })(i+1,text[i]);
      }
    },1500);
}

// display pfp
function previewFile() {
    var preview = document.querySelector("#rect_profile_inst");
    var file    = document.querySelector('input[type=file]').files[0];
    var reader  = new FileReader();

    reader.onloadend = function () {
        preview.src = reader.result;
    }

    if (file) {
        reader.readAsDataURL(file);
        $("#text_profile_inst").css("top","476px");
    } else {
        preview.src = "";
        $("#text_profile_inst").css("top","275px");
    }
}

//auto typing
function specificType(clas,ids){
    $('.pop_up').hide();
    $(ids).show();
    autoType(".type-js",20,clas);
}

  $(document).ready(function(){
    // choosing which text to display
    $('#username_inst').focus(function(){
        specificType(".pop_inst1","#pop_inst1");
    })

    $('#email_inst').focus(function(){
        specificType(".pop_inst2","#pop_inst2");
    })

    // signup
    $('#create_institution_inst').click(function(){
        // if everything is correct
        window.location.href = "{{url_for('loader4')}}";
    })
  });