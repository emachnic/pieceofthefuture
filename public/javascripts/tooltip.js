$(document).ready(function(){
  
  $('.box_link_left').tooltip({
    effect: 'fade',
    delay: 100,
    position: 'center right',
    offset: [-100, -40]
  });

  $('.box_link_right').tooltip({
    effect: 'fade',
    delay: 100,
    position: 'center left',
    offset: [-100, -40]
  });
})