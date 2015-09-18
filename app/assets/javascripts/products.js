  $(document).ready(function () {
    $('#new_modal').click(function (event) {
      $("#modal-window").html("<%= escape_javascript(render 'products/form', new_product: @product_a ) %>");
    });
  });
