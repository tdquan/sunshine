setTimeout(function start (){

  $('.red-bar-chart').each(function(i){
    var $redbarchart = $(this);
    // rise up the consumption
    $redbarchart.animate({
      height: $redbarchart.attr('data-percent')
    },{
      duration: 2000,
      specialEasing: {
        height: "easeOutBounce"
      }
    });
    // display the label
   $redbarchart.find(".bar-chart-label").delay(1000).show(3000, "easeOutBounce");
  });


}, 500)
