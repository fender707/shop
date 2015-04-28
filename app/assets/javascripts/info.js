var slider;
$(function() {
  $('h3').on('mouseenter', function(e) {
    e.preventDefault();
    $(this).parent().find('.desc').toggle();
  });
  $('h3').on('mouseleave', function(e) {
    e.preventDefault();
    $(this).parent().find('.desc').toggle();
  });

  slider = $('.bxslider').bxSlider({
    auto: true,
    controls: true,
    mode: 'horizontal'
  });
})
  

