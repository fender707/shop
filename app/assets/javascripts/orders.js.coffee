jQuery ->
  states = $('#order_state_id').html()
  $('#order_country_id').change ->
    country = $('#order_country_id :selected').text()
    options = $(states).filter("optgroup[label=#{country}]").html()
    if options
      $('#order_state_id').html(options)
      $('#order_state_id').parent().show()
    else
      $('#order_state_id').empty()
      $('#order_state_id').parent().hide()
