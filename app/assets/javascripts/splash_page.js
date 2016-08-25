$('#splash-page-box-btn').click(function(){
  $(this).hide();
  $('.splash-page-field.address').fadeIn(500);
})

$('#next').click(function(){
  $(this).parent().hide();
  $(this).parent().next().fadeIn(500);
})

$('#back').click(function(){
  $(this).parent().hide();
  $(this).parent().prev().fadeIn(500);
})
