var slider;
$(function() { 

  slider = $('.bxslider').bxSlider({
    auto: true,
    controls: true,
    mode: 'horizontal'
  });

  $(".entry > img").click(function() {
    $(this).find(':submit').click();
  });

  $("#notice").hide();

})
  

