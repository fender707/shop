class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def total_price
    product.price * quantity
  end

  def action_price
    if product.title == "Ethiopian Harrar(-50% for 2 and more)" && quantity > 1 then
      product.price * quantity / 2
    elsif (product.title == "Green Tea(-2$ for 3 and more)" || product.title == "Black Tea") && quantity > 2 then
      product.price * quantity - 2
    else
      product.price * quantity
    end
  end

end
