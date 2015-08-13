class OrderPdf < Prawn::Document
  def initialize(order)
    super( top_margin: 70)
    @order = order
    order_number
    address_order
  end

  def order_number
    text "Order \##{@order.id}", size: 30, style: :bold
  end
 
  def address_order
    move_down 20
    table address_order_rows
  end

  def address_order_rows
    [["Name","Address","Email","Country_id","State_id"]] +
    [[@order.name,
    @order.address,
    @order.email,
    @order.country_id,
    @order.state_id,
    ]]
  end
end
