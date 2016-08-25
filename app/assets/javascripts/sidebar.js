// Find out which tab is active and give it an orange bg color

$(".profile-usermenu-item").find('a').each(function(){
  if ($(this).attr('href') == window.location.pathname) {
    $(this).parent().addClass('sidebar-active');
  }
})
