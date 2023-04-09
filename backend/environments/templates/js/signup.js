// function for autotype
let shouldstop = false

function autoType(elementClass, typingSpeed, specific_class, content){
    var thhis = $(elementClass);
    thhis.css({
      "position": "relative",
      "display": "inline-block"
    });
    thhis.prepend('<div class="cursor" style="right: initial; left:0;"></div>');
    thhis = thhis.find(specific_class);
    var text = content;
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
            if (shouldstop) {thhis.text("");return;}  
            newString += char;
            thhis.text(newString);
          },i*typingSpeed);
        })(i+1,text[i]);
      }
    },1500);
}

// display pfp
function previewFile() {
    var preview = document.querySelector("#rect_profile_signup");
    var file    = document.querySelector('input[type=file]').files[0];
    var reader  = new FileReader();

    reader.onloadend = function () {
        preview.src = reader.result;
    }

    if (file) {
        reader.readAsDataURL(file);
        $("#text_profile_signup").css("top","506px");
    } else {
        preview.src = "";
        $("#text_profile_signup").css("top","306px");
    }
}

//auto typing
// function specificType(clas,ids){
//     $('.pop_up').hide();
//     $(ids).show();
//     autoType(".type-js",20,clas);
// }

function specType(content){
    // $("#pop_sign1").hide();
    $("#pop_sign1").show();
    shouldstop = true;
    setTimeout(function(){
      shouldstop = false;
      autoType(".type-js",20,".pop_signup1", content);
    }, 50)
}

$(document).ready(function(){
    // choosing which text to display
    $('#username_signup').focus(function(){
        // specificType(".pop_signup1","#pop_sign1");
        specType("Username should be unique and only contain alphabets, numerals and underscore (_)");
    })

    $('#email_signup').focus(function(){
        // specificType(".pop_signup2","#pop_sign2");
        specType("Email id should be a valid email to recieve OTP");
    })

    $('#otp_signup').focus(function(){
      // specificType(".pop_signup2","#pop_sign2");
      specType("Enter the OTP recieved at your email");
    })

    $('#password_signup').focus(function(){
      // specificType(".pop_signup2","#pop_sign2");
      specType("Password strength should be high. Use mixture of numbers, symbols and alphabets having different cases");
    })

    $('#confirm_signup').focus(function(){
      // specificType(".pop_signup2","#pop_sign2");
      specType("Confirm Password should match Password. Do not copy paste password in this field. Type it manually.");
    })

    $('#name_signup').focus(function(){
      // specificType(".pop_signup2","#pop_sign2");
      specType("Enter your beautiful name");
    })

    $('#org_signup').focus(function(){
      // specificType(".pop_signup2","#pop_sign2");
      specType("Enter the name of organization you want to display on your profile");
    })

    // signup
    $('#create_account_signup').click(function(){
        // if everything is correct
        window.location.href = "{{url_for('loader3')}}";
    })
});