setTimeout(function start (){

  $('.red-bar-chart').each(function(i){
    var $redbarchart = $(this);
    // rise up the consumption
    $redbarchart.animate({
      height: $redbarchart.attr('data-percent')
    }, 2000, "swing"
    );
    // display the label
    $redbarchart.find(".bar-chart-label").delay(1000).show(3000, "easeOutBounce");
  });


}, 500)
