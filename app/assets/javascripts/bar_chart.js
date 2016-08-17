setTimeout(function start (){

  $('.red-bar-chart').each(function(i){
    var $redbarchart = $(this);
    $(this).append('<span class="bar-chart-count"></span>')
    setTimeout(function(){
      $redbarchart.css('height', $redbarchart.attr('data-percent'));
    }, i*100);
  });

$('.bar-chart-count').each(function () {
    $(this).prop('Counter',0).animate({
        Counter: $(this).parent('.red-bar-chart').attr('data-percent')
    }, {
        duration: 2000,
        easing: 'swing',
        step: function (now) {
            $(this).text(Math.ceil(now) +'%');
        }
    });
});

}, 500)
