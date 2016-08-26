$('#set-up-panel').click(function(){
  $(this).parent().hide();
  $('#solar-setup-card-content').hide();
  $(this).parent().next().fadeIn(500);
  setTimeout(function () {
    $("#detecting-panel").hide();
    $("#detecting-panel").next().fadeIn(500);
  }, 3000);
})





