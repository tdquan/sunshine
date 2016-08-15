//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
//= require underscore
//= require gmaps/google


$('button.add-address-button').click(function(){$(".address-pop-up").removeClass('hidden')});

var array1 = [40, 20, 60, 70, 100];
var array2 = [40, 20, 60, 70, 20];
var timelag = 10

var height1 = 0;
var heigth2 = 0;


var i = 1;                     //  set your counter to 1

function runner () {           //  create a loop function
   setTimeout(function () {    //  call a 3s setTimeout when the loop is called
      height1 = array1[i];     //  your code here
      $('#bar-1').css('height', height1 + "%");
      height2 = array2[i];
      $('#bar-2').css('height', height2 + "%");
      i++;                     //  increment the counter
      if (i < 5) {            //  if the counter < 10, call the loop function
         runner();             //  ..  again which will trigger another
      }                        //  ..  setTimeout()
   }, 3000)
}

runner();





var height2 = $('#bar-2').html();

$('#bar-2').css('height', height2 + "%");
