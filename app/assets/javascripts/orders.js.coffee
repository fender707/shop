jQuery ->
  $('#order_state_id').parent().hide()
  states = ('#order_state_id').html()
  $('#order_country_id').change ->
    country = $('#order_country_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    if options
      $('#order_state_id').html(options)
      $('#order_state_id').parent().show()
    else
      $('#order_state_id').empty()
      $('#order_state_id').parent().hide()
