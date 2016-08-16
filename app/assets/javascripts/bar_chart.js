setTimeout(function start (){

  $('.bar1').each(function(i){
    var $bar1 = $(this);
    $(this).append('<span class="count"></span>')
    setTimeout(function(){
      $bar1.css('height', $bar1.attr('data-percent'));
    }, i*100);
  });

$('.count').each(function () {
    $(this).prop('Counter',0).animate({
        Counter: $(this).parent('.bar1').attr('data-percent')
    }, {
        duration: 2000,
        easing: 'swing',
        step: function (now) {
            $(this).text(Math.ceil(now) +'%');
        }
    });
});

}, 500)
