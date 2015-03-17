$ ->
  $('h3').on 'mouseenter', (e) ->
    e.preventDefault()
    $(this).parent().find('.desc').toggle()
  $('h3').on 'mouseleave', (e) ->
    e.preventDefault()
    $(this).parent().find('.desc').toggle()
 
